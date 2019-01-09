/*	Description: Calculate End Screen Count
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY
 *	Author
 *		TinfoilHate
 */

#define COMPONENT ShotCount
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

missionNamespace setVariable ["Blufor_Shotcount_Data",aCount_west_ExpendedAmmunition,true];
missionNamespace setVariable ["Opfor_Shotcount_Data",aCount_east_ExpendedAmmunition,true];
missionNamespace setVariable ["Independent_Shotcount_Data",aCount_resistance_ExpendedAmmunition,true];
missionNamespace setVariable ["Civilian_Shotcount_Data",aCount_civilian_ExpendedAmmunition,true];
