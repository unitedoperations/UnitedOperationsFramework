/*    Description: Returns an array of details for an occupied vehicle.
 *    Arguments:
 *         OBJECT    - Object Name
 *    Return Value:
 *         ARRAY
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_unit","_pos","_vehicle"];
private _unitInit = (GETVAR(_unit,AI_unitInit,"true"));
if (typename _unitInit isEqualTo "STRING") then {_unitInit = compile _unitInit;};
private _vehAssigned = if ((assignedVehicleRole _unit) isEqualTo []) then {false} else {true};
private _unitGearType = "EDITOR";
private _unitGearSystemType = GETVAR(_unit,AI_Gear_UnitSystemType,"NONE");
switch (_unitGearSystemType) do {
    case "ACEAR": {
        private _UnitClass = (GETVAR(_unit,Gear_UnitGearType,"NONE"));
        if (_UnitClass isEqualto "MANUAL") then {
            private _loadoutName = (GETVAR(_unit,Gear_UnitGearManualType,""));
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
        } else {
            private ["_loadoutvarname"];
            switch (side _unit) do {
                case west: {
                    _loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Blufor_%2","ACE_Arsenal",_UnitClass];
                };
                case east: {
                    _loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Opfor_%2","ACE_Arsenal",_UnitClass];
                };
                case independent: {
                    _loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Indfor_%2","ACE_Arsenal",_UnitClass];
                };
                case civilian: {
                    _loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_CIV_%2","ACE_Arsenal",_UnitClass];
                };
            };
            private _loadoutName = missionNamespace getvariable [_loadoutvarname,"NONE"];
            if (_loadoutName isEqualto "NONE") exitwith {
                ERROR_2("No loadout found for unit: %1 and var %2",_unit,_loadoutvarname);
            };
            _unitGearType = _loadoutName;
        };
    };
    case "OLSEN": {
        private _UnitClass = (GETVAR(_unit,Gear_UnitGearType,"NONE"));
        if (_UnitClass isEqualto "MANUAL") then {
            private _Type = (GETVAR(_unit,Gear_UnitGearManualType,""));
            if (_Type isEqualto "") exitwith {
                ERROR_1("Unit %1 is set to manual loadout but has none!, exiting gearscript.",_unit);
            };
            LOG_2("Executing gear class: %1 for unit %2",_Type,_unit);
            [_unit,_Type] call UO_FW_fnc_OlsenGearScript;
        } else {
            private ["_loadoutvarname"];
            switch (side _unit) do {
                case west: {
                    _loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Blufor_%2","Olsen",_UnitClass];
                };
                case east: {
                    _loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Opfor_%2","Olsen",_UnitClass];
                };
                case independent: {
                    _loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Indfor_%2","Olsen",_UnitClass];
                };
                case civilian: {
                    _loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_CIV_%2","Olsen",_UnitClass];
                };
            };
            private _loadoutName = missionNamespace getvariable [_loadoutvarname,"NONE"];
            if (_loadoutName isEqualto "NONE") exitwith {
                ERROR_2("No loadout found for unit: %1 and var %2",_unit,_loadoutvarname);
            };
            _unitGearType = _loadoutName;
        };
    };
    case "NONE": {_unitGearType = "EDITOR";};
    default {_unitGearType = "EDITOR";};
};
[false,
typeOf _unit,
_pos,
vectorDir _unit,
vectorUp _unit,
damage _unit,
getUnitLoadout _unit,
typeOf _vehicle,
assignedVehicleRole _unit,
_vehAssigned,
_unit getVariable ["ACE_captives_isHandcuffed",false],
(surfaceIsWater (getposATL _unit)),
(GETVAR(_unit,AI_unitPersistent,true)),
(GETVAR(_unit,AI_stance,"AUTO")),
_unitGearSystemType,
_unitGearType,
_unitInit,
(GETVAR(_unit,AI_unitName,"")),
(GETVAR(_unit,AI_unitIdentity,""))]
