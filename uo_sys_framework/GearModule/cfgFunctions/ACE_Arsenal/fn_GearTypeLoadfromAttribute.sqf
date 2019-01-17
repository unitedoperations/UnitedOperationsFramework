#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params ["_loadoutAttributeClass","_unit","_GearSystem"];
private ["_loadoutvarname","_SystemTag","_Type"];
private _loadoutName = "NONE";

//private _classArray = [['None','NONE'],['Rifleman','RFL'],['Rifleman AT','RFLAT'],['Automatic Rifleman','AR'],['Grenadier','GRN'],['Team Leader','TL'],['Squad Leader','SQL'],['Anti Tank','AT'],['Assistant Anti Tank','AAT'],['Machinegunner','MGA'],['Assistant Machinegunner','AMG'],['Vehicle Crewman','VCRW'],['Vehicle Commander','VCMD'],['Officer','OFF'],['RATELO','RTO'],['FAC','FAC'],['Custom 1','CUS1'],['Custom 2','CUS2'],['Custom 3','CUS3'],['Custom 4','CUS4'],['Custom 5','CUS5'],['Manual Define','MANUAL']];
//private _loadoutAttributeClass = ((_classArray select _loadoutAttributeNumber) select 1);

_unit setvariable ["UO_FW_Gear_UnitClass",_loadoutAttributeClass,true];

if (_loadoutAttributeClass isEqualto "NONE") exitwith {
	ERROR_1("No loadout found for unit: %1",_unit);
};

if (_loadoutAttributeClass isEqualto "MANUAL") then {
	_unit setvariable ["UO_FW_Gear_ManualUnitClass","MANUAL",true];
	switch (_GearSystem) do {
		case "ACEAR": {
			_loadoutName = _unit getvariable ["UO_FW_Gear_UnitGearManualType",""];
			if (_loadoutName isEqualto "") exitwith {
				ERROR_1("Unit %1 is set to manual loadout but has none!, exiting gearscript.",_unit);
				UO_FW_GearReady = true;
			};
			private _found = false;
			private _defaultloadoutsArray = missionNamespace getvariable ['ace_arsenal_defaultLoadoutsList',[]];
			{
				_x params ["_name","_loadoutData"];
				if (_loadoutName isEqualto _name) exitwith {
					_unit setUnitLoadout _loadoutData;
					LOG_2("Setting ace loadout: %1 for unit %2",_loadoutName,_unit);
					_found = true;
				};
			} foreach _defaultloadoutsArray;
			if !(_found) exitwith {
				ERROR_1("Could not find %1 in Default Loadouts!",_loadoutName);
				UO_FW_GearReady = true;
			};
		};
		case "OLSEN": {
			_Type = _unit getvariable ["UO_FW_Gear_UnitGearManualType",""];
			if (_Type isEqualto "") exitwith {
				ERROR_1("Unit %1 is set to manual loadout but has none!, exiting gearscript.",_unit);
				UO_FW_GearReady = true;
			};
			LOG_2("Executing gear of file: %1 for unit %2",_Type,_unit);
			[_unit,_Type] call UO_FW_fnc_OlsenGearScript;
		};
	};
} else {
	switch (_GearSystem) do {
		case "ACEAR": {_SystemTag = "ACE_Arsenal"};
		case "OLSEN": {_SystemTag = "Olsen"};
	};

	switch (side player) do {
		case west: {
			_loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Blufor_%2",_SystemTag,_loadoutAttributeClass];
		};
		case east: {
			_loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Opfor_%2",_SystemTag,_loadoutAttributeClass];
		};
		case resistance: {
			_loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Indfor_%2",_SystemTag,_loadoutAttributeClass];
		};
		case civilian: {
			_loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Civilian_%2",_SystemTag,_loadoutAttributeClass];
		};
	};

	LOG_2("_loadoutvarname: %1 for unit %2",_loadoutvarname,_unit);
	_loadoutName = missionNamespace getvariable [_loadoutvarname,"NONE"];
	LOG_2("_loadoutName: %1 for unit %2",_loadoutvarname,_unit);

	if (_loadoutName isEqualto "NONE") exitwith {
		ERROR_2("No loadout found for unit: %1 and var %2",_unit,_loadoutvarname);
	};

	switch (_GearSystem) do {
		case "ACEAR": {
			private _found = false;
			private _defaultloadoutsArray = missionNamespace getvariable ['ace_arsenal_defaultLoadoutsList',[]];
			{
				_x params ["_name","_loadoutData"];
				if (_loadoutName isEqualto _name) exitwith {
					_unit setUnitLoadout _loadoutData;
					LOG_2("Setting ace loadout: %1 for unit %2",_loadoutName,_unit);
					_found = true;
				};
			} foreach _defaultloadoutsArray;
			if !(_found) exitwith {
				ERROR_1("Could not find %1 in Default Loadouts!",_loadoutName);
				UO_FW_GearReady = true;
			};
		};
		case "OLSEN": {
			LOG_2("Executing gear type: %1 for unit %2",_loadoutName,_unit);
			[_unit,_loadoutName] call UO_FW_fnc_OlsenGearScript;
		};
	};
};
