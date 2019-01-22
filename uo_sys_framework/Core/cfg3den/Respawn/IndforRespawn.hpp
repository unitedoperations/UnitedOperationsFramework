class UO_FW_TeamRespawnSettings_Indfor {
    displayName = "INDFOR Respawn Settings";
    collapsed = 0; //_respawnTypeArray = [['1 Life','ONELIFE'],['Unlimited','UNLIMITED'],['Individual Tickets','INDTICKETS'],['Team Tickets','TEAMTICKETS'],['Wave','WAVE'],['Triggered','TRIGGERED']];\
    class Attributes {
        class UO_FW_RespawnSetting_Type_Indfor {
            displayName = "Respawn System";
            tooltip = "Type of respawn system for INDFOR. Place down Gamelogic with name UO_FW_independent_respawn to define respawn location.";
            control = "UO_FW_Respawn_Combo_Indfor";
            defaultValue = "0";
            property = "UO_FW_RespawnSetting_Type_Indfor";
            expression = UO_FW_SCENARIO_EXPRESSION;
        };
        class UO_FW_RespawnSetting_Templates_Indfor {
            property = "UO_FW_RespawnSetting_Templates_Indfor";
            displayName = "Respawn System Settings";
            tooltip = "";
            control = "UO_FW_RespawnTemplates_Indfor";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "['']";
        };
        class UO_FW_RespawnSetting_IndTickets_Indfor {
            property = "UO_FW_RespawnSetting_IndTickets_Indfor";
            displayName = "Individual Respawn Tickets";
            tooltip = "Number of individual respawns.";
            respawnTypes[] = {2};
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "2";
            validate = "number";
        };
        class UO_FW_RespawnSetting_TeamTickets_Indfor {
            property = "UO_FW_RespawnSetting_TeamTickets_Indfor";
            displayName = "Team Respawn Tickets";
            tooltip = "Number of team respawns.";
            respawnTypes[] = {3};
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "30";
            validate = "number";
        };
        class UO_FW_RespawnSetting_WaveSize_Indfor {
            property = "UO_FW_RespawnSetting_WaveSize_Indfor";
            displayName = "Wave Condition";
            tooltip = "Number of team respawns.";
            respawnTypes[] = {4};
            control = "EditCode";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
            validate = "expression";
        };
        class UO_FW_RespawnSetting_TriggeredCond_Indfor {
            property = "UO_FW_RespawnSetting_TriggeredCond_Indfor";
            displayName = "Triggered Condition";
            tooltip = "Number of team respawns.";
            respawnTypes[] = {5};
            control = "EditCode";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
            validate = "expression";
        };
    };
};
