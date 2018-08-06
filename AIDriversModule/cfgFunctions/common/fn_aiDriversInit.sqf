/*	Description: Gives actions to vehicles with AI Driver enabled
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY 	
 *	Author
 *		PiZZADOX
 */

#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL)

if (!(UO_FW_AIDrivers_VehClasses isEqualto "")) then {
	if ((UO_FW_AIDrivers_VehClasses find ",") >= 0) then {
		//private _VehClasses_Array_Separate = UO_FW_AIDrivers_VehClasses splitstring ",";
		[{time > 1},{
			{
				if ((typeOf _x) in UO_FW_AIDrivers_VehClasses) then {[_x] call UO_FW_fnc_aiDriversEnableAIDriver;};
			} foreach vehicles;
		}] call CBA_fnc_WaitUntilAndExecute;
	} else {
		[{time > 1},{
			{
				if ((typeOf _x) isEqualto _VehClasses_Array_Separate) then {[_x] call UO_FW_fnc_aiDriversEnableAIDriver;};
			} foreach vehicles;
		}] call CBA_fnc_WaitUntilAndExecute;
	};
};

if (UO_FW_AIDrivers_AllVehs) then {
	[{time > 1},{
		{
			[_x] call UO_FW_fnc_aiDriversEnableAIDriver;
		} foreach vehicles;
	}] call CBA_fnc_WaitUntilAndExecute;
};

if (UO_FW_AIDrivers_AllVehs) then {
	[{time > 1},{
		{
			[_x] call UO_FW_fnc_aiDriversEnableAIDriver;
		} foreach vehicles;
	}] call CBA_fnc_WaitUntilAndExecute;
};