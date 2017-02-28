# --
# Copyright (C) 2001-2017 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::sr_Cyrl_OTRSMasterSlave;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentTicketMasterSlave
    $Self->{Translation}->{'Manage Master/Slave status for %s%s%s'} = 'Управљање статусом Главни/Зависни за %s%s%s';
    $Self->{Translation}->{'Set Master/Slave Value'} = 'Подеси вредност Главни/Зависни ';

    # Perl Module: Kernel/Modules/AgentTicketMasterSlave.pm
    $Self->{Translation}->{'New Master Ticket'} = 'Нови главни тикет';
    $Self->{Translation}->{'Unset Master Ticket'} = 'Опозови подешавање главног тикета';
    $Self->{Translation}->{'Unset Slave Ticket'} = 'Опозови подешавање зависног тикета';
    $Self->{Translation}->{'Slave of %s%s%s: %s'} = '';

    # Perl Module: Kernel/Output/HTML/TicketBulk/MasterSlave.pm
    $Self->{Translation}->{'Unset Master Tickets'} = 'Опозови подешавање главних тикета';
    $Self->{Translation}->{'Unset Slave Tickets'} = 'Опозови подешавање зависних тикета';

    # Perl Module: Kernel/System/DynamicField/Driver/MasterSlave.pm
    $Self->{Translation}->{'Master Ticket'} = 'Главни тикет';

    # SysConfig
    $Self->{Translation}->{'All master tickets'} = 'Сви главни тикети';
    $Self->{Translation}->{'All slave tickets'} = 'Сви зависни тикети';
    $Self->{Translation}->{'Allows adding notes in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Дозвољава додавање белешки на Главни/Зависни екрану детаљног приказа тикета оператерског интерфејса.';
    $Self->{Translation}->{'Change the MasterSlave state of the ticket.'} = 'Промени Главни/Зависни статус тикета.';
    $Self->{Translation}->{'Defines dynamic field name for master ticket feature.'} = 'Дефинише динамички назив поља за функцију главног тикета.';
    $Self->{Translation}->{'Defines if a ticket lock is required in the ticket MasterSlave screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).'} =
        'Одређује да ли је потребно закључати главни/зависни екран тикета на детаљном приказу тикета у интерфејсу оператера (ако тикет још увек није закључан, тикет ће добити статус закључан и тренутни оператер ће бити аутоматски постављен као власник).';
    $Self->{Translation}->{'Defines the default next state of a ticket after adding a note, in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Одређује подразумевани наредни статус тикета после додаваља белешке, на главни/зависни екрану детаљног приказа тикета у интерфејсу оператера.';
    $Self->{Translation}->{'Defines the default ticket priority in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Одређује подразумевани приоритет тикета на главни/зависни екану детаљног приказа тикета у интерфејсу оператера.';
    $Self->{Translation}->{'Defines the default type of the note in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Одређује подразумевани тип белешке на главни/зависни екрану детаљног приказа тикета у интерфејсу оператера.';
    $Self->{Translation}->{'Defines the history comment for the ticket MasterSlave screen action, which gets used for ticket history in the agent interface.'} =
        'Одређује коментар за историјат на главни/зависни екранској акцији, што ће се користити за историјат у интерфејсу оператера.';
    $Self->{Translation}->{'Defines the history type for the ticket MasterSlave screen action, which gets used for ticket history in the agent interface.'} =
        'Одређује тип историјата за главни/зависни екранску акцију, што ће се користити за историјат у интерфејсу оператера.';
    $Self->{Translation}->{'Defines the next state of a ticket after adding a note, in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Одређује наредни статус тикета после додаваља белешке, на главни/зависни екрану детаљног приказа тикета у интерфејсу оператера.';
    $Self->{Translation}->{'Disabled'} = 'Онемогућен';
    $Self->{Translation}->{'Enabled'} = 'Омогућен';
    $Self->{Translation}->{'Enables the advanced MasterSlave part of the feature.'} = 'Активира напредни део функције Главни/Зависни.';
    $Self->{Translation}->{'Enables the feature that slave tickets follow the master ticket to a new master in the advanced MasterSlave mode.'} =
        'Активирање својства да зависни тикет прати главни на нови главни у напредном Главни/Зависни моду.';
    $Self->{Translation}->{'Enables the feature to change the MasterSlave state of a ticket in the advanced MasterSlave mode.'} =
        'Активирање функције за промену стања тикета Главни/Зависни  у напредном Главни/Зависни моду.';
    $Self->{Translation}->{'Enables the feature to forward articles from type \'forward\' of a master ticket to the customers of the slave tickets. By default (disabled) it will not forward articles from type \'forward\' to the slave tickets.'} =
        'Активирање својства за прослеђивање чланака од типа „проследи” главног тикета корисницима зависних тикета. Подразумевано је (искључено) да се ништа не прослеђује зависним тикетима.';
    $Self->{Translation}->{'Enables the feature to keep parent-child link after change of the MasterSlave state in the advanced MasterSlave mode.'} =
        'Активирање функције за задржавање везе надређени-подређени после измене стања Главни/Зависни  у напредном Главни/Зависни моду.';
    $Self->{Translation}->{'Enables the feature to keep parent-child link after unset of the MasterSlave state in the advanced MasterSlave mode.'} =
        'Активирање функције за задржавање везе надређени-подређени после опозива подешавања стања Главни/Зависни  у напредном Главни/Зависни моду.';
    $Self->{Translation}->{'Enables the feature to unset the MasterSlave state of a ticket in the advanced MasterSlave mode.'} =
        'Активирање функције за опозив подешавања стања тикета Главни/Зависни  у напредном Главни/Зависни моду.';
    $Self->{Translation}->{'If a note is added by an agent, sets the state of the ticket in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Ако је оператер додао напомену, подешава статус тикета на екрану Главни/Зависни тикета на детаљном приказу у интерфејсу оператера.';
    $Self->{Translation}->{'Master / Slave'} = 'Главни / Зависни';
    $Self->{Translation}->{'Master Tickets'} = 'Главни тикети';
    $Self->{Translation}->{'MasterSlave'} = 'Главни/Зависни';
    $Self->{Translation}->{'MasterSlave module for Ticket Bulk feature.'} = 'Модул Главни/Зависни за функцију масовне обраде тикета.';
    $Self->{Translation}->{'Parameters for the dashboard backend of the master tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        'Параметри за позадински приказ контролне табле прегледа главних тикета у интерфејсу оператера. „Лимит” је број уноса подрезумевано приказаних. „Група” се користи да ограничи приступ додатку (нпр. Група: admin;group1;group2;). „Подразумевано” одређује да ли је подразумевано активиран или да је потребно да га корисник мануелно активира. „CacheTTLLocal” је време у минутама за кеш додатка.';
    $Self->{Translation}->{'Parameters for the dashboard backend of the slave tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        'Параметри за позадински приказ контролне табле прегледа главних тикета у интерфејсу оператера. „Лимит” је број уноса подрезумевано приказаних. „Група” се користи да ограничи приступ додатку (нпр. Група: admin;group1;group2;). „Подразумевано” одређује да ли је подразумевано активиран или да је потребно да га корисник мануелно активира. „CacheTTLLocal” је време у минутама за кеш додатка.';
    $Self->{Translation}->{'Registration of the ticket event module.'} = 'Регистрација модула догађаја за тикете.';
    $Self->{Translation}->{'Required permissions to use the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Неопходна дозвола за употребу главни/зависни екрана детаљног приказа тикета у интерфејсу оператера.';
    $Self->{Translation}->{'Sets the default body text for notes added in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Одређује подразумевани садржај за напомене додате на на Главни/Зависни екрану детаљног приказа тикета у интерфејсу оператера.';
    $Self->{Translation}->{'Sets the default subject for notes added in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Одређује подразумевани предмет за напомене додате на Главни/Зависни екрану детаљног приказа тикета у интерфејсу оператера.';
    $Self->{Translation}->{'Sets the responsible agent of the ticket in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Одређује одговорног оператера за тикет на Главни/Зависни екрану детаљног приказа тикета у интерфејсу оператера.';
    $Self->{Translation}->{'Sets the service in the ticket MasterSlave screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).'} =
        'Одређује сервис на Главни/Зависни екрану детаљног приказа тикета у интерфејсу оператера (Потребно је активирати Тикет::Сервис)..';
    $Self->{Translation}->{'Sets the ticket owner in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Одређује власника тикета на Главни/Зависни екрану детаљног приказа тикета у интерфејсу оператера.';
    $Self->{Translation}->{'Sets the ticket type in the ticket MasterSlave screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).'} =
        'Одређује тип тикета на Главни/Зависни екрану детаљног приказа тикета у интерфејсу оператера (Потребно је активирати Тикет::Тип).';
    $Self->{Translation}->{'Shows a link in the menu to change the MasterSlave status of a ticket in the ticket zoom view of the agent interface.'} =
        'У менију приказује везу за измену Главни/Зависни статуса тикета на детаљном приказу тикета у интерфејсу оператера.';
    $Self->{Translation}->{'Shows a list of all the involved agents on this ticket, in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Приказује листу свих оператера укључених у овај тикет на Главни/Зависни екрану детаљног приказа тикета у интерфејсу оператера.';
    $Self->{Translation}->{'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Приказује листу свих могућих оператера (сви оператери са дозволом за напомену за ред/тикет) ради утврђивања ко треба да буде информисан о овој напомени, на Главни/Зависни екрану тикета на детаљном приказу тикета у интерфејсу оператера.';
    $Self->{Translation}->{'Shows the ticket priority options in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Приказује опције приоритета тикета на Главни/Зависни екрану тикета на детаљном приказу тикета у интерфејсу оператера.';
    $Self->{Translation}->{'Shows the title fields in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Приказује насловна поља на Главни/Зависни екрану тикета на детаљном приказу тикета у интерфејсу оператера.';
    $Self->{Translation}->{'Slave Tickets'} = 'Зависни тикети';
    $Self->{Translation}->{'Specifies the different article types where the real name from Master ticket will be replaced with the one in the Slave ticket.'} =
        'Наводи разне типове чланака где ће стварно име са главног тикета бити замењено са једним на зависном тикету.';
    $Self->{Translation}->{'This module activates Master/Slave field in new email and phone ticket screens.'} =
        'Овај модул активира поље Главни/Зависни на екрану нових имејл и телефонских тикета.';
    $Self->{Translation}->{'Ticket MasterSlave.'} = 'Тикет Главни/Зависни.';

}

1;
