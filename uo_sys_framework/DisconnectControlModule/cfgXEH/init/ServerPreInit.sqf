#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

["UO_FW_SettingsLoaded", {
    if !(UO_FW_Server_DisconnectModule_Allowed) exitwith {};
    ["UO_FW_RegisterModuleEvent", ["Shot Count", "Count shots fired by units", "Beta, TinfoilHate, PiZZADOX and Sacher"]] call CBA_fnc_globalEventJiP;
    UO_FW_Disconnect_Control_Sides = [];
    if (UO_FW_GETMVAR(DisconnectControl_BluforDelete,true)) then {UO_FW_Disconnect_Control_Sides pushBack WEST;};
    if (UO_FW_GETMVAR(DisconnectControl_OpforDelete,true)) then {UO_FW_Disconnect_Control_Sides pushBack EAST;};
    if (UO_FW_GETMVAR(DisconnectControl_INDFORDelete,true)) then {UO_FW_Disconnect_Control_Sides pushBack INDEPENDENT;};
    if (UO_FW_GETMVAR(DisconnectControl_CIVDelete,true)) then {UO_FW_Disconnect_Control_Sides pushBack CIVILIAN;};
}] call CBA_fnc_addEventHandler;
