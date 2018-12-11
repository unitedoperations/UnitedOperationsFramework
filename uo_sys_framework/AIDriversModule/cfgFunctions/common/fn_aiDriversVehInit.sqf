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

		

[{time > 1},{
		{
			if(_x getVariable ["UO_FW_AIDriverVeh_Enabled",false]) then
			{
				_allowNV = (_x getVariable ["UO_FW_AIDriversVeh_NVEnabled",false]);		
				_allowFlip = (_x getVariable ["UO_FW_AIDriversVeh_FlipEnabled",false]);
				[_x,_allowNV,_allowFlip] call UO_FW_fnc_aiDriversEnableAIDriver;
			};
			
		} foreach vehicles;
	}] call CBA_fnc_WaitUntilAndExecute;