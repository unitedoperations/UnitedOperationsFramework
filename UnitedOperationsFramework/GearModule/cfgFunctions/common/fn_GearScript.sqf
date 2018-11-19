#include "\x\UO_FW\addons\main\script_macros.hpp"
if(!hasinterface) exitWith {};
private ["_unit", "_type", "_groupId"];
if(!(missionNamespace getVariable ["UO_FW_Gear_Enabled",false])) exitWith {};
//waitUntil{!(isNil "UO_FW_GearLoadouts")};

_unit = _this select 0;
_type = _this select 1;
if(!local _unit) exitWith {};
if (count _this > 2) then {
	
	_groupId = _this select 2;
	
	(group _unit) setGroupId [_groupId];
	
};
_unit setVariable ["BIS_enableRandomization", false];
_unit setVariable ["UO_FW_Loadout", _type, true];
_unit call UO_FW_FNC_RemoveAllGear;

/*{
	_string = _this call (compile (preprocessFileLineNumbers _x));

	 
}forEach UO_FW_GearLoadouts;*/

//Other Version
_path = missionNamespace getVariable  ["UO_FW_Gear_PathToGear","GearScript.sqf"];
if(_path != "") then 
{
	_string = _this call (compile (preprocessFileLineNumbers _path));
};


UO_FW_GearReady = true;






