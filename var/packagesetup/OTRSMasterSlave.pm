# --
# Copyright (C) 2001-2015 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package var::packagesetup::OTRSMasterSlave;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Cache',
    'Kernel::System::DB',
    'Kernel::System::DynamicField',
    'Kernel::System::DynamicField::Backend',
    'Kernel::System::DynamicFieldValue',
    'Kernel::System::LinkObject',
    'Kernel::System::Log',
    'Kernel::System::SysConfig',
    'Kernel::System::Ticket',
);

=head1 NAME

OTRSMasterSlave.pm - code to execute during package installation

=head1 SYNOPSIS

Functions for installing the OTRSMasterSlave package.

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object. Do not use it directly, instead use:

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $CodeObject = $Kernel::OM->Get('var::packagesetup::OTRSMasterSlave');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # rebuild ZZZ* files
    $Kernel::OM->Get('Kernel::System::SysConfig')->WriteDefault();

    # define the ZZZ files
    my @ZZZFiles = (
        'ZZZAAuto.pm',
        'ZZZAuto.pm',
    );

    # reload the ZZZ files (mod_perl workaround)
    for my $ZZZFile (@ZZZFiles) {

        PREFIX:
        for my $Prefix (@INC) {
            my $File = $Prefix . '/Kernel/Config/Files/' . $ZZZFile;
            next PREFIX if !-f $File;
            do $File;
            last PREFIX;
        }
    }

    # get dynamic fields list
    $Self->{DynamicFieldsList} = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
        Valid      => 0,
        ObjectType => ['Ticket'],
    );

    if ( !IsArrayRefWithData( $Self->{DynamicFieldsList} ) ) {
        $Self->{DynamicFieldsList} = [];
    }

    # create a dynamic field lookup table (by name)
    DYNAMICFIELD:
    for my $DynamicField ( @{ $Self->{DynamicFieldsList} } ) {
        next DYNAMICFIELD if !$DynamicField;
        next DYNAMICFIELD if !IsHashRefWithData($DynamicField);
        next DYNAMICFIELD if !$DynamicField->{Name};
        $Self->{DynamicFieldLookup}->{ $DynamicField->{Name} } = $DynamicField;
    }

    return $Self;
}

=item CodeInstall()

run the code install part

    my $Result = $CodeObject->CodeInstall();

=cut

sub CodeInstall {
    my ( $Self, %Param ) = @_;

    # if we got an installed version of MasterSlave, migrate the data
    # otherwise set the dynamic fields
    my $MasterSlaveDynamicFieldID = $Self->_CheckMasterSlaveData();
    if ($MasterSlaveDynamicFieldID) {

        $Self->_MigrateOTRSMasterSlave(
            DynamicFieldID => $MasterSlaveDynamicFieldID,
            MasterSlave    => 1,
        );
    }
    else {
        $Self->_SetDynamicFields();
    }

    # set dashboard config if needed
    $Self->_SetDashboardConfig();

    return 1;
}

=item CodeReinstall()

run the code reinstall part

    my $Result = $CodeObject->CodeReinstall();

=cut

sub CodeReinstall {
    my ( $Self, %Param ) = @_;

    return 1;
}

=item CodeUpgrade()

run the code upgrade part

    my $Result = $CodeObject->CodeUpgrade();

=cut

sub CodeUpgrade {
    my ( $Self, %Param ) = @_;

    $Self->_SetDynamicFields();

    # set dashboard config if needed
    $Self->_SetDashboardConfig();

    return 1;
}

=item CodeUpgrade125()

run the code upgrade part for versions prior to 1.2.5

    my $Result = $CodeObject->CodeUpgrade125();

=cut

sub CodeUpgrade125 {
    my ( $Self, %Param ) = @_;

    # upgrade/migrate only in case there is a installed
    # version of OTRSMasterSlave version < 1.2.5
    $Self->_MigrateOTRSMasterSlave();

    return 1;
}

=item CodeUninstall()

run the code uninstall part

    my $Result = $CodeObject->CodeUninstall();

=cut

