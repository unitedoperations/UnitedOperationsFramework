#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

diag_log format ["loadfromattributeargs: %1", _this];
params ["_loadoutAttributeClass","_unit"];
//params ["_loadoutAttributeNumber","_unit"];
private ["_loadoutvarname"];
private _loadoutName = "NONE";

//private _classArray = [["None","NONE"],["Rifleman","RFL"],["Rifleman AT","RFLAT"],["Automatic Rifleman","AR"],["Grenadier","GRN"],["Team Leader","TL"],["Squad Leader","SQL"],["Anti Tank","AT"],["Assistant Anti Tank","AAT"],["Machinegunner","MGA"],["Assistant Machinegunner","AMG"],["Vehicle Crewman","VCRW"],["Vehicle Commander","VCMD"]];
//private _loadoutAttributeClass = ((_classArray select _loadoutAttributeNumber) select 1);

_unit setvariable ["UO_FW_UnitClass",_loadoutAttributeClass,true];

if (_loadoutAttributeClass isEqualto "NONE") exitwith {
	UO_FW_DEBUG("","No loadout found for unit: %1",_unit);
};

switch (side player) do {
	case west: {
		_loadoutvarname = format ["UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Blufor_%1",_loadoutAttributeClass];
	};
	case east: {
		_loadoutvarname = format ["UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Opfor_%1",_loadoutAttributeClass];
	};
	case resistance: {
		_loadoutvarname = format ["UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Indfor_%1",_loadoutAttributeClass];
	};
	case civilian: {
		_loadoutvarname = format ["UO_FW_GearSettings_ACE_Arsenal_LoadoutType_Civilian_%1",_loadoutAttributeClass];
	};
};
diag_log format ["_loadoutvarname: %1", _loadoutvarname];
_loadoutName = MissionNamespace getvariable [_loadoutvarname,"NONE"];
diag_log format ["_loadoutName: %1", _loadoutName];

private _defaultloadoutsArray = MissionNamespace getvariable ['ace_arsenal_defaultLoadoutsList',[]];
{
	_x params ["_name","_loadoutData"];
	if (_loadoutName isEqualto _name) exitwith {
		_unit setUnitLoadout _loadoutData;
	};
} foreach _defaultloadoutsArray;
