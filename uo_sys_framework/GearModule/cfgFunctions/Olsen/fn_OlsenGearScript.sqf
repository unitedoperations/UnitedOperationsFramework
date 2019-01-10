#define COMPONENT Gear
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params ["_unit","_type"];

if (!local _unit) exitWith {};
_unit setVariable ["BIS_enableRandomization", false];
_unit setVariable ["UO_FW_Loadout", _type, true];
_unit call UO_FW_fnc_RemoveAllGear;

FNC_AddItem = {([_unit, _type] append [_this]) call UO_FW_FNC_AddItemOrg;};
FNC_AddItemRandom = {([_unit, _type] append [_this]) call UO_FW_FNC_AddItemRandomOrg;};

//Other Version
private _path = missionNamespace getVariable  ["UO_FW_Gear_PathToGear","GearScript.sqf"];
if !(_path isEqualto "") then {
	private _scriptname = [_unit, _type] call (compile (preprocessFileLineNumbers _path));
};

UO_FW_GearReady = true;
