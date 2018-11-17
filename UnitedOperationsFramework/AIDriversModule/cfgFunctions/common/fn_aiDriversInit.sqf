/*	Description: Gives actions to vehicles with AI Driver enabled
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY 	
 *	Author
 *		PiZZADOX
 */

#include "\x\UO_FW\addons\main\script_macros.hpp"
["AI Drivers", "Module for adding AI Drivers to vehicles", "Sacher"] call UO_FW_FNC_RegisterModule; 
UO_FW_AiDriverVehicle = objNull;
_allowNV = UO_FW_AIDrivers_NVEnabled;		
_allowFlip = UO_FW_AIDrivers_FlipEnabled;
		
		[{time > 1},{
			{
				if ((typeOf _x) in (missionNamespace getVariable ["UO_FW_AIDrivers_VehClasses",[]])) then {[_x,_allowNV,_allowFlip] call UO_FW_fnc_aiDriversEnableAIDriver;};
			} foreach vehicles;
		}] call CBA_fnc_WaitUntilAndExecute;


if (UO_FW_AIDrivers_AllVehs) then {
	[{time > 1},{
		{
			[_x,_allowNV,_allowFlip] call UO_FW_fnc_aiDriversEnableAIDriver;
		} foreach vehicles;
	}] call CBA_fnc_WaitUntilAndExecute;
};
