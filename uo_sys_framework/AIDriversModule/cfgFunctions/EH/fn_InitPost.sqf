#define COMPONENT AIDrivers
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);
if !(UO_FW_Server_AIDRIVERSMODULE_Allowed) exitwith {};

params ["_vehicle"];

//IGNORE_PRIVATE_WARNING ["_thisArgs"];

[QEGVAR(Core,SettingsLoaded), {
    private _vehicle = _thisArgs;
    private _allowNV = GETMVAR(NVEnabled,false);
	private _allowFlip = GETMVAR(FlipEnabled,false);
    if (GETMVAR(AllVehs,false)) then {
        [QGVAR(Enabled_Event),[_vehicle,_allowNV,_allowFlip]] call CBA_fnc_globalEventJIP;
        [QEGVAR(Core,RegisterModuleEvent), ["AI Drivers", "Module for adding AI Drivers to vehicles", "BlackHawk, PiZZADOX and Sacher"]] call CBA_fnc_globalEventJIP;
    } else {
        if !((GETMVAR(VehClasses,[])) isEqualto []) then {
            [QEGVAR(Core,RegisterModuleEvent), ["AI Drivers", "Module for adding AI Drivers to vehicles", "BlackHawk, PiZZADOX and Sacher"]] call CBA_fnc_globalEventJIP;
            if ((typeOf _vehicle) in (GETMVAR(VehClasses,[]))) then {
                [QGVAR(Enabled_Event),[_vehicle,_allowNV,_allowFlip]] call CBA_fnc_globalEventJIP;
            };
        };
    };
}, _vehicle] call CBA_fnc_addEventHandlerArgs;
