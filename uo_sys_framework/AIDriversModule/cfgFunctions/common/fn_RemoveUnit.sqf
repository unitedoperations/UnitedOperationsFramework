/*    Description: Removes AI Driver
 *         OBJECT - vehicle
 *    Return Value:
 *         ARRAY
 *    Author
 *        BlackHawk & PiZZADOX
 */

#define COMPONENT AIDrivers
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);

params ["_target"];

private _driver = GETVAR(_target,driver,objnull);

if (!isNull _driver) then {
    deleteVehicle _driver;
};

SETPVAR(_target,driver,objnull);
GVAR(Vehicle) = objNull;
[false] call FUNC(ToggleDriverCam);
hint "Driver Removed";
