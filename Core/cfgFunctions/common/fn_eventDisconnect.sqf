/*
 * Author: Olsen
 *
 * If unit's alive, reduce number of units on it's side.
 *
 * Arguments:
 * 0: unit that disconnected <object>
 *
 * Return Value:
 * nothing, false <bool> if not found
 *
 * Public: No
 */

private _unit = _this select 0;

if (_unit getVariable ["UO_FW_Tracked", false]) then {

	{
		_x params ["", "_side", "_type", "_total", "_current"];

		if (_unit getVariable "UO_FW_Side" == _side) exitWith {

			if (_unit call UO_FW_fnc_Alive) then {

				_x set [3, _total - 1];
				_x set [4, _current - 1];

				_unit setVariable ["UO_FW_Dead", true, true];
			};

		};

	} forEach UO_FW_Teams;

};

false
