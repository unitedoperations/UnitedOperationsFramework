class UO_FW_TeamRespawnSettings_Opfor {
    displayName = "OPFOR Respawn Settings";
    collapsed = 0; //_respawnTypeArray = [['1 Life','ONELIFE'],['Unlimited','UNLIMITED'],['Individual Tickets','INDTICKETS'],['Team Tickets','TEAMTICKETS'],['Wave','WAVE'],['Triggered','TRIGGERED']];\
    class Attributes {
        class UO_FW_RespawnSetting_Type_Opfor {
            displayName = "Respawn System";
            tooltip = "Type of respawn system for OPFOR. Place down a GameLogic object with name UO_FW_RESPAWN_OPFOR to define respawn location.";
            control = "UO_FW_Respawn_Combo_Opfor";
            defaultValue = "0";
            property = "UO_FW_RespawnSetting_Type_Opfor";
            expression = UO_FW_SCENARIO_EXPRESSION;
        };
        class UO_FW_RespawnSetting_Templates_Opfor {
            property = "UO_FW_RespawnSetting_Templates_Opfor";
            displayName = "Respawn System Settings";
            tooltip = "";
            control = "UO_FW_RespawnTemplates_Opfor";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "['']";
        };
        class UO_FW_RespawnSetting_NewTeam_Opfor {
            property = "UO_FW_RespawnSetting_NewTeam_Opfor";
            displayName = "Respawn Side";
            tooltip = "Determines what side the originally OPFOR players will spawn on. Enabling this setting requires respawned players to join a new group.";
            respawnTypes[] = {1,2,3};
            control = "UO_FW_RespawnSide_Combo";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "1";
        };
        class UO_FW_RespawnSetting_Delay_Opfor {
            property = "UO_FW_RespawnSetting_Delay_Opfor";
            displayName = "Respawn Delay";
            tooltip = "Delay in seconds between a player being killed and respawning. Must be more than 5 seconds.";
            respawnTypes[] = {1,2,3,4,5};
            control = "UO_FW_RespawnDelay_Slider";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "5";
            validate = "number";
        };
        class UO_FW_RespawnSetting_IndTickets_Opfor {
            property = "UO_FW_RespawnSetting_IndTickets_Opfor";
            displayName = "Individual Respawn Tickets";
            tooltip = "Number of individual respawns.";
            respawnTypes[] = {2};
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "2";
            validate = "number";
        };
        class UO_FW_RespawnSetting_TeamTickets_Opfor {
            property = "UO_FW_RespawnSetting_TeamTickets_Opfor";
            displayName = "Team Respawn Tickets";
            tooltip = "Number of team respawns.";
            respawnTypes[] = {3};
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "30";
            validate = "number";
        };
    };
};


class UO_FW_TeamSpectateSettings_OPFOR {
    displayName = "OPFOR Spectate Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_TeamSpectateSettings_EnabledTeams_OPFOR {
            property = "UO_FW_TeamSpectateSettings_EnabledTeams";
            displayName = "Spectate Teams";
            tooltip = "Teams that this team can spectate.";
            control = "UO_FW_SpectateTeams_Attribute";
            defaultValue = "['BLUFOR','OPFOR','INDFOR','CIVILIAN']";
            expression = UO_FW_SCENARIO_EXPRESSION;
        };
        class UO_FW_TeamSpectateSettings_KillCam_OPFOR {
            property = "UO_FW_TeamSpectateSettings_KillCam";
            displayName = "Killcam";
            tooltip = "This setting enables the specator killcam functionality.";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class UO_FW_TeamSpectateSettings_AIEnabled_OPFOR {
            property = "UO_FW_TeamSpectateSettings_AIEnabled_OPFOR";
            displayName = "Spectate AI";
            tooltip = "Enable Spectating AI Entities.";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class UO_FW_TeamSpectateSettings_FreeCam_OPFOR {
            property = "UO_FW_TeamSpectateSettings_FreeCam";
            displayName = "Spectator Freecam";
            tooltip = "Enable Freecam Ability in Spectator.";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class UO_FW_TeamSpectateSettings_3rdPerson_OPFOR {
            property = "UO_FW_TeamSpectateSettings_3rdPerson";
            displayName = "Spectator Third Person";
            tooltip = "Enable Third Person Ability in Spectator.";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
    };
};
