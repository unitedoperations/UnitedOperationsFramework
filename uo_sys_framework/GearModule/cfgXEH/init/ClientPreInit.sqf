#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENTHC);

//IGNORE_PRIVATE_WARNING ["_x"];

["UO_FW_Gear_PlayerGearLoad", {
    if !(UO_FW_Server_GearModule_Allowed) exitwith {
        SETPLPVAR(GearReady,true);
    };
    if (!(GETMVALUE(Gear_ACEAR_System_Enabled,false)) && {!(GETMVALUE(Gear_Olsen_Enabled,false))}) exitwith {
        SETPLPVAR(GearReady,true);
    };
    [{(!isNull player) && {!((GETPLVAR(Gear_UnitSystemType,"")) isEqualto "")} && {!((GETPLVAR(Gear_UnitGearType,"")) isEqualto "")}}, {
        private ["_loadoutName"];
        private _systemType = (GETPLVAR(Gear_UnitSystemType,"NONE"));
        LOG_1("_systemType: %1",_systemType);
        private _gearType = (GETPLVAR(Gear_UnitGearType,"NONE"));
        LOG_1("_gearType: %1",_gearType);
        (SETPLVAR(Gear_gearType,_gearType));
        if (_systemType isEqualto "NONE") exitwith {
            LOG_1("No gear system set for unit: %1",player);
            SETPLPVAR(GearReady,true);
        };
        if (_gearType isEqualto "NONE") exitwith {
            ERROR_1("No loadout found for unit: %1",player);
            SETPLPVAR(GearReady,true);
        };
        if (_gearType isEqualto "MANUAL") then {
            (SETPLVAR(Gear_ManualUnitClass,"MANUAL"));
            private _manualClass = (GETPLVAR(Gear_UnitGearManualType,""));
            if (_manualClass isEqualto "") exitwith {
                ERROR_1("Unit %1 is set to manual loadout but has none!, exiting gearscript.",player);
                SETPLPVAR(GearReady,true);
            };
            switch (_systemType) do {
                case "ACEAR": {
                    private _found = false;
                    //private _defaultloadoutsArray = missionNamespace getvariable ['ace_arsenal_defaultLoadoutsList',[]];
                    private _defaultloadoutsArray = missionNamespace getvariable ['ace_arsenal_defaultLoadoutsList',[]];
                    if (_defaultloadoutsArray isEqualto []) exitwith {
                        LOG("ACE Arsenal DefaultLoadouts Empty!");
                        SETPLPVAR(GearReady,true);
                    };
                    {
                        _x params ["_name","_loadoutData"];
                        if (_manualClass == _name) exitwith {
                            player setUnitLoadout _loadoutData;
                            LOG_2("Setting ace loadout: %1 for unit %2",_manualClass,player);
                            SETPLPVAR(GearReady,true);
                            _found = true;
                        };
                    } foreach _defaultloadoutsArray;
                    if !(_found) exitwith {
                        ERROR_1("Could not find %1 in Default Loadouts!",_manualClass);
                        SETPLPVAR(GearReady,true);
                    };
                };
                case "OLSEN": {
                    LOG_2("Executing gear class: %1 for unit %2",_manualClass,player);
                    [player,_manualClass] call UO_FW_fnc_OlsenGearScript;
                    SETPLPVAR(GearReady,true);
                };
            };
        } else {
            private ["_SystemTag","_loadoutvarname"];
            switch (_systemType) do {
                case "ACEAR": {_SystemTag = "ACE_Arsenal"};
                case "OLSEN": {_SystemTag = "Olsen"};
            };
            private ["_loadoutvarname"];
            switch (side player) do {
                case west: {
                    _loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Blufor_%2",_SystemTag,_gearType];
                };
                case east: {
                    _loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Opfor_%2",_SystemTag,_gearType];
                };
                case resistance: {
                    _loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_Indfor_%2",_SystemTag,_gearType];
                };
                case civilian: {
                    _loadoutvarname = format ["UO_FW_GearSettings_%1_LoadoutType_CIV_%2",_SystemTag,_gearType];
                };
            };
            //_loadoutName = missionNamespace getvariable [_loadoutvarname,"NONE"];
            _loadoutName = missionNamespace getvariable [_loadoutvarname,"NONE"];
            if (_loadoutName isEqualto "NONE") exitwith {
                ERROR_2("No loadout found for unit: %1 and var %2",player,_loadoutvarname);
                SETPLPVAR(GearReady,true);
            };
            switch (_systemType) do {
                case "ACEAR": {
                    private _found = false;
                    //private _defaultloadoutsArray = missionNamespace getvariable ['ace_arsenal_defaultLoadoutsList',[]];
                    private _defaultloadoutsArray = missionNamespace getvariable ['ace_arsenal_defaultLoadoutsList',[]];
                    if (_defaultloadoutsArray isEqualto []) exitwith {
                        LOG("ACE Arsenal DefaultLoadouts Empty!");
                        SETPLPVAR(GearReady,true);
                    };
                    {
                        _x params ["_name","_loadoutData"];
                        if (_loadoutName == _name) exitwith {
                            player setUnitLoadout _loadoutData;
                            LOG_2("Setting ace loadout: %1 for unit %2",_loadoutName,player);
                            SETPLPVAR(GearReady,true);
                            _found = true;
                        };
                    } foreach _defaultloadoutsArray;
                    if !(_found) exitwith {
                        ERROR_1("Could not find %1 in Default Loadouts!",_loadoutName);
                        SETPLPVAR(GearReady,true);
                    };
                };
                case "OLSEN": {
                    LOG_2("Executing gear class: %1 for unit %2",_loadoutName,player);
                    [player,_loadoutName] call UO_FW_fnc_OlsenGearScript;
                    SETPLPVAR(GearReady,true);
                };
            };
        };
    }] call CBA_fnc_waitUntilandExecute;
}] call CBA_fnc_addEventHandler;

