class UO_FW_TeamRespawnSettings_Blufor {
    displayName = "Blufor Respawn Settings";
    collapsed = 0; //_respawnTypeArray = [['1 Life','ONELIFE'],['Unlimited','UNLIMITED'],['Individual Tickets','INDTICKETS'],['Team Tickets','TEAMTICKETS'],['Wave','WAVE'],['Triggered','TRIGGERED']];\
    class Attributes {
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
		class UO_FW_RespawnSetting_WaveSize_Blufor {
	        property = "UO_FW_RespawnSetting_WaveSize_Blufor";
	        displayName = "Wave Condition";
	        tooltip = "Number of team respawns.";
			respawnTypes[] = {4};
	        control = "EditCode";
	        expression = UO_FW_SCENARIO_EXPRESSION;
	        defaultValue = "''";
	        validate = "expression";
	    };
		class UO_FW_RespawnSetting_TriggeredCond_Blufor {
	        property = "UO_FW_RespawnSetting_TriggeredCond_Blufor";
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
