#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);

#define random(MIN, MAX) \
([MIN, MAX] call FNC_RandomRange)

private _temp = "";

#define SET_GROUP(groupName) _temp = #groupName + package;\
call compile format ['%1 = {

#define END_GROUP };', _temp]

#define ADD_GROUP(groupName) call call compile format ["%1", #groupName + package]

params ["_unit","_type"];

if (!local _unit) exitWith {};
_unit setVariable ["BIS_enableRandomization", false];
SETPVAR(_unit,Loadout,_type);
_unit call FUNC(RemoveAllGear);

FNC_AddItem = {
    private _args = [_unit, _type];
    TRACE_4("addItem Parameters:",_unit,_type,_args,_this);
    _args append _this;
    TRACE_1("addItem parameters after append:",_args);
    _args call FUNC(AddItemOrg);
};

FNC_AddItemRandom = {
    private _args = [_unit, _type];
    TRACE_4("addItem Parameters:",_unit,_type,_args,_this);
    _args append _this;
    TRACE_1("addItem parameters after append:",_args);
    _args call FUNC(AddItemRandomOrg);
};

//Other Version
//private _path = missionNamespace getVariable [QGVAR(Olsen_PathToGear),"GearScript.sqf"];
private _path = GETMVALUE(Olsen_PathToGear,"Gear.sqf");
if !(_path isEqualto "") then {
    [_unit, _type] call (compile (preprocessFileLineNumbers _path));
};
