/*
 * Author: Olsen
 *
 * Triggered by unit death. Decreases number of alive units on a set side in UO_FW_Teams.
 *
 * Arguments:
 * 0: unit that has died <object>
 * 1: killer of the unit <object> (OPTIONAL)
 *
 * Return Value:
 * nothing
 *
 * Public: No
 */

#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

params [["_unit", objNull, [objNull]],["_killer", objNull, [objNull]]];

if (_unit getVariable ["UO_FW_Tracked", false]) then {
    {
        _x params ["", "_side", "_Type", "", "_current"];
        if (!(_unit getVariable ["UO_FW_HasDied", false]) && {!(_unit getVariable ["UO_FW_Dead", false])} && {(_unit getVariable "UO_FW_Side" isEqualto _side)} && {((_Type isEqualto "player" && isPlayer _unit) || (_Type isEqualto "ai" && !(isPlayer _unit)) || (_Type isEqualto "both"))}) exitWith {
            _unit setVariable ["UO_FW_HasDied", true];
            _x set [4, (_current - 1)];
        };
    } forEach UO_FW_Teams;
};
