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

private _unit = _this;

if (isNil "UO_FW_Teams") then {[] call UO_FW_fnc_teamsInit;};

if (_unit getVariable ["UO_FW_Tracked", false]) then {

	_unit setVariable ["UO_FW_HasDied", false]; //we will use this variable to make sure killed eventHandler doesn't fire twice

	{
		_x params ["", "_side", "_type", "_total", "_current"];


		if (_unit getVariable "UO_FW_Side" == _side and ((_type == "player" && isPlayer _unit) || (_type == "ai" && !(isPlayer _unit)) || (_type == "both"))) exitWith {

			_x set [3, _total + 1];

			if (_unit call UO_FW_fnc_Alive) then {

				_x set [4, _current + 1];

			};

		};

	} forEach UO_FW_Teams;

};
