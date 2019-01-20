#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENTHC);

["UO_FW_Gear_PlayerGearLoad", {
    if !(UO_FW_Server_GearModule_Allowed) exitwith {UO_FW_GearReady = true;};
    if (!(UO_FW_Gear_ACEAR_System_Enabled) && {!(UO_FW_Gear_Olsen_Enabled)}) exitwith {UO_FW_GearReady = true;};
    [{(!isNull player)}, {
        private ["_loadoutName"];
        private _GearSystem = (UO_FW_GETPLVAR(Gear_UnitSystemType,"NONE"));
        LOG_1("_GearSystem: %1",_GearSystem);
        private _UnitClass = (UO_FW_GETPLVAR(Gear_UnitGearType,"NONE"));
        LOG_1("_UnitClass: %1",_UnitClass);
        (UO_FW_SETPLVAR(Gear_UnitClass,_UnitClass));
        if (_GearSystem isEqualto "NONE") exitwith {
            LOG_1("No gear system set for unit: %1",player);
            UO_FW_GearReady = true;
        };
        if (_UnitClass isEqualto "NONE") exitwith {
            ERROR_1("No loadout found for unit: %1",player);
            UO_FW_GearReady = true;
        };
        if (_UnitClass isEqualto "MANUAL") then {
            (UO_FW_SETPLVAR(Gear_ManualUnitClass,"MANUAL"));
            switch (_GearSystem) do {
                case "ACEAR": {
                    _loadoutName = (UO_FW_GETPLVAR(Gear_UnitGearManualType,""));
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
                    private _Type = (UO_FW_GETPLVAR(Gear_UnitGearManualType,""));
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
}] call CBA_fnc_addEventHandler;

["UO_FW_SettingsLoaded", {
    if !(hasInterface) then {
        ["UO_FW_Gear_LocalObjectsGearLoad", []] call CBA_fnc_localEvent;
    } else {
        ["UO_FW_Gear_PlayerGearLoad", []] call CBA_fnc_localEvent;
    };
}] call CBA_fnc_addEventHandler;
