class UO_FW_TeamRespawnSettings_Blufor
{
    displayName = "Blufor Respawn Settings";
    collapsed = 0;
    class Attributes
    {
			class UO_FW_RespawnSetting_Type_Blufor {
				displayName = "Respawn System";
				tooltip = "Type of respawn system for BLUFOR. Place down Gamelogic with name uo_fw_west_respawn to define respawn location.";
				control = "UO_FW_RespawnComboAttribute";
				typeName = "STRING";
				property = "UO_FW_RespawnSetting_Type_Blufor";
				expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
				defaultValue = "'ONELIFE'";
			};
	    class UO_FW_RespawnSetting_IndTickets_Blufor
	    {
	        property = "UO_FW_RespawnSetting_IndTickets_Blufor";
	        displayName = "BLUFOR Individual Respawn Tickets";
	        tooltip = "Number of individual respawns.";
	        control = "EditShort";
	        expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
	        defaultValue = "0";
	        validate = "number";
	    };
			class UO_FW_RespawnSetting_TeamTickets_Blufor
	    {
	        property = "UO_FW_RespawnSetting_TeamTickets_Blufor";
	        displayName = "BLUFOR Team Respawn Tickets";
	        tooltip = "Number of team respawns.";
	        control = "EditShort";
	        expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
	        defaultValue = "0";
	        validate = "number";
	    };
    };
};

//	    class UO_FW_RespawnSetting_IndTickets_Opfor
//	    {
//	        property = "UO_FW_RespawnSetting_IndTickets_Opfor";
//	        displayName = "OPFOR Individual Respawn Tickets";
//	        tooltip = "Number of individual respawns. Place down Gamelogic with name uo_fw_east_respawn to define respawn location.";
//	        control = "EditShort";
//	        expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
//	        defaultValue = "0";
//	        validate = "number";
//	    };
//	    class UO_FW_RespawnSetting_IndTickets_Indfor
//	    {
//	        property = "UO_FW_RespawnSetting_IndTickets_Indfor";
//	        displayName = "INDFOR Individual Respawn Tickets";
//	        tooltip = "Number of individual respawns. Place down Gamelogic with name uo_fw_guer_respawn to define respawn location.";
//	        control = "EditShort";
//	        expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
//	        defaultValue = "0";
//	        validate = "number";
//	    };
//	    class UO_FW_RespawnSetting_IndTickets_Civ
//	    {
//	        property = "UO_FW_RespawnSetting_IndTickets_Civ";
//	        displayName = "Civilian Individual Respawn Tickets";
//	        tooltip = "Number of individual respawns. Place down Gamelogic with name uo_fw_civ_respawn to define respawn location.";
//	        control = "EditShort";
//	        expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
//	        defaultValue = "0";
//	        validate = "number";
//	    };
