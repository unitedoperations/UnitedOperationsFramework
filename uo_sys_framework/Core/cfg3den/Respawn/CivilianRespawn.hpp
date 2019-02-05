class UO_FW_TeamRespawnSettings_Civ {
    displayName = "Civilian Respawn Settings";
    collapsed = 0; //_respawnTypeArray = [['1 Life','ONELIFE'],['Unlimited','UNLIMITED'],['Individual Tickets','INDTICKETS'],['Team Tickets','TEAMTICKETS'],['Wave','WAVE'],['Triggered','TRIGGERED']];\
    class Attributes {
        class UO_FW_RespawnSetting_Type_Civ {
            displayName = "Respawn System";
            tooltip = "Type of respawn system for Civilian. Place down a GameLogic object with name UO_FW_RESPAWN_CIV to define respawn location.";
            control = "UO_FW_Respawn_Combo_Civ";
            defaultValue = "0";
            property = "UO_FW_RespawnSetting_Type_Civ";
            expression = UO_FW_SCENARIO_EXPRESSION;
        };
        class UO_FW_RespawnSetting_Templates_Civ {
            property = "UO_FW_RespawnSetting_Templates_Civ";
            displayName = "Respawn System Settings";
            tooltip = "";
            control = "UO_FW_RespawnTemplates_Civ";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "['']";
        };
        class UO_FW_RespawnSetting_NewTeam_Civ {
            property = "UO_FW_RespawnSetting_NewTeam_Civ";
            displayName = "Respawn Side";
            tooltip = "Determines what side the originally Civilian players will spawn on. Enabling this setting requires respawned players to join a new group.";
            respawnTypes[] = {1,2,3};
            control = "UO_FW_RespawnSide_Combo";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "3";
        };
        class UO_FW_RespawnSetting_Delay_Civ {
            property = "UO_FW_RespawnSetting_Delay_Civ";
            displayName = "Respawn Delay";
            tooltip = "Delay in seconds between a player being killed and respawning. Must be more than 5 seconds.";
            respawnTypes[] = {1,2,3,4,5};
            control = "UO_FW_5To20Step1_Slider";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "5";
            validate = "number";
        };
        class UO_FW_RespawnSetting_IndTickets_Civ {
            property = "UO_FW_RespawnSetting_IndTickets_Civ";
            displayName = "Individual Respawn Tickets";
            tooltip = "Number of individual respawns.";
            respawnTypes[] = {2};
            control = "UO_FW_1To10Step1_Slider";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "2";
            validate = "number";
        };
        class UO_FW_RespawnSetting_TeamTickets_Civ {
            property = "UO_FW_RespawnSetting_TeamTickets_Civ";
            displayName = "Team Respawn Tickets";
            tooltip = "Number of team respawns.";
            respawnTypes[] = {3};
            control = "UO_FW_10To100Step1_Slider";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "30";
            validate = "number";
        };
    };
};

class UO_FW_TeamSpectateSettings_CIV {
    displayName = "Civilian Spectate Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_TeamSpectateSettings_EnabledTeams_CIV {
            property = "UO_FW_TeamSpectateSettings_EnabledTeams";
            displayName = "Spectate Teams";
            tooltip = "Teams that this team can spectate.";
            control = "UO_FW_SpectateTeams_Attribute";
            defaultValue = "['BLUFOR','OPFOR','INDFOR','CIVILIAN']";
            expression = UO_FW_SCENARIO_EXPRESSION;
        };
        class UO_FW_TeamSpectateSettings_KillCam_CIV {
            property = "UO_FW_TeamSpectateSettings_KillCam";
            displayName = "Killcam";
            tooltip = "This setting enables the specator killcam functionality.";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class UO_FW_TeamSpectateSettings_AIEnabled_CIV {
            property = "UO_FW_TeamSpectateSettings_AIEnabled_CIV";
            displayName = "Spectate AI";
            tooltip = "Enable Spectating AI Entities.";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class UO_FW_TeamSpectateSettings_FreeCam_CIV {
            property = "UO_FW_TeamSpectateSettings_FreeCam";
            displayName = "Spectator Freecam";
            tooltip = "Enable Freecam Ability in Spectator.";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class UO_FW_TeamSpectateSettings_3rdPerson_CIV {
            property = "UO_FW_TeamSpectateSettings_3rdPerson";
            displayName = "Spectator Third Person";
            tooltip = "Enable Third Person Ability in Spectator.";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
    };
};

class UO_FW_TeamJIPSettings_CIV {
    displayName = "Civilian JiP Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_JIP_Type_CIV {
            property = "UO_FW_JIP_Type_CIV";
            displayName = "JiP Type";
            tooltip = "TELEPORT: Player can teleport to his squad. TRANSPORT: Player can send a hint to all group leaders requesting transport. DENY: Player is killed and put in spectator.";
            control = "UO_FW_JIPTypeAtt";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "0";
        };
        class UO_FW_JIP_Distance_CIV {
            property = "UO_FW_JIP_Distance_CIV";
            displayName = "JiP Distance";
            tooltip = "If distance to group members upon spawn is greater than this you will be granted the defined JiP action";
            control = "UO_FW_50To200Step50_Slider";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "200";
        };
        class UO_FW_JIP_SpawnDistance_CIV {
            property = "UO_FW_JIP_SpawnDistance_CIV";
            displayName = "Spawn Radius";
            tooltip = "Exiting this radius will remove the JiP actions from the player.";
            control = "UO_FW_50To200Step50_Slider";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "50";
        };
    };
};
