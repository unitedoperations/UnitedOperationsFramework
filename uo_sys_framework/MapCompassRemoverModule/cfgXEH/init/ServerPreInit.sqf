#define COMPONENT MapAndCompassRemover
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC);

["UO_FW_SettingsLoaded", {
    if (!UO_FW_Server_RemoverModule_Allowed) exitWith {};
    [{(CBA_missionTime > 1) && (missionNamespace getvariable ["UO_FW_Gear_ServerInit",false])}, {
        ["UO_FW_MapRemover_LocalEvent", []] call CBA_fnc_localEvent;
    }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;
