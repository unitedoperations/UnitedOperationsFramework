class UO_FW_TeamRespawnSettings_Civilian {
    displayName = "Civilian Respawn Settings";
    collapsed = 0; //_respawnTypeArray = [['1 Life','ONELIFE'],['Unlimited','UNLIMITED'],['Individual Tickets','INDTICKETS'],['Team Tickets','TEAMTICKETS'],['Wave','WAVE'],['Triggered','TRIGGERED']];\
	class Attributes {
		class UO_FW_RespawnSetting_Type_Civilian {
			displayName = "Respawn System";
			tooltip = "Type of respawn system for Civilian. Place down Gamelogic with name uo_fw_west_respawn to define respawn location.";
			control = "UO_FW_Respawn_Combo";
			value=0;
			property = "UO_FW_RespawnSetting_Type_Civilian";
			expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
		};
		class UO_FW_RespawnSetting_Templates_Civilian {
	        property = "UO_FW_RespawnSetting_Templates_Civilian";
	        displayName = "Civilian Individual Respawn Tickets";
	        tooltip = "Number of individual respawns.";
	        control = "UO_FW_RespawnTemplates";
	        expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
			defaultValue="['']";
	    };
	    class UO_FW_RespawnSetting_IndTickets_Civilian {
	        property = "UO_FW_RespawnSetting_IndTickets_Civilian";
	        displayName = "Civilian Individual Respawn Tickets";
	        tooltip = "Number of individual respawns.";
			respawnTypes[] = {1};
	        control = "EditShort";
	        expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
	        defaultValue = "2";
	        validate = "number";
	    };
		class UO_FW_RespawnSetting_TeamTickets_Civilian {
	        property = "UO_FW_RespawnSetting_TeamTickets_Civilian";
	        displayName = "Civilian Team Respawn Tickets";
	        tooltip = "Number of team respawns.";
			respawnTypes[] = {2};
	        control = "EditShort";
	        expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
	        defaultValue = "30";
	        validate = "number";
	    };
    };
};
