/*	Description: Generates Teams based off of 3DEN settings
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		N/A
 *	Author
 *		PiZZADOX
 */

#define COMPONENT Core
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

private _bluforname = (getMissionConfigValue  ["UO_FW_TeamSetting_Blufor_TeamName","BLUFOR"]);
private _opforname = (getMissionConfigValue  ["UO_FW_TeamSetting_Opfor_TeamName","OPFOR"]);
private _indforname = (getMissionConfigValue  ["UO_FW_TeamSetting_Indfor_TeamName","INDFOR"]);
private _civname = (getMissionConfigValue  ["UO_FW_TeamSetting_Civ_TeamName","CIVILIAN"]);

switch (UO_FW_TeamSetting_Blufor_TeamType) do {
	case 0: {
		[west,_bluforname,"player"] call UO_FW_fnc_AddTeam;
	};
	case 1: {
		[west,_bluforname,"ai"] call UO_FW_fnc_AddTeam;
	};
	case 2: {
		[west,_bluforname,"both"] call UO_FW_fnc_AddTeam;
	};
	default {
		[west,_bluforname,"both"] call UO_FW_fnc_AddTeam;
	};
};

switch (UO_FW_TeamSetting_Opfor_TeamType) do {
	case 0: {
		[east,_opforname,"player"] call UO_FW_fnc_AddTeam;
	};
	case 1: {
		[east,_opforname,"ai"] call UO_FW_fnc_AddTeam;
	};
	case 2: {
		[east,_opforname,"both"] call UO_FW_fnc_AddTeam;
	};
	default {
		[east,_opforname,"both"] call UO_FW_fnc_AddTeam;
	};
};

switch (UO_FW_TeamSetting_Indfor_TeamType) do {
	case 0: {
		[resistance,_indforname,"player"] call UO_FW_fnc_AddTeam;
	};
	case 1: {
		[resistance,_indforname,"ai"] call UO_FW_fnc_AddTeam;
	};
	case 2: {
		[resistance,_indforname,"both"] call UO_FW_fnc_AddTeam;
	};
	default {
		[resistance,_indforname,"both"] call UO_FW_fnc_AddTeam;
	};
};

switch (UO_FW_TeamSetting_Civ_TeamType) do {
	case 0: {
		[civilian,_civname,"player"] call UO_FW_fnc_AddTeam;
	};
	case 1: {
		[civilian,_civname,"ai"] call UO_FW_fnc_AddTeam;
	};
	case 2: {
		[civilian,_civname,"both"] call UO_FW_fnc_AddTeam;
	};
	default {
		[civilian,_civname,"both"] call UO_FW_fnc_AddTeam;
	};
};
