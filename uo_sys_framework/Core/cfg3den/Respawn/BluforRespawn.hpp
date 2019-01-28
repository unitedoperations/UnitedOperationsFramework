class UO_FW_TeamRespawnSettings_Blufor {
    displayName = "Blufor Respawn Settings";
    collapsed = 0;
    class Attributes {
        //_respawnTypeArray = [['1 Life','ONELIFE'],['Unlimited','UNLIMITED'],['Individual Tickets','INDTICKETS'],['Team Tickets','TEAMTICKETS'],['Wave','WAVE'],['Triggered','TRIGGERED']];
        class UO_FW_RespawnSetting_Type_Blufor {
            displayName = "Respawn System";
            tooltip = "Type of respawn system for BLUFOR. Place down a GameLogic object with name UO_FW_RESPAWN_BLUFOR to define respawn location.";
            control = "UO_FW_Respawn_Combo_Blufor";
            defaultValue = "0";
            property = "UO_FW_RespawnSetting_Type_Blufor";
            expression = UO_FW_SCENARIO_EXPRESSION;
        };
        class UO_FW_RespawnSetting_Templates_Blufor {
            property = "UO_FW_RespawnSetting_Templates_Blufor";
            displayName = "Respawn System Settings";
            tooltip = "";
            control = "UO_FW_RespawnTemplates_Blufor";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "['']";
        };
        class UO_FW_RespawnSetting_NewTeam_Blufor {
            property = "UO_FW_RespawnSetting_NewTeam_Blufor";
            displayName = "Respawn Side";
            tooltip = "Determines what side the originally BLUFOR players will spawn on. Enabling this setting requires respawned players to join a new group.";
            respawnTypes[] = {1,2,3};
            control = "UO_FW_RespawnSide_Combo";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
        class UO_FW_RespawnSetting_Delay_Blufor {
            property = "UO_FW_RespawnSetting_Delay_Blufor";
            displayName = "Respawn Delay";
            tooltip = "Delay in seconds between a player being killed and respawning. Must be more than 5 seconds.";
            respawnTypes[] = {1,2,3,4,5};
            control = "UO_FW_5To20_Slider";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "5";
            validate = "number";
        };
        class UO_FW_RespawnSetting_IndTickets_Blufor {
            property = "UO_FW_RespawnSetting_IndTickets_Blufor";
            displayName = "Individual Respawn Tickets";
            tooltip = "Number of individual respawns.";
            respawnTypes[] = {2};
            control = "UO_FW_1To10_Slider";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "2";
            validate = "number";
        };
        class UO_FW_RespawnSetting_TeamTickets_Blufor {
            property = "UO_FW_RespawnSetting_TeamTickets_Blufor";
            displayName = "Team Respawn Tickets";
            tooltip = "Number of team respawns.";
            respawnTypes[] = {3};
            control = "UO_FW_10To100_Slider";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "30";
            validate = "number";
        };
        /*class UO_FW_RespawnSetting_WaveSize_Blufor {
            property = "UO_FW_RespawnSetting_WaveSize_Blufor";
            displayName = "Wave Condition";
            tooltip = "Number of players needed to respawn a wave.";
            respawnTypes[] = {4};
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "8";
        };
        class UO_FW_RespawnSetting_WaveGearMode_Blufor {
            property = "UO_FW_RespawnSetting_WaveGearMode_Blufor";
            displayName = "Wave Gear Mode";
            tooltip = "System for handling gear classes on Wave respawn mode.\
                 Only affects Wave system if 'Handle Gear Classes for Wave Respawns' setting is enabled.\
                 Loose: At least one squad leader, or officer is required to spawn the group. Players respawn with their starting gear class or their respawn gear class if set.\
                 Preferential: Gear classes must fulfill one of the gear class array minimums, players with starting gear classes that meet the minimum classes will fill those slots first.\
                 Strict: Gear classes must fulfill one of the gear class array minimums, players will spawn with their starting or respawn gear class.\
            ";
            respawnTypes[] = {4};
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_RespawnSetting_WaveGearModeArray_Blufor {
            property = "UO_FW_RespawnSetting_WaveGearMode_Blufor";
            displayName = "Wave Gear Mode";
            tooltip = "Gear class combinations for wave respawn gear handling.\
                Each array is a possible minimum gear check pass.\
                Limit players to specific gear minimum array via their respawn gear settings.\
            ";
            respawnTypes[] = {4};
            control = "EditCodeMulti3";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "BluforRifleSquad = [[6,10],['SQL',1,1],['TL',1,2],['AR',1,2],['RFL',0,2],['RFLAT',0,2]]; BluforVehicleCrew = [[2,3],['VCMD',1,1],['VCRW',1,2]];";
        };
        class UO_FW_RespawnSetting_TriggeredCond_Blufor {
            property = "UO_FW_RespawnSetting_TriggeredCond_Blufor";
            displayName = "Triggered Condition";
            tooltip = "Triggered Respawn condition variable.";
            respawnTypes[] = {5};
            control = "EditCode";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class UO_FW_RespawnSetting_MaxRespawns_Blufor {
            property = "UO_FW_RespawnSetting_MaxRespawns_Blufor";
            displayName = "Wave/Triggered Respawn Limit";
            tooltip = "Total Respawns allowed for Wave and Triggered Respawn Modes. Set to 0 to have no limit.";
            respawnTypes[] = {4,5};
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "0";
            typeName = "number";
        };*/
    };
};

class UO_FW_TeamSpectateSettings_Blufor {
    displayName = "BLUFOR Spectate Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_TeamSpectateSettings_EnabledTeams_Blufor {
            property = "UO_FW_TeamSpectateSettings_EnabledTeams";
            displayName = "Spectate Teams";
            tooltip = "Teams that this team can spectate.";
            control = "UO_FW_SpectateTeams_Attribute";
            defaultValue = "['BLUFOR','OPFOR','INDFOR','CIVILIAN']";
            expression = UO_FW_SCENARIO_EXPRESSION;
        };
        class UO_FW_TeamSpectateSettings_KillCam_Blufor {
            property = "UO_FW_TeamSpectateSettings_KillCam";
            displayName = "Killcam";
            tooltip = "This setting enables the specator killcam functionality.";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class UO_FW_TeamSpectateSettings_AIEnabled_Blufor {
            property = "UO_FW_TeamSpectateSettings_AIEnabled_Blufor";
            displayName = "Spectate AI";
            tooltip = "Enable Spectating AI Entities.";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class UO_FW_TeamSpectateSettings_FreeCam_Blufor {
            property = "UO_FW_TeamSpectateSettings_FreeCam";
            displayName = "Spectator Freecam";
            tooltip = "Enable Freecam Ability in Spectator.";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class UO_FW_TeamSpectateSettings_3rdPerson_Blufor {
            property = "UO_FW_TeamSpectateSettings_3rdPerson";
            displayName = "Spectator Third Person";
            tooltip = "Enable Third Person Ability in Spectator.";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
    };
};

class UO_FW_TeamJIPSettings_BLUFOR {
    displayName = "BLUFOR JiP Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_JIP_Type_BLUFOR {
            property = "UO_FW_JIP_Type_BLUFOR";
            displayName = "JiP Type";
            tooltip = "TELEPORT: Player can teleport to his squad. TRANSPORT: Player can send a hint to all group leaders requesting transport. DENY: Player is killed and put in spectator.";
            control = "UO_FW_JIPTypeAtt";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "0";
        };
        class UO_FW_JIP_Distance_BLUFOR {
            property = "UO_FW_JIP_Distance_BLUFOR";
            displayName = "JiP Distance";
            tooltip = "If distance to group members upon spawn is greater than this you will be granted the defined JiP action";
            control = "UO_FW_50To200Step50_Slider";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "200";
        };
        class UO_FW_JIP_SpawnDistance_BLUFOR {
            property = "UO_FW_JIP_SpawnDistance_BLUFOR";
            displayName = "Spawn Radius";
            tooltip = "Exiting this radius will remove the JiP actions from the player.";
            control = "UO_FW_50To200Step50_Slider";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "50";
        };
    };
};
