/*
 * Author: Olsen
 *
 * Returns casualty percentage for set team
 *
 * Arguments:
 * 0: team <string>
 *
 * Return Value:
 * casualty percentage (1-100) <number>
 *
 * Public: Yes
 */

#include "\x\UO_FW\addons\Main\script_macros.hpp"

private _team = _this;

private _count = 0;

private _start = [_team, 3] call UO_FW_fnc_GetTeamVariable;
private _current = [_team, 4] call UO_FW_fnc_GetTeamVariable;

if (_start == 0) then {

	private _tempText = format ["Casualty count:<br></br>Warning no units on team ""%1"".", _team];
	UO_FW_DEBUG(_tempText,_tempText);
} else {
	_count = (_start - _current) / (_start * 0.01);
};

_count
