#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params ["_unit","_Type"];

if (((CBA_MissionTime > 0) || !isPlayer _unit) && {!local _unit}) exitWith {};
_unit setVariable ["BIS_enableRandomization", false];
_unit setVariable ["UO_FW_Loadout", _Type, true];
_unit call UO_FW_fnc_RemoveAllGear;

FNC_AddItem = {([_unit, _Type] append [_this]) call UO_FW_fnc_AddItemOrg;};
FNC_AddItemRandom = {([_unit, _Type] append [_this]) call UO_FW_fnc_AddItemRandomOrg;};

//Other Version
//private _path = missionNamespace getVariable ["UO_FW_Gear_PathToGear","GearScript.sqf"];
private _path = GETMVALUE(Gear_PathToGear,"GearScript.sqf");
if !(_path isEqualto "") then {
    [_unit, _Type] call (compile (preprocessFileLineNumbers _path));
};

SETPVAR(_unit,GearReady,true);
