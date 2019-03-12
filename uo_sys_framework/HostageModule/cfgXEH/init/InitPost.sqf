#define COMPONENT Hostage
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);

params ["_unit"];

if !(GETVAR(_unit,State,false)) exitwith {};

//IGNORE_PRIVATE_WARNING ["_thisArgs"];

[QEGVAR(Core,SettingsLoaded), {
    private _unit = _thisArgs;
    [_unit] call FUNC(Set);
}, _unit] call CBA_fnc_addEventHandlerArgs;
