/*
 * Author: Killzone_Kid
 *
 * KK_fnc_commonTurrets
 * Gets array of available turret configurations. (Gunner Positions)
 *
 * Arguments:
 * Object (Vehicle to get Turret Configuration of)
 *
 * Return Value:
 * Array (Turrent Options)
 *
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
	private ["_arr","_trts"];
		_arr = [];
		_trts = configFile / "CfgVehicles" / typeOf _this / "Turrets";
		for "_i" from 0 to count _trts - 1 do {
			_arr set [count _arr, [_i]];
			for "_j" from 0 to count (
				_trts / configName (_trts select _i) / "Turrets"
			) - 1 do {
				_arr set [count _arr, [_i, _j]];
			};
		};
		_arr
