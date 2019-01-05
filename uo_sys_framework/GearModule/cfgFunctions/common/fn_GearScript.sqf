#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

private ["_groupId"];
if(!(missionNamespace getVariable ["UO_FW_Gear_Enabled",false])) exitWith {};
//waitUntil{!(isNil "UO_FW_GearLoadouts")};

params ["_unit","_type"];
if (!local _unit) exitWith {};
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
if !(_path isEqualto "") then {
	_string = _this call (compile (preprocessFileLineNumbers _path));
};

UO_FW_GearReady = true;
