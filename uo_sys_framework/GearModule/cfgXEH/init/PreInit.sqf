#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

["UO_FW_Gear_LocalObjectsGearLoad", {
    if !(UO_FW_Server_GearModule_Allowed) exitwith {};
    if (!(UO_FW_Gear_ACEAR_System_Enabled) && {!(UO_FW_Gear_Olsen_Enabled)}) exitwith {};
    {
        [{(!isNull _this)}, {
            params ["_unit"];
            private ["_loadoutName"];
            private _GearSystem = (GETVAR(_unit,Gear_UnitSystemType,"NONE"));
            private _UnitClass = (GETVAR(_unit,Gear_UnitGearType,"NONE"));
            (SETVAR(_unit,Gear_UnitClass,_UnitClass));
            if (_GearSystem isEqualto "NONE") exitwith {};
            if (_UnitClass isEqualto "NONE") exitwith {
                ERROR_1("No loadout found for unit: %1",_unit);
            };
            if (_UnitClass isEqualto "MANUAL") then {
                _unit setvariable ["UO_FW_Gear_ManualUnitClass","MANUAL"];
                switch (_GearSystem) do {
                    case "ACEAR": {
                        _loadoutName = (GETVAR(_unit,Gear_UnitGearManualType,""));
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
                        private _Type = (GETVAR(_unit,Gear_UnitGearManualType,""));
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
                    case independent: {
                        _loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Indfor_%2",_SystemTag,_UnitClass];
                    };
                    case civilian: {
                        _loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_CIV_%2",_SystemTag,_UnitClass];
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
}] call CBA_fnc_addEventHandler;

["UO_FW_Gear_UnitLoad", {
    params ["_unit"];
    if !(UO_FW_Server_GearModule_Allowed) exitwith {
        SETPVAR(_unit,GearReady,true);
    };
    if (!(UO_FW_Gear_ACEAR_System_Enabled) && {!(UO_FW_Gear_Olsen_Enabled)}) exitwith {
        SETPVAR(_unit,GearReady,true);
    };
    [{(!isNull _this)}, {
        params ["_unit"];
        private ["_loadoutName"];
        private _GearSystem = (GETVAR(_unit,Gear_UnitSystemType,"NONE"));
        private _UnitClass = (GETVAR(_unit,Gear_UnitGearType,"NONE"));
        (SETVAR(_unit,Gear_UnitClass,_UnitClass));
        if (_GearSystem isEqualto "NONE") exitwith {};
        if (_UnitClass isEqualto "NONE") exitwith {
            ERROR_1("No loadout found for unit: %1",_unit);
            SETPVAR(_unit,GearReady,true);
        };
        if (_UnitClass isEqualto "MANUAL") then {
            _unit setvariable ["UO_FW_Gear_ManualUnitClass","MANUAL"];
            switch (_GearSystem) do {
                case "ACEAR": {
                    _loadoutName = (GETVAR(_unit,Gear_UnitGearManualType,""));
                    if (_loadoutName isEqualto "") exitwith {
                        ERROR_1("Unit %1 is set to manual loadout but has none!, exiting gearscript.",_unit);
                        SETPVAR(_unit,GearReady,true);
                    };
                    private _found = false;
                    private _defaultloadoutsArray = missionNamespace getvariable ['ace_arsenal_defaultLoadoutsList',[]];
                    {
                        _x params ["_name","_loadoutData"];
                        if (_loadoutName isEqualto _name) exitwith {
                            _unit setUnitLoadout _loadoutData;
                            LOG_2("Setting ace loadout: %1 for unit %2",_loadoutName,_unit);
                            SETPVAR(_unit,GearReady,true);
                            _found = true;
                        };
                    } foreach _defaultloadoutsArray;
                    if !(_found) exitwith {
                        ERROR_1("Could not find %1 in Default Loadouts!",_loadoutName);
                        SETPVAR(_unit,GearReady,true);
                    };
                };
                case "OLSEN": {
                    private _Type = (GETVAR(_unit,Gear_UnitGearManualType,""));
                    if (_Type isEqualto "") exitwith {
                        ERROR_1("Unit %1 is set to manual loadout but has none!, exiting gearscript.",_unit);
                        SETPVAR(_unit,GearReady,true);
                    };
                    LOG_2("Executing gear class: %1 for unit %2",_Type,_unit);
                    [_unit,_Type] call UO_FW_fnc_OlsenGearScript;
                    SETPVAR(_unit,GearReady,true);
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
                case independent: {
                    _loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Indfor_%2",_SystemTag,_UnitClass];
                };
                case civilian: {
                    _loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_CIV_%2",_SystemTag,_UnitClass];
                };
            };
            _loadoutName = missionNamespace getvariable [_loadoutvarname,"NONE"];
            if (_loadoutName isEqualto "NONE") exitwith {
                ERROR_2("No loadout found for unit: %1 and var %2",_unit,_loadoutvarname);
                SETPVAR(_unit,GearReady,true);
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
                            SETPVAR(_unit,GearReady,true);
                            _found = true;
                        };
                    } foreach _defaultloadoutsArray;
                    if !(_found) exitwith {
                        ERROR_1("Could not find %1 in Default Loadouts!",_loadoutName);
                        SETPVAR(_unit,GearReady,true);
                    };
                };
                case "OLSEN": {
                    LOG_2("Executing gear class: %1 for unit %2",_loadoutName,_unit);
                    [_unit,_loadoutName] call UO_FW_fnc_OlsenGearScript;
                    SETPVAR(_unit,GearReady,true);
                };
            };
        };
    },_unit] call CBA_fnc_waitUntilandExecute;
}] call CBA_fnc_addEventHandler;

["UO_FW_Gear_ForceUnitLoad", {
    params ["_unit",["_gearSystem","ACEAR",[""]],["_forcedClass","NONE",[""]],["_forcedSide",(side (_this select 0))]];
    if !(UO_FW_Server_GearModule_Allowed) exitwith {
        SETPVAR(_unit,GearReady,true);
    };
    if (!(UO_FW_Gear_ACEAR_System_Enabled) && {!(UO_FW_Gear_Olsen_Enabled)}) exitwith {
        SETPVAR(_unit,GearReady,true);
    };
    if (_forcedClass isEqualto "NONE") exitwith {ERROR_1("Invalid forcedclass for unit:%1",_unit)};
    [{(!isNull (_this select 0))}, {
        params ["_unit","_gearSystem","_forcedClass","_forcedSide"];
        private ["_loadoutName","_SystemTag","_loadoutvarname"];
        (SETVAR(_unit,Gear_UnitClass,_forcedClass));
        switch (_GearSystem) do {
            case "ACEAR": {_SystemTag = "ACE_Arsenal"};
            case "OLSEN": {_SystemTag = "Olsen"};
        };
        switch (_forcedSide) do {
            case west: {
                _loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Blufor_%2",_SystemTag,_forcedClass];
            };
            case east: {
                _loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Opfor_%2",_SystemTag,_forcedClass];
            };
            case independent: {
                _loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Indfor_%2",_SystemTag,_forcedClass];
            };
            case civilian: {
                _loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_CIV_%2",_SystemTag,_forcedClass];
            };
        };
        _loadoutName = missionNamespace getvariable [_loadoutvarname,"NONE"];
        if (_loadoutName isEqualto "NONE") exitwith {
            ERROR_2("No loadout found for unit: %1 and var %2",_unit,_loadoutvarname);
                SETPVAR(_unit,GearReady,true);
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
                        SETPVAR(_unit,GearReady,true);
                        _found = true;
                    };
                } foreach _defaultloadoutsArray;
                if !(_found) exitwith {
                    ERROR_1("Could not find %1 in Default Loadouts!",_loadoutName);
                    SETPVAR(_unit,GearReady,true);
                };
            };
            case "OLSEN": {
                LOG_2("Executing gear class: %1 for unit %2",_loadoutName,_unit);
                [_unit,_loadoutName] call UO_FW_fnc_OlsenGearScript;
                SETPVAR(_unit,GearReady,true);
            };
        };
    },[_unit,_gearSystem,_forcedClass,_forcedSide]] call CBA_fnc_waitUntilandExecute;
}] call CBA_fnc_addEventHandler;

["UO_FW_Gear_VehicleLoad", {
    if !(UO_FW_Server_GearModule_Allowed) exitwith {};
    if !(UO_FW_Gear_Olsen_Enabled) exitwith {};
    params ["_vehicle"];
    [{(!isNull _this)}, {
        params ["_vehicle"];
        private _GearSystem = _vehicle getvariable ["UO_FW_Gear_VehicleSystemType","NONE"];
        private _loadoutName = _vehicle getvariable ["UO_FW_Gear_VehicleGearManualType",""];
        if (_GearSystem isEqualto "NONE") exitwith {};
        switch (_GearSystem) do {
            case "OLSEN": {
                if (_loadoutName isEqualto "") exitwith {
                    ERROR_1("Vehicle %1 is set to manual loadout but has none!, exiting gearscript.",_vehicle);
                };
                LOG_2("Executing gear of file: %1 for vehicle %2",_loadoutName,_vehicle);
                [_vehicle,_loadoutName] call UO_FW_fnc_OlsenGearScript;
            };
        };
    },_vehicle] call CBA_fnc_waitUntilandExecute;
}] call CBA_fnc_addEventHandler;

["UO_FW_Gear_ForceVehicleLoad", {
    if !(UO_FW_Server_GearModule_Allowed) exitwith {};
    if !(UO_FW_Gear_Olsen_Enabled) exitwith {};
    params ["_vehicle",["_gearSystem","NONE",[""]],["_forcedClass","NONE",[""]]];
    if (_forcedClass isEqualto "NONE") exitwith {ERROR_1("Invalid forcedclass for vehicle:%1",_vehicle)};
    [{(!isNull (_this select 0))}, {
        params ["_vehicle",["_gearSystem","OLSEN",[""]],["_forcedClass","NONE",[""]]];
        if (_GearSystem isEqualto "NONE") exitwith {};
        switch (_GearSystem) do {
            case "OLSEN": {
                if (_forcedClass isEqualto "") exitwith {
                    ERROR_1("Vehicle %1 is set to manual loadout but has none!, exiting gearscript.",_vehicle);
                };
                LOG_2("Executing gear of file: %1 for vehicle %2",_forcedClass,_vehicle);
                [_vehicle,_forcedClass] call UO_FW_fnc_OlsenGearScript;
            };
        };
    },[_vehicle,_gearSystem,_forcedClass]] call CBA_fnc_waitUntilandExecute;
}] call CBA_fnc_addEventHandler;
