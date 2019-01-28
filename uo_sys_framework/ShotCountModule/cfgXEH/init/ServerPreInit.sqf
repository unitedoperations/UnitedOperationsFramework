#define COMPONENT ShotCount
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

["UO_FW_ShotCount_EH_Event", {
    if !(UO_FW_Server_ShotCountModule_Allowed) exitwith {};
    if !(GETMVAR(ShotCount_Enabled,false)) exitwith {};
    params ["_side","_className"];
    private _classDisplay = [_className] call UO_FW_fnc_aCount_getDisplayName;
    [_side,_classDisplay] call UO_FW_fnc_aCount_shotCount;
}] call CBA_fnc_addEventHandler;

["UO_FW_SettingsLoaded", {
    if !(UO_FW_Server_ShotCountModule_Allowed) exitwith {};
    if !(GETMVAR(ShotCount_Enabled,false)) exitwith {};
    UO_FW_ShotCount_ExpendedAmmunition_BLUFOR = [];
    UO_FW_ShotCount_ExpendedAmmunition_INDFOR = [];
    UO_FW_ShotCount_ExpendedAmmunition_OPFOR = [];
    UO_FW_ShotCount_ExpendedAmmunition_CIV = [];
    UO_FW_ShotCount_classNames = [];
}] call CBA_fnc_addEventHandler;