sub CodeUninstall {
    my ( $Self, %Param ) = @_;

    $Self->_RemoveDynamicFields();

    return 1;
}

sub _SetDynamicFields {
    my ( $Self, %Param ) = @_;

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get dynamic field names from SysConfig
    my $MasterSlaveDynamicField = $ConfigObject->Get('MasterSlave::DynamicField') || 'MasterSlave';

    # set attributes of new dynamic fields
    my %NewDynamicFields = (
        $MasterSlaveDynamicField => {
            Name       => $MasterSlaveDynamicField,
            Label      => 'Master Ticket',
            FieldType  => 'MasterSlave',
            ObjectType => 'Ticket',
            Config     => {
                DefaultValue       => '',
                PossibleNone       => 1,
                TranslatableValues => 1,
            },
            InternalField => 1,
        },
    );

    # set MaxFieldOrder (needed for adding new dynamic fields)
    my $MaxFieldOrder = 0;
    if ( !IsArrayRefWithData( $Self->{DynamicFieldsList} ) ) {
        $MaxFieldOrder = 1;
    }
    else {
        DYNAMICFIELD:
        for my $DynamicFieldConfig ( @{ $Self->{DynamicFieldsList} } ) {
            if ( int $DynamicFieldConfig->{FieldOrder} > int $MaxFieldOrder ) {
                $MaxFieldOrder = $DynamicFieldConfig->{FieldOrder}
            }
        }
    }

    # get dynamic field object
    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');

    for my $NewFieldName ( sort keys %NewDynamicFields ) {

        # check if dynamic field already exists
        if ( IsHashRefWithData( $Self->{DynamicFieldLookup}->{$NewFieldName} ) ) {

            # get the dynamic field configuration
            my $DynamicFieldConfig = $Self->{DynamicFieldLookup}->{$NewFieldName};

            my $Update;

            # update field configuration if it was other than MasterSlave (e.g. Dropdown)
            if ( $DynamicFieldConfig->{FieldType} ne 'MasterSlave' ) {
                my $ID = $DynamicFieldConfig->{ID};
                %{$DynamicFieldConfig} = ( %{$DynamicFieldConfig}, %{ $NewDynamicFields{$NewFieldName} } );
                $Update = 1;
            }

            # if dynamic field exists make sure is valid
            if ( $DynamicFieldConfig->{ValidID} ne '1' ) {
                $Update = 1;
            }

            if ($Update) {

                my $Success = $DynamicFieldObject->DynamicFieldUpdate(
                    %{$DynamicFieldConfig},
                    ValidID => 1,
                    Reorder => 0,
                    UserID  => 1,
                );

                if ( !$Success ) {
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'error',
                        Message  => "Could not set dynamic field '$NewFieldName' to valid!",
                    );
                }
            }
            if ( $DynamicFieldConfig->{InternalField} ne '1' ) {

                # update InternalField value manually since API does not support
                # internal_field update
                my $Success = $Kernel::OM->Get('Kernel::System::DB')->Do(
                    SQL => '
                        UPDATE dynamic_field
                        SET internal_field = 1
                        WHERE id = ?',
                    Bind => [ \$DynamicFieldConfig->{ID} ],
                );
                if ( !$Success ) {
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'error',
                        Message  => "Could not set dynamic field '$NewFieldName' as internal!",
                    );
                }

                # clean dynamic field cache
                $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
                    Type => 'DynamicField',
                );
            }
        }

        # otherwise create it
        else {
            $MaxFieldOrder++;
            my $ID = $DynamicFieldObject->DynamicFieldAdd(
                %{ $NewDynamicFields{$NewFieldName} },
                FieldOrder => $MaxFieldOrder,
                ValidID    => 1,
                UserID     => 1,
            );

            if ( !$ID ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Could not add dynamic field '$NewFieldName'!",
                );
            }
        }
    }

    # enable dynamic field for ticket zoom
    # get old configuration
    my $WindowConfig = $ConfigObject->Get('Ticket::Frontend::AgentTicketZoom');
    my %DynamicFields = %{ $WindowConfig->{DynamicField} || {} };

    $DynamicFields{$MasterSlaveDynamicField} =
        defined $DynamicFields{$MasterSlaveDynamicField}
        ? $DynamicFields{$MasterSlaveDynamicField}
        : 1;

    $Kernel::OM->Get('Kernel::System::SysConfig')->ConfigItemUpdate(
        Valid => 1,
        Key   => 'Ticket::Frontend::AgentTicketZoom###DynamicField',
        Value => \%DynamicFields,
    );

    return 1;
}

