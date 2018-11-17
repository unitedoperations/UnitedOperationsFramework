/*	Description: Initalizes hostage module
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY 	
 *	Author
 *		Starfox64 (Ported by TrainDoctor)
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
["Hostage Control", "Allows the mission maker to easily add hostages to their missions.", "Original by Starfox64. Ported by TrainDoctor"] call UO_FW_FNC_RegisterModule;
[] spawn {
	{
		if((_x getVariable ["UO_FW_Hostage_State",false])) then {
		  [_x,_x getVariable ["UO_FW_Hostage_Rescue_Location",""]] call UO_FW_FNC_HostageSet;
		};
	} forEach allUnits;
};