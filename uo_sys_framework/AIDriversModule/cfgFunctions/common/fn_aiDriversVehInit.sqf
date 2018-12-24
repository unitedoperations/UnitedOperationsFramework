/*	Description: Gives actions to vehicles with AI Driver enabled
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY
 *	Author
 *		PiZZADOX
 */

#include "\x\UO_FW\addons\main\script_macros.hpp"
if (!UO_FW_SERVER_AIDRIVERSMODULE_ALLOWED) exitWith {};
params ["_vehicle"];
["AI Drivers", "Module for adding AI Drivers to vehicles", "PiZZADOX and Sacher"] call UO_FW_FNC_RegisterModule;
if (isNil "UO_FW_AiDriverVehicle") then {UO_FW_AiDriverVehicle = objNull;};

[{time > 1},{
		if(_vehicle getVariable ["UO_FW_AIDriverVeh_Enabled",false]) then {
			_allowNV = (_vehicle getVariable ["UO_FW_AIDriversVeh_NVEnabled",false]);
			_allowFlip = (_vehicle getVariable ["UO_FW_AIDriversVeh_FlipEnabled",false]);
			[_vehicle,_allowNV,_allowFlip] call UO_FW_fnc_aiDriversEnableAIDriver;
		};
}] call CBA_fnc_WaitUntilAndExecute;
