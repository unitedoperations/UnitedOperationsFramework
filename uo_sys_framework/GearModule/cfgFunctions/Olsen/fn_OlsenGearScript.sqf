#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

#define random(MIN, MAX) \
([MIN, MAX] call FNC_RandomRange)

private _temp = "";

#define SET_GROUP(groupName) _temp = #groupName + package;\
call compile format ['%1 = {

#define END_GROUP };', _temp]

#define ADD_GROUP(groupName) call call compile format ["%1", #groupName + package]

params ["_unit","_Type"];

if (!local _unit) exitWith {};
_unit setVariable ["BIS_enableRandomization", false];
SETPVAR(_unit,Loadout,_Type);
_unit call FUNC(RemoveAllGear);

FNC_AddItem = {([_unit, _Type] append [_this]) call FUNC(AddItemOrg);};
FNC_AddItemRandom = {([_unit, _Type] append [_this]) call FUNC(AddItemRandomOrg);};

//Other Version
//private _path = missionNamespace getVariable ["UO_FW_Gear_PathToGear","GearScript.sqf"];
private _path = GETMVALUE(PathToGear,"GearScript.sqf");
if !(_path isEqualto "") then {
    [_unit, _Type] call (compile (preprocessFileLineNumbers _path));
};
