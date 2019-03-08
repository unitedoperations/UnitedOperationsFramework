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
EXEC_CHECK(CLIENT);

[QEGVAR(Core,SettingsLoaded), {
	if !(UO_FW_Server_AIDRIVERSMODULE_Allowed) exitwith {};
	if (((GETMVAR(VehClasses,[])) isEqualto []) && {!(GETMVAR(AllVehs,false))}) exitwith {};
	[QEGVAR(Core,RegisterModuleEvent), ["AI Drivers", "Module for adding AI Drivers to vehicles", "BlackHawk, PiZZADOX and Sacher"]] call CBA_fnc_globalEventJIP;
	private _allowNV = GETMVAR(NVEnabled,false);
	private _allowFlip = GETMVAR(FlipEnabled,false);

	if (GETMVAR(AllVehs,false)) then {
		[{CBA_missionTime > 1}, {
			{
				[QGVAR(Enabled_Event),[_x,_allowNV,_allowFlip]] call CBA_fnc_globalEventJIP;
			} foreach vehicles;
		}] call CBA_fnc_WaitUntilAndExecute;
	} else {
		if (!(GETMVAR(VehClasses,[])) isEqualto []) then {
			[{CBA_missionTime > 1}, {
				{
					if ((typeOf _x) in (GETMVAR(VehClasses,[]))) then {[QGVAR(Enabled_Event),[_x,_allowNV,_allowFlip]] call CBA_fnc_globalEventJIP;};
				} foreach vehicles;
			}] call CBA_fnc_WaitUntilAndExecute;
		};
	};
}] call CBA_fnc_addEventHandler;
