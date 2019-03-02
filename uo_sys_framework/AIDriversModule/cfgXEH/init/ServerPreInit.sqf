/*	Description: Gives actions to vehicles with AI Driver enabled
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY
 *	Author
 *		PiZZADOX & Sacher
 */


#define COMPONENT AIDrivers
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

["UO_FW_SettingsLoaded", {
	if (!(UO_FW_Server_AIDRIVERSMODULE_Allowed)) exitwith {};

	if (((GETMVAR(VehClasses,[])) isEqualto []) && {!(GETMVAR(AllVehs,false))}) exitwith {};
	["UO_FW_RegisterModuleEvent", ["AI Drivers", "Module for adding AI Drivers to vehicles", "BlackHawk, PiZZADOX and Sacher"]] call CBA_fnc_globalEventJIP;
	private _allowNV = (GETMVAR(NVEnabled,false));
	private _allowFlip = (GETMVAR(FlipEnabled,false));

	if ((GETMVAR(AllVehs,false))) then {
		[{CBA_missionTime > 1}, {
			{
				["UO_FW_AIDriver_Enabled_Event",[_x,_allowNV,_allowFlip]] call CBA_fnc_globalEventJIP;
			} foreach vehicles;
		}] call CBA_fnc_WaitUntilAndExecute;
	} else {
		if (!(GETMVAR(AIDrivers_VehClasses,[])) isEqualto []) then {
			[{CBA_missionTime > 1}, {
				{
					if ((typeOf _x) in (GETMVAR(VehClasses,[]))) then {["UO_FW_AIDriver_Enabled_Event",[_x,_allowNV,_allowFlip]] call CBA_fnc_globalEventJIP;};
				} foreach vehicles;
			}] call CBA_fnc_WaitUntilAndExecute;
		};
	};
}] call CBA_fnc_addEventHandler;
