#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params ["_unit","_type"];
private ["_groupId"];

if (!local _unit) exitWith {};
_unit setVariable ["BIS_enableRandomization", false];
_unit setVariable ["UO_FW_Loadout", _type, true];
_unit call UO_FW_fnc_RemoveAllGear;

//Other Version
private _path = missionNamespace getVariable  ["UO_FW_Gear_PathToGear","GearScript.sqf"];
if !(_path isEqualto "") then {
	private _string = _this call (compile (preprocessFileLineNumbers _path));
};

UO_FW_GearReady = true;
