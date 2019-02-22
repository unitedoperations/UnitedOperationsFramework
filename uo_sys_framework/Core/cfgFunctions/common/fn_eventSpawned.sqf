/*
 * Author: Olsen
 *
 * If unit is tracked increase number of alive units on it's team.
 *
 * Arguments:
 * 0: unit to track <object>
 *
 * Return Value:
 * nothing
 *
 * Public: No
 */

#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

params ["_unit"];

if (GETVAR(_unit,Tracked,false)) then {
    SETVAR(_unit,HasDied,false); //we will use this variable to make sure killed eventHandler doesn't fire twice
    {
        _x params ["", "_side", "_Type", "_total", "_current"];
        if (GETVAR(_unit,Side,"") isEqualto _side && {((_Type isEqualto "player" && isPlayer _unit) || (_Type isEqualto "ai" && !(isPlayer _unit)) || (_Type isEqualto "both"))}) exitWith {
            _x set [3, (_total + 1)];
            if (_unit call UO_FW_fnc_Alive) then {
                _x set [4, (_current + 1)];
            };
        };
    } forEach UO_FW_Teams;
};
