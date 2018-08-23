# --
# Copyright (C) 2001-2018 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Language::hu_OTRSMasterSlave;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentTicketBulk
    $Self->{Translation}->{'MasterTicket'} = 'Mesterjegy';

    # Template: AgentTicketMasterSlave
    $Self->{Translation}->{'Manage Master/Slave'} = 'Mester/alárendelt kezelése';

    # SysConfig
    $Self->{Translation}->{'Allows adding notes in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Lehetővé teszi jegyzetek hozzáadását egy nagyított jegynek a jegy mester-alárendelt képernyőjén az ügyintézői felületen.';
    $Self->{Translation}->{'Change the MasterSlave state of the ticket.'} = 'Változtassa meg a jegy mester-alárendelt állapotát.';
    $Self->{Translation}->{'Define dynamic field name for master ticket feature.'} = 'Határozza meg dinamikus mező nevét a mesterjegy tulajdonságnál.';
    $Self->{Translation}->{'Defines if a ticket lock is required in the ticket MasterSlave screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).'} =
        'Meghatározza, hogy szükséges-e jegyzárolás egy nagyított jegynek a jegy mester-alárendelt képernyőjén az ügyintézői felületen (ha a jegy még nincs zárolva, akkor a jegy zárolva lesz, és az aktuális ügyintéző automatikusan annak tulajdonosaként lesz beállítva).';
    $Self->{Translation}->{'Defines the default next state of a ticket after adding a note, in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Meghatározza egy jegy alapértelmezett következő állapotát egy jegyzet hozzáadása után egy nagyított jegynek a jegy mester-alárendelt képernyőjén az ügyintézői felületen.';
    $Self->{Translation}->{'Defines the default ticket priority in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Meghatározza az alapértelmezett jegyprioritást egy nagyított jegynek a jegy mester-alárendelt képernyőjén az ügyintézői felületen.';
    $Self->{Translation}->{'Defines the default type of the note in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Meghatározza a jegyzet alapértelmezett típusát egy nagyított jegynek a jegy mester-alárendelt képernyőjén az ügyintézői felületen.';
    $Self->{Translation}->{'Defines the history comment for the ticket MasterSlave screen action, which gets used for ticket history in the agent interface.'} =
        'Azt az előzmény megjegyzést határozza meg a jegy mester-alárendelt képernyő műveleténél, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.';
    $Self->{Translation}->{'Defines the history type for the ticket MasterSlave screen action, which gets used for ticket history in the agent interface.'} =
        'Azt az előzmény típust határozza meg a jegy mester-alárendelt képernyő műveleténél, amelyet a jegy előzményeinél szoktak használni az ügyintézői felületen.';
    $Self->{Translation}->{'Defines the next state of a ticket after adding a note, in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Meghatározza egy jegy következő állapotát egy jegyzet hozzáadása után egy nagyított jegynek a jegy mester-alárendelt képernyőjén az ügyintézői felületen.';
    $Self->{Translation}->{'Enable the advanced MasterSlave part of the feature.'} = 'Engedélyezze a tulajdonság speciális mester-alárendelt részét.';
    $Self->{Translation}->{'Enable the feature that slave tickets follow the master ticket to a new master in the advanced MasterSlave mode.'} =
        'Engedélyezze a tulajdonságot, hogy az alárendelt jegyek a mesterjegyet kövessék egy új mesterhez a speciális mester-alárendelt módban.';
    $Self->{Translation}->{'Enable the feature to change the MasterSlave state of a ticket in the advanced MasterSlave mode.'} =
        'Engedélyezze a tulajdonságot egy jegy mester-alárendelt állapotának megváltoztatásához a speciális mester-alárendelt módban.';
    $Self->{Translation}->{'Enable the feature to forward articles from type \'forward\' of a master ticket to the customers of the slave tickets. By default (disabled) it will not forward articles from type \'forward\' to the slave tickets.'} =
        '';
    $Self->{Translation}->{'Enable the feature to unset the MasterSlave state of a ticket in the advanced MasterSlave mode.'} =
        'Engedélyezze a tulajdonságot egy jegy mester-alárendelt állapotának törléséhez a speciális mester-alárendelt módban.';
    $Self->{Translation}->{'If a note is added by an agent, sets the state of the ticket in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Ha egy ügyintéző hozzáadott egy megjegyzést, akkor beállítja a jegy állapotát egy nagyított jegynek a jegy mester-alárendelt képernyőjén az ügyintézői felületen.';
    $Self->{Translation}->{'Parameters for the dashboard backend of the master tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        'Paraméterek az ügyintézői felület mesterjegyei áttekintőjének vezérlőpult háttérprogramjához. A „Korlát” az alapértelmezetten megjelenített bejegyzések száma. A „Csoport” használható a hozzáférés korlátozásához a bővítményre (például Csoport: admin;csoport1;csoport2;). Az „Alapértelmezett” jelzi, ha a bővítmény alapértelmezetten engedélyezve van, vagy ha a felhasználónak kézzel kell engedélyeznie azt. A „CacheTTLLocal” a bővítmény gyorsítótár ideje percben.';
    $Self->{Translation}->{'Parameters for the dashboard backend of the slave tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        'Paraméterek az ügyintézői felület alárendelt jegyei áttekintőjének vezérlőpult háttérprogramjához. A „Korlát” az alapértelmezetten megjelenített bejegyzések száma. A „Csoport” használható a hozzáférés korlátozásához a bővítményre (például Csoport: admin;csoport1;csoport2;). Az „Alapértelmezett” jelzi, ha a bővítmény alapértelmezetten engedélyezve van, vagy ha a felhasználónak kézzel kell engedélyeznie azt. A „CacheTTLLocal” a bővítmény gyorsítótár ideje percben.';
    $Self->{Translation}->{'Registration of the ticket event module.'} = 'A jegy esemény modul regisztrációja.';
    $Self->{Translation}->{'Required permissions to use the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'A szükséges jogosultságok egy nagyított jegynek a jegy mester-alárendelt képernyőjének használatához az ügyintézői felületen.';
    $Self->{Translation}->{'Sets the default body text for notes added in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Beállítja az alapértelmezett törzsszöveget egy nagyított jegynek a jegy mester-alárendelt képernyőjén hozzáadott jegyzeteknél az ügyintézői felületen.';
    $Self->{Translation}->{'Sets the default subject for notes added in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Beállítja az alapértelmezett tárgyat egy nagyított jegynek a jegy mester-alárendelt képernyőjén hozzáadott jegyzeteknél az ügyintézői felületen.';
    $Self->{Translation}->{'Sets the responsible agent of the ticket in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Beállítja a jegy felelős ügyintézőjét egy nagyított jegynek a jegy mester-alárendelt képernyőjén az ügyintézői felületen.';
    $Self->{Translation}->{'Sets the service in the ticket MasterSlave screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).'} =
        'Beállítja a szolgáltatást egy nagyított jegynek a jegy mester-alárendelt képernyőjén az ügyintézői felületen (a Ticket::Service lehetőségnek aktiválva kell lennie).';
    $Self->{Translation}->{'Sets the ticket owner in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Beállítja a jegy tulajdonosát egy nagyított jegynek a jegy mester-alárendelt képernyőjén az ügyintézői felületen.';
    $Self->{Translation}->{'Sets the ticket type in the ticket MasterSlave screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).'} =
        'Beállítja a jegy típusát egy nagyított jegynek a jegy mester-alárendelt képernyőjén az ügyintézői felületen (a Ticket::Type lehetőségnek aktiválva kell lennie).';
    $Self->{Translation}->{'Shows a link in the menu to change the MasterSlave status of a ticket in the ticket zoom view of the agent interface.'} =
        'Egy hivatkozást jelenít meg a menüben egy jegy mester-alárendelt állapotának megváltoztatásához az ügyintézői felület jegynagyítás nézetében.';
    $Self->{Translation}->{'Shows a list of all the involved agents on this ticket, in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Megjeleníti a jegyen részt vevő összes ügyintéző listáját egy nagyított jegynek a jegy mester-alárendelt képernyőjén az ügyintézői felületen.';
    $Self->{Translation}->{'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Megjeleníti az összes lehetséges ügyintéző (a várólistán vagy jegyen jegyzet jogosultsággal rendelkező összes ügyintéző) listáját egy nagyított jegynek a jegy mester-alárendelt képernyőjén az ügyintézői felületen annak meghatározásához, hogy kit kell tájékoztatni erről a jegyzetről.';
    $Self->{Translation}->{'Shows the ticket priority options in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Megjeleníti a jegy prioritási lehetőségeket egy nagyított jegynek a jegy mester-alárendelt képernyőjén az ügyintézői felületen.';
    $Self->{Translation}->{'Shows the title fields in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Megjeleníti a címmezőket egy nagyított jegynek a jegy mester-alárendelt képernyőjén az ügyintézői felületen.';
    $Self->{Translation}->{'Specifies the different article types where the real name from Master ticket will be replaced with the one in the Slave ticket.'} =
        'Megadja a különböző bejegyzéstípusokat, ahol a mesterjegyben lévő valódi név ki lesz cserélve az alárendelt jegyben lévővel.';
    $Self->{Translation}->{'This module is preparing master/slave pulldown in email and phone ticket.'} =
        'Ez a modul előkészíti a mester/alárendelt lekérést az e-mail és telefonos jegyben.';

}

1;
