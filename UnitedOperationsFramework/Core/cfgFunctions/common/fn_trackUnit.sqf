/*
 * Author: Olsen
 *
 * Initialize tracking of unit.
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

if (!(_unit getVariable ["UO_FW_Tracked", false])) then {

	_unit setVariable ["UO_FW_Side", side _unit];
	_unit setVariable ["UO_FW_Tracked", true];

	_unit call UO_FW_fnc_EventSpawned;

};
