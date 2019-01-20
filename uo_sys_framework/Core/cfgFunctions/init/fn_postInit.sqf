/*	Description: Main UO Framework Init. Declares needed vars, calls core functions
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		N/A
 *	Author
 *		PiZZADOX
 */

#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

//Universal init

if (isServer) then {
	//Server init
	[] call UO_FW_fnc_StartingCount; //DO NOT REMOVE
};

if (!isDedicated) then {
	[] call UO_FW_fnc_BriefingFrameworkEntry;
	//non server init
	//Anything done using "player" must be past this line for JIP compatibility

	if (!isServer && hasinterface) then {
		//MP player init
		//Tells the server the player has spawned
		["UO_FW_PlayerSpawned", player] call CBA_fnc_serverEvent;

		["endMission", {
			private _msg = "Mission ended by admin";
			if (count (_this select 0) > 0) then {
				_msg = _msg + ": " + (_this select 0);
			};
			_msg call UO_FW_fnc_EndMission;
		}, "admin"] call CBA_fnc_registerChatCommand;
	};

	if (!isServer && !hasinterface) then {
		//HC init
	};



	UO_FW_RespawnTickets = 0;

	switch (side player) do {
 		case west: {
 			UO_FW_RespawnTickets = (missionNamespace getVariable ["UO_FW_TeamSetting_Blufor_RespawnTickets",0]);
 		};
		case east: {
 			UO_FW_RespawnTickets = (missionNamespace getVariable ["UO_FW_TeamSetting_Opfor_RespawnTickets",0]);
 		};
		case resistance: {
 			UO_FW_RespawnTickets = (missionNamespace getVariable ["UO_FW_TeamSetting_Indfor_RespawnTickets",0]);
 		};
		case civilian: {
 			UO_FW_RespawnTickets = (missionNamespace getVariable ["UO_FW_TeamSetting_Civ_RespawnTickets",0]);
 		};
 	};
};
