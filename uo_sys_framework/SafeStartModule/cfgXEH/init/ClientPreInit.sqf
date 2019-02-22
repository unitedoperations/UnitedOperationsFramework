#define COMPONENT SafeStart
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

["UO_FW_SafeStart_Event", {
    if !(UO_FW_Server_SafeStartModule_Allowed) exitWith {};
    if !(UO_FW_SafeStart_Enable) exitwith {};
    ["UO_FW_RegisterModuleEvent", ["Safe Start", "Extra safety for mission start", "Olsen and PiZZADOX"]] call CBA_fnc_localEvent;
    [{!isNull player}, {
        if !((currentWeapon player) isEqualto "") then {
            [player, (currentWeapon player), (currentMuzzle player)] call ace_safemode_fnc_lockSafety;
        };
        if (UO_FW_SafeStart_Lowered) then {
            player action ["WeaponOnBack", player];
        };
        if (UO_FW_SafeStart_Unloaded) then {
            private _magazineClass = currentMagazine player;
            player setAmmo [currentWeapon player, 0];
            player addMagazines [_magazineClass, 1];
        };
    }, []] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

["UO_FW_SettingsLoaded", {
    ["UO_FW_SafeStart_Event", []] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;
