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

#define COMPONENT EndConditions
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(SERVER);

params [["_team", "", [""]],["_marker", "", [""]],["_ratio", 1, [0]]];

private _side = [_team, 1] call EFUNC(Core,getTeamVariable);
private _count = {
    (_x inArea _marker)
} count ([_side] call EFUNC(Core,alivePlayers));

private ["_respawnTypeNum","_result"];

switch (_side) do {
    case west: {
        _respawnTypeNum = GETMVAR(hasDeparted_BLUFOR,false);
        if (_count >= _ratio * ([_team, 4] call EFUNC(Core,getTeamVariable))) then {
            if (_respawnTypeNum) then {
                _result = true;
            };
        } else {
            SETMPVAR(hasDeparted_BLUFOR,true);
        };
    };
    case east: {
        _respawnTypeNum = GETMVAR(hasDeparted_OPFOR,false);
        if (_count >= _ratio * ([_team, 4] call EFUNC(Core,getTeamVariable))) then {
            if (_respawnTypeNum) then {
                _result = true;
            };
        } else {
            SETMPVAR(hasDeparted_OPFOR,true);
        };
    };
    case independent: {
        _respawnTypeNum = GETMVAR(hasDeparted_Indfor,false);
        if (_count >= _ratio * ([_team, 4] call EFUNC(Core,getTeamVariable))) then {
            if (_respawnTypeNum) then {
                _result = true;
            };
        } else {
            SETMPVAR(hasDeparted_Indfor,true);
        };
    };
    case civilian: {
        _respawnTypeNum = GETMVAR(hasDeparted_Civilian,false);
        if (_count >= _ratio * ([_team, 4] call EFUNC(Core,getTeamVariable))) then {
            if (_respawnTypeNum) then {
                _result = true;
            };
        } else {
            SETMPVAR(hasDeparted_Civilian,true);
        };
    };
    default {_result = false;};
};

_result
