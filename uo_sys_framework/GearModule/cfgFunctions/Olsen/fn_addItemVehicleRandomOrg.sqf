/*
 * Author: Olsen
 *
 * Add random item to vehicle.
 *
 * Arguments:
 * 0: vehicle <object> and loadout name <string> <array>
 * 1: items <array>
 *
 * Return Value:
 * nothing
 *
 * Public: No
 */

#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

private ["_vehicle", "_loadoutType", "_items", "_amount", "_position", "_randomPick"];

_vehicle = (_this select 0) select 0;
_loadoutType = (_this select 0) select 1;

_items = _this select 1;

_amount = 1;
_position = "NONE";

if (count _items > 1) then {

	if (typeName (_items select 1) == "ARRAY") then {

		_position = "ARRAY";

	} else {

		if (typeName (_items select 1) == "SCALAR") then {

			_amount = _items select 1;

			_items = _items select 0;

		};
	};
};

_randomPick = (_items select (([1, count _items] call UO_FW_fnc_RandomRange) - 1));

if (_position == "ARRAY") then {

	if (typeName (_randomPick select 0) == "ARRAY") then {

		{

			([_vehicle, _loadoutType] + _x) call UO_FW_fnc_AddItemVehicleOrg;

		} forEach _randomPick;

	} else {

		([_vehicle, _loadoutType] + _randomPick) call UO_FW_fnc_AddItemVehicleOrg;

	};

} else {

	[_vehicle, _loadoutType, _randomPick, _amount] call UO_FW_fnc_AddItemVehicleOrg;

};
