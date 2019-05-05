#define COMPONENT AIDrivers
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(SERVER);
if !(UO_FW_Server_AIDRIVERSMODULE_Allowed) exitwith {};

params ["_vehicle"];

//IGNORE_PRIVATE_WARNING ["_thisArgs"];

private _allowNV = GETMVAR(NVEnabled,false);
private _allowFlip = GETMVAR(FlipEnabled,false);
private _allVeh = GETMVAR(AllVehs,false);
private _inClasses = (typeOf _vehicle) in (GETMVAR(VehClasses,[]));
private _option = GETVAR(_vehicle,VehEnabled,false);

LOG_4("Trying to add AI Drivers to %1 _allVehicles=%2 _inClasses=%3 _option=%4", _vehicle,_allVeh,_inClasses,_option);

if (_allVeh) exitwith {
    [QGVAR(Enabled_Event),[_vehicle,_allowNV,_allowFlip]] call CBA_fnc_globalEventJIP;
    [QEGVAR(Core,RegisterModuleEvent), ["AI Drivers", "Module for adding AI Drivers to vehicles", "BlackHawk, PiZZADOX and Sacher"]] call CBA_fnc_globalEventJIP;
};
if (_inClasses) exitwith {
    [QEGVAR(Core,RegisterModuleEvent), ["AI Drivers", "Module for adding AI Drivers to vehicles", "BlackHawk, PiZZADOX and Sacher"]] call CBA_fnc_globalEventJIP;
    [QGVAR(Enabled_Event),[_vehicle,_allowNV,_allowFlip]] call CBA_fnc_globalEventJIP;
};
if (_option) then {
    private _allowNV = GETVAR(_vehicle,VehNVEnabled,false);
    private _allowFlip = GETVAR(_vehicle,VehFlipEnabled,false);
    [QGVAR(Enabled_Event),[_vehicle,_allowNV,_allowFlip]] call CBA_fnc_globalEventJIP;
    [QEGVAR(Core,RegisterModuleEvent), ["AI Drivers", "Module for adding AI Drivers to vehicles", "BlackHawk, PiZZADOX and Sacher"]] call CBA_fnc_globalEventJIP;
};

