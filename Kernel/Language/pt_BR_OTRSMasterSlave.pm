# --
# Copyright (C) 2001-2018 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Language::pt_BR_OTRSMasterSlave;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AgentTicketBulk
    $Self->{Translation}->{'MasterTicket'} = 'ChamadoMaster';

    # Template: AgentTicketMasterSlave
    $Self->{Translation}->{'Manage Master/Slave'} = 'Gerenciar Master/Slave';

    # SysConfig
    $Self->{Translation}->{'Allows adding notes in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Permite adicionar notas na tela "MasterSlave"';
    $Self->{Translation}->{'Change the MasterSlave state of the ticket.'} = 'Altera o estado MasterSlave de um chamado.';
    $Self->{Translation}->{'Define dynamic field name for master ticket feature.'} = 'Defina um nome de campo dinâmico para o recurso MasterSlave do chamado.';
    $Self->{Translation}->{'Defines if a ticket lock is required in the ticket MasterSlave screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).'} =
        'Define se um bloqueio de ticket é requerido na tela MasterSlave de um ticket detalhado na interface de agente (se o ticket ainda não estiver bloqueado, o ticket será bloqueado e o agente corrente será automaticamente definido como o seu proprietário).';
    $Self->{Translation}->{'Defines the default next state of a ticket after adding a note, in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Define o próximo estado padrão de um ticket após uma nota ter sido adicionada, na tela MasterSlave de um ticket detalhado na interface de agente.';
    $Self->{Translation}->{'Defines the default ticket priority in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Define a prioridade padrão do ticket na tela MasterSlave de um ticket detalhado na interface de agente.';
    $Self->{Translation}->{'Defines the default type of the note in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Define o tipo padrão de nota na tela MasterSlave de um ticket detalhado na interface de agente.';
    $Self->{Translation}->{'Defines the history comment for the ticket MasterSlave screen action, which gets used for ticket history in the agent interface.'} =
        'Define o comentário de histórico para a ação de tela MasterSlave do ticket, que é utilizada para o histórico do ticket na interface de agente.';
    $Self->{Translation}->{'Defines the history type for the ticket MasterSlave screen action, which gets used for ticket history in the agent interface.'} =
        'Define o tipo de histórico para a ação da tela MasterSlave do ticket, que é utilizado para o histórico do ticket na interface de agente.';
    $Self->{Translation}->{'Defines the next state of a ticket after adding a note, in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Define o próximo estado de um ticket após uma nota ter sido adicionada, na tela MasterSlave de um ticket detalhado na interface de agente.';
    $Self->{Translation}->{'Enable the advanced MasterSlave part of the feature.'} = 'Ativa os recursos avançados de Master Slave.';
    $Self->{Translation}->{'Enable the feature that slave tickets follow the master ticket to a new master in the advanced MasterSlave mode.'} =
        'Ativa o recurso que faz com que tickets escravos sigam o ticket mestre para um novo mestre no modo avançado de MasterSlave.';
    $Self->{Translation}->{'Enable the feature to change the MasterSlave state of a ticket in the advanced MasterSlave mode.'} =
        'Habilita o recurso que permite alterar o estado de MasterSlave de um ticket no modo avançado de MasterSlave.';
    $Self->{Translation}->{'Enable the feature to forward articles from type \'forward\' of a master ticket to the customers of the slave tickets. By default (disabled) it will not forward articles from type \'forward\' to the slave tickets.'} =
        '';
    $Self->{Translation}->{'Enable the feature to unset the MasterSlave state of a ticket in the advanced MasterSlave mode.'} =
        'Habilita o recurso que permite retornar o estado de MasterSlave de um ticket no modo avançado de MasterSlave.';
    $Self->{Translation}->{'If a note is added by an agent, sets the state of the ticket in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Se uma nota for adicionada por um agente, define o estado do ticket na tela de MasterSlave de um ticket detalhado na interface de agente.';
    $Self->{Translation}->{'Parameters for the dashboard backend of the master tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        'Parâmetros para o backend do painel de visão geral de tickets mestre da interface de agente. "Limite" é a quantidade de registros exibida por padrão. "Grupo" é usado para restringir o acesso ao plugin (ex.: Grupo: admin;grupo1;grupo2). "Padrão" determina se o plugin é habilitado por padrão ou se o usuário precisa habilitá-lo manualmente. "CacheTTLLocal" é o tempo de cache em minutos para o plugin.';
    $Self->{Translation}->{'Parameters for the dashboard backend of the slave tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.'} =
        'Parâmetros para o backend do painel de visão geral de tickets mestre da interface de agente. "Limite" é a quantidade de registros exibida por padrão. "Grupo" é usado para restringir o acesso ao plugin (ex.: Grupo: admin;grupo1;grupo2). "Padrão" determina se o plugin é habilitado por padrão ou se o usuário precisa habilitá-lo manualmente. "CacheTTLLocal" é o tempo de cache em minutos para o plugin.';
    $Self->{Translation}->{'Registration of the ticket event module.'} = 'Registro do módulo de eventos de ticket.';
    $Self->{Translation}->{'Required permissions to use the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Permissões requeridas para usar a tela MasterSlave de ticket de um ticket detalhado na interface de agente.';
    $Self->{Translation}->{'Sets the default body text for notes added in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Define o corpo do texto padrão para notas adicionadas na tela MasterSlave de ticket de um ticket detalhado na interface de agente.';
    $Self->{Translation}->{'Sets the default subject for notes added in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Define o assunto padrão para notas adicionadas na tela MasterSlave de ticket de um ticket detalhado na interface de agente.';
    $Self->{Translation}->{'Sets the responsible agent of the ticket in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Define o agente responsável do ticket na tela MasterSlave de ticket de um ticket detalhado na interface de agente.';
    $Self->{Translation}->{'Sets the service in the ticket MasterSlave screen of a zoomed ticket in the agent interface (Ticket::Service needs to be activated).'} =
        'Define o serviço na tela MasterSlave de um ticket detalhado na interface de agente (Ticket::Service precisa ser ativado).';
    $Self->{Translation}->{'Sets the ticket owner in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Define o proprietário do ticket na tela MasterSlave de ticket de um ticket detalhado na interface de agente.';
    $Self->{Translation}->{'Sets the ticket type in the ticket MasterSlave screen of a zoomed ticket in the agent interface (Ticket::Type needs to be activated).'} =
        'Define o tipo do ticket na tela MasterSlave de ticket de um ticket detalhado na interface de agente (Ticket::Type precisa ser ativado).';
    $Self->{Translation}->{'Shows a link in the menu to change the MasterSlave status of a ticket in the ticket zoom view of the agent interface.'} =
        'Exibe um link no menu para alterar o estado MasterSlave de um ticket na tela de detalhe de ticket da interface de agente.';
    $Self->{Translation}->{'Shows a list of all the involved agents on this ticket, in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Exibe uma lista de todos os agentes envolvidos neste ticket, na tela MasterSlave de ticket de um ticket detalhado na interface de agente.';
    $Self->{Translation}->{'Shows a list of all the possible agents (all agents with note permissions on the queue/ticket) to determine who should be informed about this note, in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Exibe uma lista de todos os agentes possíveis (todos os agentes com permissão de nota na fila/ticket) para determinar quem deve ser informado sobre esta nota, na tela MasterSlave de ticket de um ticket detalhado na interface de agente.';
    $Self->{Translation}->{'Shows the ticket priority options in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Exibe as opções de prioridade de ticket na tela MasterSlave de ticket de um ticket detalhado na interface de agente.';
    $Self->{Translation}->{'Shows the title fields in the ticket MasterSlave screen of a zoomed ticket in the agent interface.'} =
        'Exibe o campo de título na tela MasterSlave de ticket de um ticket detalhado na interface de agente.';
    $Self->{Translation}->{'Specifies the different article types where the real name from Master ticket will be replaced with the one in the Slave ticket.'} =
        'Especifica os diferentes tipos de artigo onde o nome real do ticket Master será substituído com o nome do ticket escravo.';
    $Self->{Translation}->{'This module is preparing master/slave pulldown in email and phone ticket.'} =
        'Este módulo está preparando a lista de seleção master/slave em novo chamado via fone ou email.';

}

1;
