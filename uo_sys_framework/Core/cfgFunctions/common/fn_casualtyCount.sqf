/*
 * Author: Olsen
 *
 * Counts number of casualties on set team
 *
 * Arguments:
 * 0: team <string>
 *
 * Return Value:
 * casualty count <number>
 *
 * Public: Yes
 */

#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params ["_team"];
private _count = 0;
private _start = [_team, 3] call UO_FW_fnc_GetTeamVariable;
private _current = [_team, 4] call UO_FW_fnc_GetTeamVariable;
if (_start isEqualto 0) then {
    ERROR_1("Casualty count:<br></br>Warning no units on team ""%1"".", _team);
} else {
    _count = _start - _current;
};

_count
