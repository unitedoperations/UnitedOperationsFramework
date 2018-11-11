#define random(MIN, MAX) \
([MIN, MAX] call FNC_RandomRange)

_temp = "";

#define SET_GROUP(groupName) _temp = #groupName + package;\
call compile format ['%1 = {

#define END_GROUP };', _temp]

#define ADD_GROUP(groupName) call call compile format ["%1", #groupName + package]

#define BEGIN_GEAR switch(_type) do {
#define END_GEAR };
_unit = _this select 0;
_type = _this select 1;

if (!local _unit) exitWith {};

FNC_AddItem = {([_unit, _type] + _this) call UO_FW_FNC_AddItemOrg;};
FNC_AddItemRandom = {([[_unit, _type]] + [_this]) call UO_FW_FNC_AddItemRandomOrg;};
FNC_GearScript = {_this call UO_FW_GearScript;};
