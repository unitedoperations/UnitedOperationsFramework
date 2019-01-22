#define COMPONENT ShotCount
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

["UO_FW_ShotCount_EH_Event", {
    if !(UO_FW_Server_ShotCountModule_Allowed) exitwith {};
    if !(UO_FW_GETMVAR(ShotCount_Enabled,false)) exitwith {};
    params ["_side","_className"];
    private _classDisplay = [_className] call UO_FW_fnc_aCount_getDisplayName;
    [_side,_classDisplay] call UO_FW_fnc_aCount_shotCount;
}] call CBA_fnc_addEventHandler;

["UO_FW_SettingsLoaded", {
    if !(UO_FW_Server_ShotCountModule_Allowed) exitwith {};
    if !(UO_FW_GETMVAR(ShotCount_Enabled,false)) exitwith {};
    UO_FW_aCount_west_ExpendedAmmunition = [];
    UO_FW_aCount_INDFOR_ExpendedAmmunition = [];
    UO_FW_aCount_east_ExpendedAmmunition = [];
    UO_FW_aCount_CIV_ExpendedAmmunition = [];
    UO_FW_aCount_classNames = [];
}] call CBA_fnc_addEventHandler;
