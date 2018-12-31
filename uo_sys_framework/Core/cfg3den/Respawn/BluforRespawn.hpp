class UO_FW_TeamRespawnSettings_Blufor
{
    displayName = "Blufor Respawn Settings";
    collapsed = 0;
    class Attributes
    {
			class UO_FW_RespawnSetting_Type_Blufor {
				displayName = "Respawn System";
				tooltip = "Type of respawn system for BLUFOR. Place down Gamelogic with name uo_fw_west_respawn to define respawn location.";
				control = "Combo";
				typeName = "NUMBER";
				property = "UO_FW_SetupTimer_SideSelect";
				expression = "_this setVariable ['%s',_value,true];";
				validate = "none";
				class values {
					 class None    {name = "1 Life"; value = 0; default = 0;};
					 class Unlimited    {name = "Unlimited"; value = 1;};
					 class IndTickets    {name = "Individual Tickets"; value = 2;};
					 class TeamTickets    {name = "Team Tickets"; value = 3;};
					 class Wave    {name = "Wave Respawn"; value = 4;};
					 class Triggered    {name = "Triggered Respawn"; value = 5;};
				};
				defaultValue = "0";
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
