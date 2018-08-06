#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT)
private ["_unit", "_type", "_groupId"];
if(!(missionNamespace getVariable ["UO_FW_Gear_Enabled",false])) exitWith {};
waitUntil{!(isNil "UO_FW_GearLoadouts")};
_unit = _this select 0;
_type = _this select 1;

if (count _this > 2) then {
	
	_groupId = _this select 2;
	
	(group _unit) setGroupId [_groupId];
	
};

{
	_string = preprocessFileLineNumbers _x;
	_call = "
			#define random(MIN, MAX) \
		([MIN, MAX] call UO_FW_FNC_RandomRange)

		_temp = "";

		#define SET_GROUP(groupName) _temp = #groupName + package;\
		call compile format ['%1 = {

		#define END_GROUP };', _temp]

		#define ADD_GROUP(groupName) call call compile format [""%1"", #groupName + package]

		_unit = _this select 0;
		_type = _this select 1;

		if (count _this > 2) then {
			
			_groupId = _this select 2;
			
			(group _unit) setGroupId [_groupId];
			
		};

		if (!local _unit) exitWith {};

		_unit setVariable [""BIS_enableRandomization"", false];
		_unit setVariable [""UO_FW_Loadout"", _type, true];

		FNC_AddItem = {([_unit, _type] + _this) call UO_FW_FNC_AddItemOrg;};
		FNC_AddItemRandom = {([[_unit, _type]] + [_this]) call UO_FW_FNC_AddItemRandomOrg;};

		_unit call FNC_RemoveAllGear;" + _string;
	_func = compile _call;
	[_unit,_type] call _func;
	 
}forEach UO_FW_GearLoadouts;