sub _MigrateOTRSMasterSlave {
    my ( $Self, %Param ) = @_;

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get dynamic field names from SysConfig
    my $MasterSlaveDynamicField = $ConfigObject->Get('MasterSlave::DynamicField')
        || 'MasterSlave';

    # check if there isn't already a dynamic field with the destined name
    return 1 if IsHashRefWithData( $Self->{DynamicFieldLookup}->{$MasterSlaveDynamicField} );

    my $OldMasterSlaveDynamicFieldID;

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # check if we got a DynamicFieldID
    if ( $Param{DynamicFieldID} ) {
        $OldMasterSlaveDynamicFieldID = $Param{DynamicFieldID};
    }
    else {

        # if not: get the migrated field ID by searching for possible data
        $DBObject->Prepare(
            SQL => "SELECT dfv.field_id FROM dynamic_field_value dfv "
                . "WHERE dfv.value_text LIKE 'SlaveOf:%' OR dfv.value_text = 'Master'",
            Limit => 1,
        );

        while ( my @Row = $DBObject->FetchrowArray() ) {
            $OldMasterSlaveDynamicFieldID = $Row[0];
        }
    }

    # check if we found a valid ID
    return 0 if !$OldMasterSlaveDynamicFieldID;

    if ( $Param{MasterSlave} ) {
        $Self->_MigrateMasterSlaveData(
            DynamicFieldID => $OldMasterSlaveDynamicFieldID,
        );
    }

    # get dynamic field object
    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');

    # try to get the dynamic field  data (for field order etc.)
    my $OldDynamicField = $DynamicFieldObject->DynamicFieldGet(
        ID => $OldMasterSlaveDynamicFieldID,
    );

    return 0 if !IsHashRefWithData($OldDynamicField);

    # update the name of the dynamic field to MasterSlave and store it
    # and return the result of this function
    return 0 if !$DynamicFieldObject->DynamicFieldUpdate(
        %{$OldDynamicField},
        Name       => $MasterSlaveDynamicField,
        Label      => 'Master Ticket',
        FieldType  => 'MasterSlave',
        ObjectType => 'Ticket',
        Config     => {
            DefaultValue       => '',
            PossibleNone       => 1,
            TranslatableValues => 1,
        },
        InternalField => 1,
        ValidID       => 1,
        Reorder       => 0,
        UserID        => 1,
    );

    # update InternalField value manually since API does not support internal_field update
    my $Success = $DBObject->Do(
        SQL => '
            UPDATE dynamic_field
            SET internal_field = 1
            WHERE id = ?',
        Bind => [ \$OldMasterSlaveDynamicFieldID->{ID} ],
    );
    if ( !$Success ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Could not set dynamic field '$MasterSlaveDynamicField' as internal!",
        );
    }

    # clean dynamic field cache
    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
        Type => 'DynamicField',
    );

    # activate the DynamicField in ticket details block
    my $KeyString       = "Ticket::Frontend::AgentTicketZoom";
    my $ExistingSetting = $ConfigObject->Get($KeyString) || {};
    my %ValuesToSet     = %{ $ExistingSetting->{DynamicField} || {} };
    $ValuesToSet{MasterSlave} = 1;
    return $Kernel::OM->Get('Kernel::System::SysConfig')->ConfigItemUpdate(
        Valid => 1,
        Key   => $KeyString . "###DynamicField",
        Value => \%ValuesToSet,
    );
}

