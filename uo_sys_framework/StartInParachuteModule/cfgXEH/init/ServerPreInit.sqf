#define COMPONENT StartInParachute
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

["UO_FW_SettingsLoaded", {
    if (!UO_FW_Server_StartInParachuteModule_Allowed) exitWith {};
    ["UO_FW_StartInParachute_LocalEvent", []] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;
