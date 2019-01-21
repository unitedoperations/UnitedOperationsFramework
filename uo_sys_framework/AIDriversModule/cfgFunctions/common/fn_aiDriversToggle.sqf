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
UO_FW_EXEC_CHECK(ALL);

params ["_target", "_caller"];
if (!isNull (_target getVariable ["UO_FW_aidrivers_driver", objNull])) then {
    [_target] call UO_FW_fnc_aiDriversRemoveUnit;
} else {
    [_target, _caller] call UO_FW_fnc_aiDriversCreateUnit;
};
