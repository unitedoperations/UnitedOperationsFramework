#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params ["_unit","_type"];
private ["_groupId"];

if (!local _unit) exitWith {};
_unit setVariable ["BIS_enableRandomization", false];
_unit setVariable ["UO_FW_Loadout", _type, true];
_unit call UO_FW_fnc_RemoveAllGear;

//when set to false, facewear types that are whitelisted will not be removed
UO_FW_force_remove_facewear = missionNamespace getVariable ["UO_FW_GearFaceRemovalEnabled",false];

//Other Version
private _path = missionNamespace getVariable  ["UO_FW_Gear_PathToGear","GearScript.sqf"];
if !(_path isEqualto "") then {
	private _string = _this call (compile (preprocessFileLineNumbers _path));
};

UO_FW_GearReady = true;
