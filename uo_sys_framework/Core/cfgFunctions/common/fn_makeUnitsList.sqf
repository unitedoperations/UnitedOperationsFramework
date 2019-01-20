/*
 * Author: BlackHawk
 *
 * Creates array on the server containing all units with missing gear type
 *
 * Arguments:
 * 0: class <string>
 * 1: unit <object>
 *
 * Return Value:
 * nothing
 *
 * Public: No
 */

params ["_class", "_unit"];

if (isNil "UO_FW_missing_gear") then {
	UO_FW_missing_gear = [];
	[{CBA_missionTime > 0}, {publicVariable "UO_FW_missing_gear"}] call CBA_fnc_waitUntilAndExecute;
};

private _index = -1;

{
	if ((_x select 0) == _class) exitWith {_index = _forEachIndex};
} foreach UO_FW_missing_gear;

if (_index != -1) then {
	((UO_FW_missing_gear select _index) select 1) pushBackUnique _unit;
} else {
	UO_FW_missing_gear pushBack [_class, [_unit]];
};

if (CBA_missionTime > 0) then {
	publicVariable "UO_FW_missing_gear";
};