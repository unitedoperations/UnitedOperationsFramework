/*	Description: Generates Teams based off of 3DEN settings
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		N/A
 *	Author
 *		PiZZADOX
 */

#include "\x\UO_FW\addons\main\script_macros.hpp"
#include "\x\UO_FW\addons\main\Core\module_macros.hpp"
UO_FW_EXEC_CHECK(SERVER)

_bluforname = (getMissionConfigValue  ["UO_FW_TeamSetting_Blufor_TeamName","BLUFOR"]);
_opforname = (getMissionConfigValue  ["UO_FW_TeamSetting_Opfor_TeamName","OPFOR"]);
_indforname = (getMissionConfigValue  ["UO_FW_TeamSetting_Indfor_TeamName","INDFOR"]);
_civname = (getMissionConfigValue  ["UO_FW_TeamSetting_Civ_TeamName","CIVILIAN"]);

switch (UO_FW_TeamSetting_Blufor_TeamType) do {
	case 0: {
		UO_FW_ADDTEAM(west,_bluforname,"player")
	};
	case 1: {
		UO_FW_ADDTEAM(west,_bluforname,"ai")
	};
	case 2: {
		UO_FW_ADDTEAM(west,_bluforname,"both")
	};
	default {
		UO_FW_ADDTEAM(west,_bluforname,"both")
	};
};

switch (UO_FW_TeamSetting_Opfor_TeamType) do {
	case 0: {
		UO_FW_ADDTEAM(east,_opforname,"player")
	};
	case 1: {
		UO_FW_ADDTEAM(east,_opforname,"ai")
	};
	case 2: {
		UO_FW_ADDTEAM(east,_opforname,"both")
	};
	default {
		UO_FW_ADDTEAM(east,_opforname,"both")
	};
};

switch (UO_FW_TeamSetting_Indfor_TeamType) do {
	case 0: {
		UO_FW_ADDTEAM(resistance,_indforname,"player")
	};
	case 1: {
		UO_FW_ADDTEAM(resistance,_indforname,"ai")
	};
	case 2: {
		UO_FW_ADDTEAM(resistance,_indforname,"both")
	};
	default {
		UO_FW_ADDTEAM(resistance,_indforname,"both")
	};
};

switch (UO_FW_TeamSetting_Civ_TeamType) do {
	case 0: {
		UO_FW_ADDTEAM(civilian,_civname,"player")
	};
	case 1: {
		UO_FW_ADDTEAM(civilian,_civname,"ai")
	};
	case 2: {
		UO_FW_ADDTEAM(civilian,_civname,"both")
	};
	default {
		UO_FW_ADDTEAM(civilian,_civname,"both")
	};
};
