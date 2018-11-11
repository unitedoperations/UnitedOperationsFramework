#define random(MIN, MAX) \
([MIN, MAX] call UO_FW_FNC_RandomRange)
_temp = "";
#define SET_GROUP(groupName) _temp = #groupName + package;\
call compile format ['%1 = {
#define END_GROUP };', _temp]
#define ADD_GROUP(groupName) call call compile format ["%1", #groupName + package]
private ["_unit", "_type", "_groupId"];

_unit = _this select 0;
_type = _this select 1;

if (!local _unit) exitWith {};

_unit setVariable ["BIS_enableRandomization", false];
_unit setVariable ["UO_FW_Loadout", _type, true];

FNC_AddItem = {([_unit, _type] + _this) call UO_FW_FNC_AddItemOrg;};
FNC_AddItemRandom = {([[_unit, _type]] + [_this]) call UO_FW_FNC_AddItemRandomOrg;};
_unit call UO_FW_FNC_RemoveAllGear;

switch (_type) do {

	//#include "loadouts\USMCRiflePlatoon.sqf"
	//#include "loadouts\RURiflePlatoon.sqf"
	//#include "loadouts\BAF.sqf"
	//#include "loadouts\1989USARMY.sqf"
	//#include "loadouts\1989VDV.sqf"
	#include "loadouts\2000MSV.sqf"
	#include "loadouts\Borovia.sqf"
};
