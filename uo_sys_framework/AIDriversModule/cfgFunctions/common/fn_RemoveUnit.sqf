/*    Description: Removes AI Driver
 *         OBJECT - vehicle
 *    Return Value:
 *         ARRAY
 *    Author
 *        BlackHawk & PiZZADOX
 */

#define COMPONENT AIDrivers
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params ["_target"];

private _driver = GETVAR(_target,driver,objnull);

if (!isNull _driver) then {
    deleteVehicle _driver;
    private _handle = GETVAR(_target,pfhID,[]);
    if !(_handle isEqualTo []) then {
        [_handle select 1] remoteExec ["CBA_fnc_removePerFrameHandler", _handle select 0];
    };
};

GVAR(Vehicle) = objNull;
[false] call FUNC(ToggleDriverCam);
hint "Driver removed";
