#define COMPONENT DisconnectControl
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

["UO_FW_SettingsLoaded", {
    if !(UO_FW_Server_DisconnectModule_Allowed) exitwith {};
    ["UO_FW_RegisterModuleEvent", ["Shot Count", "Count shots fired by units", "Beta, TinfoilHate, PiZZADOX and Sacher"]] call CBA_fnc_globalEventJiP;
    GVAR(Sides) = [];
    if (GETMVAR(BluforDelete,true)) then {GVAR(Sides) pushBack WEST;};
    if (GETMVAR(OpforDelete,true)) then {GVAR(Sides) pushBack EAST;};
    if (GETMVAR(INDFORDelete,true)) then {GVAR(Sides) pushBack INDEPENDENT;};
    if (GETMVAR(CIVDelete,true)) then {GVAR(Sides) pushBack CIVILIAN;};
}] call CBA_fnc_addEventHandler;
