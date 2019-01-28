#define COMPONENT Hostage
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

["UO_FW_Hostage_ACEActions_GlobalEvent", {
    params ["_unit"];
    private _rescueaction = ["Rescue Hostage", "Rescue Hostage","",{_this call UO_FW_fnc_HostageRescue},{!(GETVAR((_this select 0),Rescued,false)) && {(alive (_this select 0))}}, "", [_unit]] call ace_interact_menu_fnc_createAction;
    [_unit, 0, ["ACE_MainActions"], _rescueaction] call ace_interact_menu_fnc_addActionToObject;
}] call CBA_fnc_addEventHandler;
