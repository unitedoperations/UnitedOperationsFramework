#define COMPONENT AntiND
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

["UO_FW_AntiND_Event", {
    if !(UO_FW_Server_ANTINDMODULE_Allowed) exitwith {};
    if !(UO_FW_Anti_ND_Enabled) exitwith {};
    ["UO_FW_RegisterModuleEvent", ["Anti ND", "Extra Safety for mission start", "Starfox64, PiZZADOX and Sacher"]] call CBA_fnc_localEvent;
    [{(!isNull player) && {(GETMVAR(GearReady,false))}}, {
        private _FiredEh = player addEventHandler ["Fired", {
            params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
            if (GETMVAR(ND_Active,false)) then {
                if (((GETMVAR(SpawnPos,(getpos player))) distance player) <= UO_FW_Anti_ND_Distance) then {
                    deleteVehicle _projectile;;
                    if (CBA_missionTime > UO_FW_Anti_ND_Time) then {
                        [["Anti-ND protection active!\nTime Remaining:%1 seconds.",(round (UO_FW_Anti_ND_Time - CBA_missionTime))]] call ace_common_fnc_displayTextStructured;
                    };
                    if (((GETMVAR(SpawnPos,(getpos player))) distance player) <= UO_FW_Anti_ND_Distance) then {
                        [["Anti-ND protection active!\nDistance from base:%1 out of %2 meters.",(round ((GETMVAR(SpawnPos,(getpos player))) distance player)),(round UO_FW_Anti_ND_Distance)]] call ace_common_fnc_displayTextStructured;
                    };
                    if (_magazine call BIS_fnc_isThrowable) then {
                        player addMagazine _magazine;
                    } else {
                        player setAmmo [currentWeapon player, (player ammo currentWeapon player) + 1];
                    };
                };
            };
        }];
        (SETPLVAR(ND_EHid,_FiredEh));
        [{(CBA_missionTime > UO_FW_Anti_ND_Time)},{player removeEventHandler ["Fired", _this]; (SETPLVAR(ND_EHid,"DISABLED"));},_FiredEh] call CBA_fnc_waitUntilAndExecute;
    }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

["UO_FW_SettingsLoaded", {
    ["UO_FW_AntiND_Event", []] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;
