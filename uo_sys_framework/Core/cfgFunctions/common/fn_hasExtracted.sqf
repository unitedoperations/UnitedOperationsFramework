/*
 * Author: BlackHawk
 *
 * Checks if given part of team has extracted to set area.
 * This function accounts for team starting in extraction area.
 *
 * Arguments:
 * 0: team name <string>
 * 1: extraction area marker <string>
 * 2: part of team that has to extract (0.8 - 80%, etc.) <number> (OPTIONAL)
 *
 * Return Value:
 * has team extracted <bool>
 *
 * Public: Yes
 */

#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params [["_team", "", [""]],
    ["_marker", "", [""]],
    ["_ratio", 1, [0]]
];
private _side = [_team, 1] call UO_FW_fnc_getTeamVariable;
private _count = {
    (side _x isEqualto _side) && {(_x inArea _marker)}
} count allUnits;

private _result = false;
if (_count >= _ratio * ([_team, 4] call UO_FW_fnc_getTeamVariable)) then {
    if (UO_FW_GETMVAR(hasDeparted,false)) then {
        _result = true;
    };
} else {
    UO_FW_hasDeparted = true;
};
_result
