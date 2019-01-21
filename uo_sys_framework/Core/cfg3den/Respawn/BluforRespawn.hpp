class UO_FW_TeamRespawnSettings_Blufor {
    displayName = "Blufor Respawn Settings";
    collapsed = 0;
    class Attributes {
        //_respawnTypeArray = [['1 Life','ONELIFE'],['Unlimited','UNLIMITED'],['Individual Tickets','INDTICKETS'],['Team Tickets','TEAMTICKETS'],['Wave','WAVE'],['Triggered','TRIGGERED']];
        class UO_FW_RespawnSetting_Type_Blufor {
            displayName = "Respawn System";
            tooltip = "Type of respawn system for BLUFOR. Place down Gamelogic with name uo_fw_west_respawn to define respawn location.";
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
        class UO_FW_RespawnSetting_Delay_Blufor {
            property = "UO_FW_RespawnSetting_Delay_Blufor";
            displayName = "Respawn Delay";
            tooltip = "Delay in seconds between a player being killed and respawning. Must be more than 5 seconds.";
            respawnTypes[] = {1,2,3,4,5};
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "5";
            validate = "number";
        };
        class UO_FW_RespawnSetting_IndTickets_Blufor {
            property = "UO_FW_RespawnSetting_IndTickets_Blufor";
            displayName = "Individual Respawn Tickets";
            tooltip = "Number of individual respawns.";
            respawnTypes[] = {2};
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "2";
            validate = "number";
        };
        class UO_FW_RespawnSetting_TeamTickets_Blufor {
            property = "UO_FW_RespawnSetting_TeamTickets_Blufor";
            displayName = "Team Respawn Tickets";
            tooltip = "Number of team respawns.";
            respawnTypes[] = {3};
            control = "EditShort";
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