sub _CheckMasterSlaveData {
    my ( $Self, %Param ) = @_;

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # if not: get the migrated field ID by searching for possible data
    $DBObject->Prepare(
        SQL   => "SELECT dfv.field_id FROM dynamic_field_value dfv WHERE dfv.value_text = 'Slave'",
        Limit => 1,
    );

    my $OldMasterSlaveDynamicFieldID;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $OldMasterSlaveDynamicFieldID = $Row[0];
    }

    return $OldMasterSlaveDynamicFieldID;
}

sub _MigrateMasterSlaveData {
    my ( $Self, %Param ) = @_;

    if ( !$Param{DynamicFieldID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need DynamicFieldID for MasterSlave data migration!",
        );
        return;
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # get all the slave ticket ids we have to update
    $DBObject->Prepare(
        SQL => "
            SELECT dfv.object_id
            FROM dynamic_field_value dfv
            WHERE dfv.value_text = 'Slave'
                AND dfv.field_id = ?",
        Bind  => [ \$Param{DynamicFieldID} ],
        Limit => 50,
    );

    my @DynamicFieldData;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        push( @DynamicFieldData, $Row[0] );
    }

    # try to get the dynamic field data for setting new value
    my $DynamicFieldConfig = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldGet(
        ID => $Param{DynamicFieldID},
    );

    return if !IsHashRefWithData($DynamicFieldConfig);

    # loop over the ticket ids we have to update
    OLDSLAVESTYLE:
    for my $TicketID (@DynamicFieldData) {

        # get linked objects
        my $LinkListWithData = $Kernel::OM->Get('Kernel::System::LinkObject')->LinkListWithData(
            Object    => 'Ticket',
            Key       => $TicketID,
            State     => 'Valid',
            Type      => 'ParentChild',
            Direction => 'Source',
            UserID    => 1,
        );

        # check what tickets might be the master
        my @ParentTicketIDs = keys %{ $LinkListWithData->{Ticket}->{ParentChild}->{Source} };

        my $TicketNumber;

        # if we got more than one possible master ticket, try to determine which
        # one is the master we are looking for
        if ($#ParentTicketIDs) {

            $DBObject->Prepare(
                SQL => "
                    SELECT dfv.object_id
                    FROM dynamic_field_value dfv
                    WHERE dfv.value_text = 'Master'
                        AND dfv.field_id = ?
                        AND dfv.object_id IN ("
                    . join( ',', map { $DBObject->Quote($_) } @ParentTicketIDs )
                    . ')',
                Bind  => [ \$Param{DynamicFieldID} ],
                Limit => 1,
            );

            my @ParentTicketIDs;
            while ( my @Row = $DBObject->FetchrowArray() ) {
                push( @ParentTicketIDs, $Row[0] );
            }

            if ($#ParentTicketIDs) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message =>
                        "Couldn't determine MasterTicket for TicketID $TicketID (Possible Masters: "
                        . join ', ', @ParentTicketIDs
                        . ")!",
                );
            }

            $TicketNumber = $Kernel::OM->Get('Kernel::System::Ticket')->TicketNumberLookup(
                TicketID => $ParentTicketIDs[0],
                UserID   => 1,
            );
        }
        else {
            $TicketNumber = $LinkListWithData->{Ticket}{ParentChild}{Source}{ $ParentTicketIDs[0] }
                {TicketNumber};
        }

        # update the dynamic field value to valid
        # data for OTRSMasterSlave
        my $Success = $Kernel::OM->Get('Kernel::System::DynamicField::Backend')->ValueSet(
            DynamicFieldConfig => $DynamicFieldConfig,
            ObjectID           => $TicketID,
            Value              => 'SlaveOf:' . $TicketNumber,
            UserID             => 1,
        );

        if ( !$Success ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Error while migrating MasterSlave DynamicField '"
                    . $Param{DynamicFieldID}
                    . "' for TicketID '"
                    . $TicketID
                    . "'!",
            );
            return;
        }
    }

    # do some recursion if we got more than 50 slave tickets in this run
    # doing this to have a better performance
    if ( 50 == scalar @DynamicFieldData ) {
        my $Success = $Self->_MigrateMasterSlaveData(
            DynamicFieldID => $Param{DynamicFieldID},
        );

        if ( !$Success ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Error while migrating MasterSlave data!",
            );
            return;
        }
    }

    return 1;
}

