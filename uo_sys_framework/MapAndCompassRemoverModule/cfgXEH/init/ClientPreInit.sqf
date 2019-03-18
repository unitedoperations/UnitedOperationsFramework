#define COMPONENT MapAndCompassRemover
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(CLIENT);
if (!UO_FW_Server_MapAndCompassRemover_Allowed) exitWith {};

[QEGVAR(Core,SettingsLoaded), {
    if (GETMVAR(GivePlayersEquipment,false)) then {
        if (isPlayer player) then {
            player linkItem "ItemCompass";
            player linkItem "ItemMap";
        };
    };
    [QGVAR(PlayerEvent), []] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

[QGVAR(PlayerEvent), {
    [QEGVAR(Core,RegisterModuleEvent), ["Map and Compass Remover", "Removes Map and Compass after briefing", "TinfoilHate, Sacher and PiZZADOX"]] call CBA_fnc_localEvent;
    [{(CBA_missionTime > 1) && {(EGETPLVAR(Gear,GearReady,false))}}, {
        if (GETPLVAR(RemoveMap,false)) then {
            player unlinkItem "ItemMap";
        };
        if (GETPLVAR(RemoveCompass,false)) then {
            player unlinkItem "ItemCompass";
        };
    }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;
