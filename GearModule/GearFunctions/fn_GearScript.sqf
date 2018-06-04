
#define random(MIN, MAX) \
([MIN, MAX] callUO_FNC_RandomRange)

_temp = "";

#define SET_GROUP(groupName) _temp = #groupName + package;\
call compile format ['%1 = {

#define END_GROUP };', _temp]

#define ADD_GROUP(groupName) call call compile format ["%1", #groupName + package]

private ["_unit", "_type", "_groupId"];

_unit = _this select 0;
_type = _this select 1;

if (count _this > 2) then {

	_groupId = _this select 2;

	(group _unit) setGroupId [_groupId];

};

if (!local _unit) exitWith {};

_unit setVariable ["BIS_enableRandomization", false];
_unit setVariable ["FW_Loadout", _type, true];

FNC_AddItem = {([_unit, _type] + _this) callUO_FNC_AddItemOrg;};
FNC_AddItemRandom = {([[_unit, _type]] + [_this]) callUO_FNC_AddItemRandomOrg;};


//when set to false, facewear types that are whitelisted will not be removed
FW_force_remove_facewear = false;

//forces adding an item to inventory. Works only if container is specified!
FW_enableOverfill = false;

_unit callUO_FNC_RemoveAllGear;

waitUntil{BIS_fnc_init == true};

{
    "" call _x;
}forEach FW_GearList;
