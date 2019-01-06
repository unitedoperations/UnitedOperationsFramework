#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

if !(UO_FW_SERVER_GEARMODULE_ALLOWED) exitwith {UO_FW_GearReady = true;};
if (!(UO_FW_Gear_ACEAR_System_Enabled) && {!(UO_FW_Gear_Olsen_Enabled)}) exitwith {UO_FW_GearReady = true;};

//Are these being used elsewhere?
if (UO_FW_Gear_Olsen_Enabled) then {
	UO_FW_force_remove_facewear = missionNamespace getVariable ["UO_FW_GearFaceRemovalEnabled",false];
	UO_FW_enableOverfill = missionNamespace getVariable ["UO_FW_GearOverfillEnabled",false];
};

if (hasinterface) then {
	[{(!isNull player)}, {
		private _GearSystem = player getvariable ["UO_FW_Gear_UnitSystemType","NONE"];
		diag_log format ["player UO_FW_Gear_UnitSystemType:%1",_GearSystem];
		if (_GearSystem isEqualto "NONE") exitwith {
			UO_FW_DEBUG_1("No gear system defined for %1, exiting gearscript.",player);
			UO_FW_GearReady = true;
		};
		if (_GearSystem isEqualto "ACEAR") then {
			if !(UO_FW_Gear_ACEAR_System_Enabled) exitwith {UO_FW_GearReady = true;};
			UO_FW_GearReady = false;
			private _type = player getVariable ["UO_FW_Gear_ACEAR_UnitGearType","NONE"];
			if (_type isEqualto "NONE") exitwith {
				UO_FW_DEBUG_1("Player unit %1 has no gear type defined, exiting gearscript.",player);
				UO_FW_GearReady = true;
			};
			if (_type isEqualto "CUS") then {
				private _customLoadout = MissionNamespace getvariable ['UO_FW_Gear_ACEAR_UnitGearCustomType',""];
				if (_customLoadout isEqualto "") exitwith {
					UO_FW_DEBUG_1("Player unit %1 is set to custom loadout but has none!, exiting gearscript.",player);
					UO_FW_GearReady = true;
				};
				_type = _customLoadout;
			};
			private _defaultloadoutsArray = MissionNamespace getvariable ['ace_arsenal_defaultLoadoutsList',[]];
			if (_defaultloadoutsArray isEqualto []) exitwith {
				UO_FW_DEBUG("","Default Loadout Array is empty, could not load gear!");
				UO_FW_GearReady = true;
			};
			UO_FW_DEBUG_1("Searching defaultloadout array for %1 type.",_type);
			private _found = false;
			{
				_x params ["_name","_loadoutData"];
				if (_type isEqualto _name) exitwith {
					player setUnitLoadout _loadoutData;
					_found = true;
					UO_FW_GearReady = true;
				};
			} foreach _defaultloadoutsArray;
			if !(_found) exitwith {
				UO_FW_DEBUG_1("Could not find %1 in Default Loadouts!",_type);
				UO_FW_GearReady = true;
			};
		};
		if (_GearSystem isEqualto "OLSEN") then {
			if !(UO_FW_Gear_Olsen_Enabled) exitwith {UO_FW_GearReady = true;};
			UO_FW_GearReady = false;
			private _type = player getVariable ["UO_FW_Gear_Olsen_UnitGearType",""];
			if !(_type isEqualto "") then {
				private _array = [player,_type];
				UO_FW_DEBUG_2("Executing gear of file: %1 for unit %2",_type,player);
				_array call UO_FW_FNC_OlsenGearScript;
			} else {
				UO_FW_DEBUG_1("Player unit %1 has no gear type defined, exiting gearscript.",player);
				UO_FW_GearReady = true;
			};
		};
	}] call CBA_fnc_waitUntilandExecute;
};
//if (!hasinterface || {isServer}) then {
//	{
//		[{(!isNull _this)}, {
//			if (UO_FW_Gear_ACEAR_System_Enabled) then {
//
//			};
//			if (UO_FW_Gear_Olsen_Enabled) then {
//				if(!(isPlayer _x)) then {
//					private _type = _x getVariable ["UO_FW_Gear_Olsen_UnitGearType",""];
//					if !(_type isEqualto "") then	{
//						private _array = [_x,_type];
//						_array call UO_FW_FNC_OlsenGearScript;
//					};
//				};
//			};
//		},_x] call CBA_fnc_waitUntilandExecute;
//	} forEach (allUnits select {local _x});
//	{
//		[{(!isNull _this)}, {
//		if (UO_FW_Gear_ACEAR_System_Enabled) then {
//
//		};
//		if (UO_FW_Gear_Olsen_Enabled) then {
//			private _type = _x getVariable ["UO_FW_Gear_Olsen_UnitGearType",""];
//			if !(_type isEqualto "") then {
//				private _array = [_x,_type];
//				_array call UO_FW_FNC_OlsenGearScript;
//			};
//		};
//		},_x] call CBA_fnc_waitUntilandExecute;
//	} forEach (vehicles select {local _x});
//};
