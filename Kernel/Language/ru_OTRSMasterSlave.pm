# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Language::ru_OTRSMasterSlave;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentTicketBulk
    $Self->{Translation}->{'MasterTicket'} = 'Главная заявка';

    # Template: AgentTicketMasterSlave
    $Self->{Translation}->{'Manage Master/Slave'} = 'Управление Master/Slave';

    # SysConfig
    $Self->{Translation}->{'Allows adding notes in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Позволяет добавить сообщение на экране MasterSlave в интерфейсе агента.';
    $Self->{Translation}->{'Change the MasterSlave state of the ticket.'} = 'Изменить состояние MasterSlave для этой заявки.';
    $Self->{Translation}->{'Define dynamic field name for master ticket feature.'} = 'Задает имя динамического поля для функции master/главной заявки.';
    $Self->{Translation}->{'Defines if a ticket lock is required in the ticket MasterSlave screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).'} =
        'Требуется ли блокировка заявки при применении опции MasterSlave в интерфейсе агента (если заявка еще не заблокирована, она блокируется и текущий агент становится ее Владельцем).';
    $Self->{Translation}->{'Defines the default next state of a ticket after adding a note, in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Задает следующее состояние по умолчанию для заявки после добавления заметки на экране MasterSlave заявки при ее просмотре в интерфейсе агента.';
    $Self->{Translation}->{'Defines the default ticket priority in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Задает умалчиваемый приоритет заявки на экране MasterSlave при просмотре заявки в интерфейсе агента.';
    $Self->{Translation}->{'Defines the default type of the note in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Задает умалчиваемый тип сообщения на экране MasterSlave при просмотре заявки в интерфейсе агента.';
    $Self->{Translation}->{'Defines the history comment for the ticket MasterSlave screen action, which gets used for ticket history in the agent interface.'} =
        'Задает текст комментария в записи истории при вызове MasterSlave экрана , в интерфейсе агента.';
    $Self->{Translation}->{'Defines the history type for the ticket MasterSlave screen action, which gets used for ticket history in the agent interface.'} =
        'Задает тип записи истории при вызове MasterSlave экрана , в интерфейсе агента.';
    $Self->{Translation}->{'Defines the next state of a ticket after adding a note, in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Задает следующее состояние для заявки после добавления заметки на экране MasterSlave заявки при ее просмотре в интерфейсе агента.';
    $Self->{Translation}->{'Enable the advanced MasterSlave part of the feature.'} = 'Включает расширенные возможности для MasterSlave.';
    $Self->{Translation}->{'Enable the feature that slave tickets follow the master ticket to a new master in the advanced MasterSlave mode.'} =
        'Включает возможность передачи подчиненных заявок главной заявки к новой главной  в расширенном режиме MasterSlave .';
    $Self->{Translation}->{'Enable the feature to change the MasterSlave state of a ticket in the advanced MasterSlave mode.'} =
        'Включает возможность изменения состояния MasterSlave заявки в расширенном режиме.';
    $Self->{Translation}->{'Enable the feature to forward articles from type \'forward\' of a master ticket to the customers of the slave tickets. By default (disabled) it will not forward articles from type \'forward\' to the slave tickets.'} =
        '';
    $Self->{Translation}->{'Enable the feature to unset the MasterSlave state of a ticket in the advanced MasterSlave mode.'} =
        'Задает возможность сбросить установленное состояние MasterSlave заявки в расширенном режиме.';
    $Self->{Translation}->{'If a note is added by an agent, sets the state of the ticket in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Если сообщение/заметка добавлена агентом, задает состояние заявки на экране MasterSlave  в интерфейсе агента.';
    $Self->{Translation}->{'Parameters for the dashboard backend of the master tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        'Параметры для раздела Дайджеста с информацией о master заявках в интерфейсе агента. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" - задает, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTLLocal" - время обновления кэша в минутах для этого раздела.';
    $Self->{Translation}->{'Parameters for the dashboard backend of the slave tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        'Параметры для раздела Дайджеста с информацией о slave заявках в интерфейсе агента. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" - задает, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTLLocal" - время обновления кэша в минутах для этого раздела.';
    $Self->{Translation}->{'Registration of the ticket event module.'} = 'Регистрация модуля обработки событий заявки.';
    $Self->{Translation}->{'Required permissions to use the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Права, требуемые для использования функции MasterSlave заявок в интерфейсе агента.';
    $Self->{Translation}->{'Sets the default body text for notes added in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Устанавливает текст сообщения по умолчанию при добавлении сообщения на экране MasterSlave заявки в интерфейсе агента.';
    $Self->{Translation}->{'Sets the default subject for notes added in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Устанавливает тему сообщения по умолчанию при добавлении сообщения на экране MasterSlave заявки в интерфейсе агента.';
    $Self->{Translation}->{'Sets the responsible agent of the ticket in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Задает Ответственного за заявку на экране MasterSlave заявки в интерфейсе агента.';
    $Self->{Translation}->{'Sets the service in the ticket MasterSlave screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).'} =
        'Задает сервис для заявки на экране MasterSlave заявки в интерфейсе агента. (Параметр Ticket::Service должен быть включен).';
    $Self->{Translation}->{'Sets the ticket owner in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Задает Владельца заявки на экране MasterSlave заявки в интерфейсе агента.';
    $Self->{Translation}->{'Sets the ticket type in the ticket MasterSlave screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).'} =
        'Задает тип заявки на экране MasterSlave заявки в интерфейсе агента. (Параметр Ticket::Service должен быть включен).';
    $Self->{Translation}->{'Shows a link in the menu to change the MasterSlave status of a ticket in the ticket zoom view of the agent interface.'} =
        'Задает ссылку в меню для изменения MasterSlave статуса  на экране просмотра заявки в интерфейсе агента.';
    $Self->{Translation}->{'Shows a list of all the involved agents on this ticket, in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Показывает список всех привлекаемых агентов по этой заявке на экране MasterSlave заявки в интерфейсе агента. ';
    $Self->{Translation}->{'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Показывает список всех доступных агентов (всех агентов с правами note для очереди/заявки), чтобы задать кого нужно информировать об этой заметке на экране MasterSlave заявки в интерфейсе агента. ';
    $Self->{Translation}->{'Shows the ticket priority options in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Дает возможность изменить приоритет на экране MasterSlave заявки в интерфейсе агента. ';
    $Self->{Translation}->{'Shows the title fields in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Дает возможность изменить тему заявки на экране MasterSlave заявки в интерфейсе агента. ';
    $Self->{Translation}->{'Specifies the different article types where the real name from Master ticket will be replaced with the one in the Slave ticket.'} =
        'Задает различные типы сообщений/заметок для случая замены реального имени из главной заявки в таким же в подчиненной.';
    $Self->{Translation}->{'This module is preparing master/slave pulldown in email and phone ticket.'} =
        'Этот модуль включает возможность выбора master/slave опции на экране создания заявки, на основе телефонного звонка или письма клиента агентом.';

}

1;
