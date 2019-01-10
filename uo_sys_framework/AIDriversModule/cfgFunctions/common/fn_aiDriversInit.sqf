/*	Description: Gives actions to vehicles with AI Driver enabled
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY
 *	Author
 *		PiZZADOX
 */

#define COMPONENT AIDrivers
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

if (((MissionNameSpace getvariable ["UO_FW_AIDrivers_VehClasses",""]) isEqualto "") && !(MissionNameSpace getvariable ["UO_FW_AIDrivers_AllVehs",false])) exitwith {};
["AI Drivers", "Module for adding AI Drivers to vehicles", "BlackHawk & PiZZADOX and Sacher"] call UO_FW_FNC_RegisterModule;
if (isNil "UO_FW_AiDriverVehicle") then {UO_FW_AiDriverVehicle = objNull;};
private _allowNV = MissionNameSpace getVariable ["UO_FW_AIDrivers_NVEnabled",false];
private _allowFlip = MissionNameSpace getVariable ["UO_FW_AIDrivers_FlipEnabled",false];

if (MissionNameSpace getvariable ["UO_FW_AIDrivers_AllVehs",false]) then {
	[{time > 1},{
		{
			[_x,_allowNV,_allowFlip] call UO_FW_fnc_aiDriversEnableAIDriver;
		} foreach vehicles;
	}] call CBA_fnc_WaitUntilAndExecute;
} else {
	if !((MissionNameSpace getvariable ["UO_FW_AIDrivers_VehClasses",""]) isEqualto "") then {
		[{time > 1},{
			{
				if ((typeOf _x) in (missionNamespace getVariable ["UO_FW_AIDrivers_VehClasses",[]])) then {[_x,_allowNV,_allowFlip] call UO_FW_fnc_aiDriversEnableAIDriver;};
			} foreach vehicles;
		}] call CBA_fnc_WaitUntilAndExecute;
	};
};
