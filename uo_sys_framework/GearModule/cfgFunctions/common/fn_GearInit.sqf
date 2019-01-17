#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

if (!hasinterface || {isServer}) then {
	if !(UO_FW_Server_GearModule_Allowed) exitwith {};
	if (!(UO_FW_Gear_ACEAR_System_Enabled) && {!(UO_FW_Gear_Olsen_Enabled)}) exitwith {};

	{
		[{(!isNull _this)}, {
			params ["_unit"];
			private ["_loadoutName"];
			private _GearSystem = _unit getvariable ["UO_FW_Gear_UnitSystemType","NONE"];
			private _UnitClass = _unit getvariable ["UO_FW_Gear_UnitGearType","NONE"];
			_unit setvariable ["UO_FW_Gear_UnitClass",_UnitClass,true];

			if (_GearSystem isEqualto "NONE") exitwith {};

			if (_UnitClass isEqualto "NONE") exitwith {
				ERROR_1("No loadout found for unit: %1",_unit);
			};

			if (_UnitClass isEqualto "MANUAL") then {
				_unit setvariable ["UO_FW_Gear_ManualUnitClass","MANUAL",true];
				switch (_GearSystem) do {
					case "ACEAR": {
						_loadoutName = _unit getvariable ["UO_FW_Gear_UnitGearManualType",""];
						if (_loadoutName isEqualto "") exitwith {
							ERROR_1("Unit %1 is set to manual loadout but has none!, exiting gearscript.",_unit);
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
						};
					};
					case "OLSEN": {
						private _Type = _unit getvariable ["UO_FW_Gear_UnitGearManualType",""];
						if (_Type isEqualto "") exitwith {
							ERROR_1("Unit %1 is set to manual loadout but has none!, exiting gearscript.",_unit);
						};
						LOG_2("Executing gear of file: %1 for unit %2",_Type,_unit);
						[_unit,_Type] call UO_FW_fnc_OlsenGearScript;
					};
				};
			} else {
				private ["_SystemTag","_loadoutvarname"];

				switch (_GearSystem) do {
					case "ACEAR": {_SystemTag = "ACE_Arsenal"};
					case "OLSEN": {_SystemTag = "Olsen"};
				};

				switch (side _unit) do {
					case west: {
						_loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Blufor_%2",_SystemTag,_UnitClass];
					};
					case east: {
						_loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Opfor_%2",_SystemTag,_UnitClass];
					};
					case resistance: {
						_loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Indfor_%2",_SystemTag,_UnitClass];
					};
					case civilian: {
						_loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Civilian_%2",_SystemTag,_UnitClass];
					};
				};

				_loadoutName = missionNamespace getvariable [_loadoutvarname,"NONE"];

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
						};
					};
					case "OLSEN": {
						LOG_2("Executing gear of file: %1 for unit %2",_loadoutName,_unit);
						[_unit,_loadoutName] call UO_FW_fnc_OlsenGearScript;
					};
				};
			};
		},_x] call CBA_fnc_waitUntilandExecute;
	} forEach (allUnits select {local _x && (!isPlayer _x)});
	{
		[{(!isNull _this)}, {
			params ["_vehicle"];
			private ["_loadoutName"];
			private _GearSystem = _vehicle getvariable ["UO_FW_Gear_VehicleSystemType","NONE"];
			private _loadoutName = _vehicle getvariable ["UO_FW_Gear_VehicleGearManualType",""];

			if (_GearSystem isEqualto "NONE") exitwith {};

			switch (_GearSystem) do {
				case "ACEAR": {
					if (_loadoutName isEqualto "") exitwith {
						ERROR_1("Vehicle %1 is set to manual loadout but has none!, exiting gearscript.",_vehicle);
					};
					private _found = false;
					private _defaultloadoutsArray = missionNamespace getvariable ['ace_arsenal_defaultLoadoutsList',[]];
					{
						_x params ["_name","_loadoutData"];
						if (_loadoutName isEqualto _name) exitwith {
							_vehicle setUnitLoadout _loadoutData;
							LOG_2("Setting ace loadout: %1 for vehicle %2",_loadoutName,_vehicle);
							_found = true;
						};
					} foreach _defaultloadoutsArray;
					if !(_found) exitwith {
						ERROR_1("Could not find %1 in Default Loadouts!",_loadoutName);
					};
				};
				case "OLSEN": {
					if (_loadoutName isEqualto "") exitwith {
						ERROR_1("Vehicle %1 is set to manual loadout but has none!, exiting gearscript.",_vehicle);
					};
					LOG_2("Executing gear of file: %1 for vehicle %2",_loadoutName,_vehicle);
					[_vehicle,_loadoutName] call UO_FW_fnc_OlsenGearScript;
				};
			};
		},_x] call CBA_fnc_waitUntilandExecute;
	} forEach (vehicles select {local _x && (!isPlayer _x)});
	missionNamespace setvariable ["UO_FW_Gear_ServerInit",true,true];
};

