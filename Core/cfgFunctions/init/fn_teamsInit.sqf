/*	Description: Generates Teams based off of 3DEN settings
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		N/A 	
 *	Author
 *		PiZZADOX
 */

#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER)

switch (UO_FW_TeamSetting_Blufor_TeamType) do {
	case 0: {
		UO_FW_ADDTEAM(west,UO_FW_TeamSetting_Blufor_TeamName,"player")
	};
	case 1: {
		UO_FW_ADDTEAM(west,UO_FW_TeamSetting_Blufor_TeamName,"ai")
	};
	case 2: {
		UO_FW_ADDTEAM(west,UO_FW_TeamSetting_Blufor_TeamName,"both")
	};
	default {
		UO_FW_ADDTEAM(west,UO_FW_TeamSetting_Blufor_TeamName,"both")
	};
};

switch (UO_FW_TeamSetting_Opfor_TeamType) do {
	case 0: {
		UO_FW_ADDTEAM(east,UO_FW_TeamSetting_Opfor_TeamName,"player")
	};
	case 1: {
		UO_FW_ADDTEAM(east,UO_FW_TeamSetting_Opfor_TeamName,"ai")
	};
	case 2: {
		UO_FW_ADDTEAM(east,UO_FW_TeamSetting_Opfor_TeamName,"both")
	};
	default {
		UO_FW_ADDTEAM(east,UO_FW_TeamSetting_Opfor_TeamName,"both")
	};
};

switch (UO_FW_TeamSetting_Indfor_TeamType) do {
	case 0: {
		UO_FW_ADDTEAM(resistance,UO_FW_TeamSetting_Indfor_TeamName,"player")
	};                      
	case 1: {               
		UO_FW_ADDTEAM(resistance,UO_FW_TeamSetting_Indfor_TeamName,"ai")
	};                      
	case 2: {               
		UO_FW_ADDTEAM(resistance,UO_FW_TeamSetting_Indfor_TeamName,"both")
	};                      
	default {               
		UO_FW_ADDTEAM(resistance,UO_FW_TeamSetting_Indfor_TeamName,"both")
	};
};

switch (UO_FW_TeamSetting_Civ_TeamType) do {
	case 0: {
		UO_FW_ADDTEAM(civilian,UO_FW_TeamSetting_Civ_TeamName,"player")
	};
	case 1: {
		UO_FW_ADDTEAM(civilian,UO_FW_TeamSetting_Civ_TeamName,"ai")
	};
	case 2: {
		UO_FW_ADDTEAM(civilian,UO_FW_TeamSetting_Civ_TeamName,"both")
	};
	default {
		UO_FW_ADDTEAM(civilian,UO_FW_TeamSetting_Civ_TeamName,"both")
	};
};