sub _RemoveDynamicFields {
    my ( $Self, %Param ) = @_;

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get dynamic field names from SysConfig
    my $MasterSlaveDynamicField = $ConfigObject->Get('MasterSlave::DynamicField') || 'MasterSlave';

    # check if dynamic field already exists
    if ( IsHashRefWithData( $Self->{DynamicFieldLookup}->{$MasterSlaveDynamicField} ) ) {

        # get the field ID
        my $DynamicFieldID = $Self->{DynamicFieldLookup}->{$MasterSlaveDynamicField}->{ID};

        # delete all field values
        my $ValuesDeleteSuccess = $Kernel::OM->Get('Kernel::System::DynamicFieldValue')->AllValuesDelete(
            FieldID => $DynamicFieldID,
            UserID  => 1,
        );

        if ($ValuesDeleteSuccess) {

            # delete field
            my $Success = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldDelete(
                ID      => $DynamicFieldID,
                UserID  => 1,
                Reorder => 1,
            );

            if ( !$Success ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Could not delete dynamic field '$MasterSlaveDynamicField'!",
                );
            }
        }
        else {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Could not delete values for dynamic field '$MasterSlaveDynamicField'!",
            );
        }
    }

    # disable dynamic field for ticket zoom
    # get old configuration
    my $WindowConfig = $ConfigObject->Get('Ticket::Frontend::AgentTicketZoom');
    my %DynamicFields = %{ $WindowConfig->{DynamicField} || {} };

    if ( defined $DynamicFields{$MasterSlaveDynamicField} ) {
        $DynamicFields{$MasterSlaveDynamicField} = 0;
    }

    $Kernel::OM->Get('Kernel::System::SysConfig')->ConfigItemUpdate(
        Valid => 1,
        Key   => 'Ticket::Frontend::AgentTicketZoom###DynamicField',
        Value => \%DynamicFields,
    );

    return 1;
}

sub _SetDashboardConfig {
    my ( $Self, %Param ) = @_;

    # get dynamic field names from SysConfig
    my $MasterSlaveDynamicField = $Kernel::OM->Get('Kernel::Config')->Get('MasterSlave::DynamicField') || 'MasterSlave';

    # if MasterSlave dynamic field is 'MasterSlave' the config is already set, nothing else to do
    return 1 if ( $MasterSlaveDynamicField eq 'MasterSlave' );

    # otherwise set the new config
    # attributes common for both Master and Slave widgets
    my %CommonConfig = (
        Module        => 'Kernel::Output::HTML::DashboardTicketGeneric',
        Filter        => 'All',
        Time          => 'Age',
        Limit         => 10,
        Permission    => 'rw',
        Block         => 'ContentLarge',
        Group         => '',
        Default       => 1,
        CacheTTLLocal => 0.5,
    );

    # attributes for Master widget
    my %MasterConfig = (
        Title       => 'Master Tickets',
        Description => 'All master tickets',
        Attributes  => 'DynamicField_' . $MasterSlaveDynamicField . '_Equals=Master;',
    );

    # attributes for Slave widget
    my %SlaveConfig = (
        Title       => 'Slave Tickets',
        Description => 'All slave tickets',
        Attributes  => 'DynamicField_' . $MasterSlaveDynamicField . '_Like=Slave*;',
    );

    # get SysConfig object
    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');

    # write configurations
    $SysConfigObject->ConfigItemUpdate(
        Valid => 1,
        Key   => 'DashboardBackend###0900-TicketMaster',
        Value => {
            %CommonConfig,
            %MasterConfig,
        },
    );
    $SysConfigObject->ConfigItemUpdate(
        Valid => 1,
        Key   => 'DashboardBackend###0910-TicketSlave',
        Value => {
            %CommonConfig,
            %SlaveConfig,
        },
    );

    return 1;
}

1;

=back

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut
