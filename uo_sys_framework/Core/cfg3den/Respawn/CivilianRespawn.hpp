class UO_FW_TeamRespawnSettings_Civ {
    displayName = "Civilian Respawn Settings";
    collapsed = 0; //_respawnTypeArray = [['1 Life','ONELIFE'],['Unlimited','UNLIMITED'],['Individual Tickets','INDTICKETS'],['Team Tickets','TEAMTICKETS'],['Wave','WAVE'],['Triggered','TRIGGERED']];\
    class Attributes {
		class UO_FW_RespawnSetting_Type_Civ {
			displayName = "Respawn System";
			tooltip = "Type of respawn system for Civilian. Place down Gamelogic with name uo_fw_civilian_respawn to define respawn location.";
			control = "UO_FW_Respawn_Combo_Civ";
			defaultValue = "0";
			property = "UO_FW_RespawnSetting_Type_Civ";
			expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
		};
		class UO_FW_RespawnSetting_Templates_Civ {
	        property = "UO_FW_RespawnSetting_Templates_Civ";
	        displayName = "Respawn System Settings";
	        tooltip = "";
	        control = "UO_FW_RespawnTemplates_Civ";
	        expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
			defaultValue = "['']";
	    };
	    class UO_FW_RespawnSetting_IndTickets_Civ {
	        property = "UO_FW_RespawnSetting_IndTickets_Civ";
	        displayName = "Individual Respawn Tickets";
	        tooltip = "Number of individual respawns.";
			respawnTypes[] = {2};
	        control = "EditShort";
	        expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
	        defaultValue = "2";
	        validate = "number";
	    };
		class UO_FW_RespawnSetting_TeamTickets_Civ {
	        property = "UO_FW_RespawnSetting_TeamTickets_Civ";
	        displayName = "Team Respawn Tickets";
	        tooltip = "Number of team respawns.";
			respawnTypes[] = {3};
	        control = "EditShort";
	        expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
	        defaultValue = "30";
	        validate = "number";
	    };
		class UO_FW_RespawnSetting_WaveSize_Civ {
	        property = "UO_FW_RespawnSetting_WaveSize_Civ";
	        displayName = "Wave Condition";
	        tooltip = "Number of team respawns.";
			respawnTypes[] = {4};
	        control = "EditCode";
	        expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
	        defaultValue = "''";
	        validate = "expression";
	    };
		class UO_FW_RespawnSetting_TriggeredCond_Civ {
	        property = "UO_FW_RespawnSetting_TriggeredCond_Civ";
	        displayName = "Triggered Condition";
	        tooltip = "Number of team respawns.";
			respawnTypes[] = {5};
	        control = "EditCode";
	        expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
	        defaultValue = "''";
	        validate = "expression";
	    };
    };
};
