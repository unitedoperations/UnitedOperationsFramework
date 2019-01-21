call compile preProcessFileLineNumbers "\x\UO_FW\addons\Main\Core\cfgXEH\Settings\CBA_settings.sqf";

#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"

INFO_1("Framework Server setting: %1",UO_FW_Server_Framework_Allowed);

if (!UO_FW_Server_Framework_Allowed) exitWith {
    INFO("Framework is disabled in Server settings, exiting");
};

if !(UO_FW_GETMVALUE(UO_FW_Enabled,false)) exitWith {
    INFO("Framework is disabled in Mission settings, exiting");
};

INFO("Initializing Framework");
LOG("Global Pre Init");
UO_FW_Framework_Initialized = false;
[] call UO_FW_fnc_setDefaults;

["UO_FW_EntityAttributeLoad", {
    params ["_object", "_propertyName", "_value", ["_isGlobal",false,[false]]];
    _object setvariable [_propertyName,_value,_isGlobal];
}] call CBA_fnc_addEventHandler;

// Set Respawn Modes of all Teams from FW Settings
["UO_FW_SettingsLoaded", {
    //_respawnTypeArray = [['1 Life','ONELIFE'],['Unlimited','UNLIMITED'],['Individual Tickets','INDTICKETS'],['Team Tickets','TEAMTICKETS']];

}] call CBA_fnc_addEventHandler;

["UO_FW_EndMission_LocalObjectsEvent", {
    {
        _x enableSimulation false;
        removeAllWeapons _x;
    } foreach vehicles select {local _x};
    {
        _x enableSimulation false;
        removeAllWeapons _x;
    } foreach allUnits select {local _x};
}] call CBA_fnc_addEventHandler;

if !(hasInterface) then {
    ["UO_FW_EndMission_Event", {
        ["UO_FW_EndMission_LocalObjectsEvent", []] call CBA_fnc_localEvent;
    }] call CBA_fnc_addEventHandler;
};
