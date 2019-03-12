/*    Description: Toggles AI Driver action depending on active setting
 *    Arguments:
 *         N/A
 *    Return Value:
 *         ARRAY
 *    Author
 *        BlackHawk & PiZZADOX
 */

#define COMPONENT AIDrivers
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);

params ["_target", "_caller"];
if (!isNull (GETVAR(_target,Driver,objnull))) then {
    [_target] call FUNC(RemoveUnit);
} else {
    [_target, _caller] call FUNC(CreateUnit);
};
