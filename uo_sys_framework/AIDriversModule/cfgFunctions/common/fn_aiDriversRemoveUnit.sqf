/*	Description: Removes AI Driver
 * 		OBJECT - vehicle
 *	Return Value:
 * 		ARRAY
 *	Author
 *		BlackHawk & PiZZADOX
 */

#define COMPONENT AIDrivers
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params ["_target"];

private _driver = _target getVariable ["UO_FW_aidrivers_driver", objNull];

if (!isNull _driver) then {
    deleteVehicle _driver;
    private _handle = _target getVariable ["UO_FW_aidrivers_pfhID", []];
    if ((count _handle) != 0) then {
        [_handle select 1] remoteExec ["CBA_fnc_removePerFrameHandler", _handle select 0];
    };
};

UO_FW_AiDriverVehicle = objNull;
[false] call UO_FW_fnc_aiDriversToggleDriverCam;
hint "Driver removed";