if (hasinterface) then {
	if !(UO_FW_Server_GearModule_Allowed) exitwith {UO_FW_GearReady = true;};
	if (!(UO_FW_Gear_ACEAR_System_Enabled) && {!(UO_FW_Gear_Olsen_Enabled)}) exitwith {UO_FW_GearReady = true;};
	[{((!isNull player) && {local player} && {missionNamespace getvariable ["UO_FW_Gear_ServerInit",false]})}, {
		private ["_loadoutName"];
		private _GearSystem = player getvariable ["UO_FW_Gear_UnitSystemType","NONE"];
		private _UnitClass = player getvariable ["UO_FW_Gear_UnitGearType","NONE"];
		player setvariable ["UO_FW_Gear_UnitClass",_UnitClass,true];

		if (_GearSystem isEqualto "NONE") exitwith {
			LOG_1("No gear system set for unit: %1",player);
			UO_FW_GearReady = true;
		};

		if (_UnitClass isEqualto "NONE") exitwith {
			ERROR_1("No loadout found for unit: %1",player);
			UO_FW_GearReady = true;
		};

		if (_UnitClass isEqualto "MANUAL") then {
			player setvariable ["UO_FW_Gear_ManualUnitClass","MANUAL",true];
			switch (_GearSystem) do {
				case "ACEAR": {
					_loadoutName = player getvariable ["UO_FW_Gear_UnitGearManualType",""];
					if (_loadoutName isEqualto "") exitwith {
						ERROR_1("Unit %1 is set to manual loadout but has none!, exiting gearscript.",player);
						UO_FW_GearReady = true;
					};
					private _found = false;
					private _defaultloadoutsArray = missionNamespace getvariable ['ace_arsenal_defaultLoadoutsList',[]];
					if (_defaultloadoutsArray isEqualto []) exitwith {
						LOG("ACE Arsenal DefaultLoadouts Empty!");
						UO_FW_GearReady = true;
					};
					{
						_x params ["_name","_loadoutData"];
						if (_loadoutName isEqualto _name) exitwith {
							player setUnitLoadout _loadoutData;
							LOG_2("Setting ace loadout: %1 for unit %2",_loadoutName,player);
							UO_FW_GearReady = true;
							_found = true;
						};
					} foreach _defaultloadoutsArray;
					if !(_found) exitwith {
						ERROR_1("Could not find %1 in Default Loadouts!",_loadoutName);
						UO_FW_GearReady = true;
					};
				};
				case "OLSEN": {
					private _Type = player getvariable ["UO_FW_Gear_UnitGearManualType",""];
					if (_Type isEqualto "") exitwith {
						ERROR_1("Unit %1 is set to manual loadout but has none!, exiting gearscript.",player);
						UO_FW_GearReady = true;
					};
					LOG_2("Executing gear of file: %1 for unit %2",_Type,player);
					[player,_Type] call UO_FW_fnc_OlsenGearScript;
				};
			};
		} else {
			private ["_SystemTag","_loadoutvarname"];

			switch (_GearSystem) do {
				case "ACEAR": {_SystemTag = "ACE_Arsenal"};
				case "OLSEN": {_SystemTag = "Olsen"};
			};

			switch (side player) do {
				case west: {
					_loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Blufor_%2",_SystemTag,_UnitClass];
				};
				case east: {
					_loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Opfor_%2",_SystemTag,_UnitClass];
				};
				case resistance: {
					_loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Indfor_%2",_SystemTag,_UnitClass];
				};
				case civilian: {
					_loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Civilian_%2",_SystemTag,_UnitClass];
				};
			};

			_loadoutName = missionNamespace getvariable [_loadoutvarname,"NONE"];

			if (_loadoutName isEqualto "NONE") exitwith {
				ERROR_2("No loadout found for unit: %1 and var %2",player,_loadoutvarname);
				UO_FW_GearReady = true;
			};

			switch (_GearSystem) do {
				case "ACEAR": {
					private _found = false;
					private _defaultloadoutsArray = missionNamespace getvariable ['ace_arsenal_defaultLoadoutsList',[]];
					if (_defaultloadoutsArray isEqualto []) exitwith {
						LOG("ACE Arsenal DefaultLoadouts Empty!");
						UO_FW_GearReady = true;
					};
					{
						_x params ["_name","_loadoutData"];
						if (_loadoutName isEqualto _name) exitwith {
							player setUnitLoadout _loadoutData;
							LOG_2("Setting ace loadout: %1 for unit %2",_loadoutName,player);
							UO_FW_GearReady = true;
							_found = true;
						};
					} foreach _defaultloadoutsArray;
					if !(_found) exitwith {
						ERROR_1("Could not find %1 in Default Loadouts!",_loadoutName);
						UO_FW_GearReady = true;
					};
				};
				case "OLSEN": {
					LOG_2("Executing gear of file: %1 for unit %2",_loadoutName,player);
					[player,_loadoutName] call UO_FW_fnc_OlsenGearScript;
				};
			};
		};
	}] call CBA_fnc_waitUntilandExecute;
};
