/*	Description: Generates Teams based off of 3DEN settings
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		N/A
 *	Author
 *		PiZZADOX
 */

#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

UO_FW_Teams = []; //DO NOT REMOVE

switch (UO_FW_TeamSetting_Blufor_TeamType) do {
	case 0: {
		[west,UO_FW_TeamSetting_Blufor_TeamName,"player"] call UO_FW_fnc_AddTeam;
	};
	case 1: {
		[west,UO_FW_TeamSetting_Blufor_TeamName,"ai"] call UO_FW_fnc_AddTeam;
	};
	case 2: {
		[west,UO_FW_TeamSetting_Blufor_TeamName,"both"] call UO_FW_fnc_AddTeam;
	};
	default {
		[west,UO_FW_TeamSetting_Blufor_TeamName,"both"] call UO_FW_fnc_AddTeam;
	};
};

switch (UO_FW_TeamSetting_Opfor_TeamType) do {
	case 0: {
		[east,UO_FW_TeamSetting_Opfor_TeamName,"player"] call UO_FW_fnc_AddTeam;
	};
	case 1: {
		[east,UO_FW_TeamSetting_Opfor_TeamName,"ai"] call UO_FW_fnc_AddTeam;
	};
	case 2: {
		[east,UO_FW_TeamSetting_Opfor_TeamName,"both"] call UO_FW_fnc_AddTeam;
	};
	default {
		[east,UO_FW_TeamSetting_Opfor_TeamName,"both"] call UO_FW_fnc_AddTeam;
	};
};

switch (UO_FW_TeamSetting_Indfor_TeamType) do {
	case 0: {
		[resistance,UO_FW_TeamSetting_Indfor_TeamName,"player"] call UO_FW_fnc_AddTeam;
	};
	case 1: {
		[resistance,UO_FW_TeamSetting_Indfor_TeamName,"ai"] call UO_FW_fnc_AddTeam;
	};
	case 2: {
		[resistance,UO_FW_TeamSetting_Indfor_TeamName,"both"] call UO_FW_fnc_AddTeam;
	};
	default {
		[resistance,UO_FW_TeamSetting_Indfor_TeamName,"both"] call UO_FW_fnc_AddTeam;
	};
};

switch (UO_FW_TeamSetting_Civ_TeamType) do {
	case 0: {
		[civilian,UO_FW_TeamSetting_Civ_TeamName,"player"] call UO_FW_fnc_AddTeam;
	};
	case 1: {
		[civilian,UO_FW_TeamSetting_Civ_TeamName,"ai"] call UO_FW_fnc_AddTeam;
	};
	case 2: {
		[civilian,UO_FW_TeamSetting_Civ_TeamName,"both"] call UO_FW_fnc_AddTeam;
	};
	default {
		[civilian,UO_FW_TeamSetting_Civ_TeamName,"both"] call UO_FW_fnc_AddTeam;
	};
};