switch (true) do {
    case (UO_FW_VERSIONNUMBER >= 103): {
        ["UO_FW_SettingsLoaded", {
            [{!isNull player},{
                [] call UO_loadoutIndex;
                SETPLPVAR(GearReady,true);
            }] call CBA_fnc_waitUntilandExecute;
        }] call CBA_fnc_addEventHandler;
    };
    case (UO_FW_VERSIONNUMBER <= 102): {
        ["UO_FW_SettingsLoaded", {
            if !(hasInterface) then {
                ["UO_FW_Gear_LocalObjectsGearLoad", []] call CBA_fnc_localEvent;
            } else {
                ["UO_FW_Gear_PlayerGearLoad", []] call CBA_fnc_localEvent;
            };
        }] call CBA_fnc_addEventHandler;
        if (isMultiplayer) then {
            [{(!isNull player) && {((!(isNull findDisplay 53)) && {(GETPLVAR(GearReady,false))}) || (getClientStateNumber >= 10)}},{
                if (getClientStateNumber >= 10) exitwith {SETPLPVAR(ClientContinued,true);};
                LOG_1("findDisplay wait passed, control: %1",(findDisplay 53 displayCtrl 1));
                LOG_1("findDisplay wait passed, ADMIN: %1",ISADMIN);
                if !(ISADMIN) then {
                    [{
                        ctrlActivate (findDisplay 53 displayCtrl 1);
                        [{(!(ctrlEnabled (findDisplay 53 displayCtrl 1)))},{
                            SETPLPVAR(ClientContinued,true);
                        }] call CBA_fnc_waitUntilandExecute;
                    }] call CBA_fnc_execNextFrame;
                } else {
                    SETPLPVAR(ClientContinued,true);
                };
            }] call CBA_fnc_waitUntilandExecute;
        };
        [{!isNull player},{
            [{(GETPLVAR(GearReady,false)) && {!isMultiplayer || (((call BIS_fnc_listPlayers) findIf {(GETVAR(_x,GearReady,false)) && {(GETVAR(_x,ClientContinued,false))}}) != -1)}},{
                [] call UO_loadoutIndex;
            }] call CBA_fnc_waitUntilandExecute;
        }] call CBA_fnc_waitUntilandExecute;
    };
};
