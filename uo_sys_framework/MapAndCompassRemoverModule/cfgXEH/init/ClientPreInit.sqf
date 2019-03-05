#define COMPONENT MapAndCompassRemover
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

["UO_FW_MapRemover_PlayerEvent", {
    if (!UO_FW_Server_RemoverModule_Allowed) exitWith {};
    ["UO_FW_RegisterModuleEvent", ["Map and Compass Remover", "Removes Map and Compass after briefing", "TinfoilHate, Sacher and PiZZADOX"]] call CBA_fnc_localEvent;
    [{(CBA_missionTime > 1) && {(EGETPLVAR(Gear,GearReady,false))}}, {
        if (GETPLVAR(RemoveMap,false)) then {
            player unlinkItem "ItemMap";
        };
        if (GETPLVAR(RemoveCompass,false)) then {
            player unlinkItem "ItemCompass";
        };
    }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;
