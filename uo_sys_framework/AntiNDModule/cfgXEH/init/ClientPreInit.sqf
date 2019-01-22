#define COMPONENT AntiND
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

["UO_FW_SettingsLoaded", {
    if !(UO_FW_Server_ANTINDMODULE_Allowed) exitwith {};
    if !(UO_FW_Anti_ND_Enabled) exitwith {};
    ["UO_FW_RegisterModuleEvent", ["Anti ND", "Extra Safety for mission start", "Starfox64, PiZZADOX and Sacher"]] call CBA_fnc_globalEvent;
    [{(!isNull player) && {(UO_FW_GETMVAR(GearReady,false))}}, {
        private _UO_FW_FiredEh = player addEventHandler ["Fired", {
            params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
            if (UO_FW_GETMVAR(ND_Active,false)) then {
                if (((UO_FW_GETMVAR(SpawnPos,(getpos player))) distance player) <= UO_FW_Anti_ND_Distance) then {
                    deleteVehicle _projectile;
                    private _msg1 = "";
                    private _msg2 = "";
                    if (CBA_missionTime > UO_FW_Anti_ND_Time) then {
                        _msg1 = "\nTime reMaining: " + str round (UO_FW_Anti_ND_Time - time) + " seconds.";
                    };
                    if (((UO_FW_GETMVAR(SpawnPos,(getpos player))) distance player) <= UO_FW_Anti_ND_Distance) then {
                        _msg2 = "\nDistance from base: " + str round ((UO_FW_GETMVAR(SpawnPos,(getpos player))) distance player) + " out of " + str (round UO_FW_Anti_ND_Distance) + " meters.";
                    };
                    hintC format ["Anti-ND protection active!%1%2", _msg1, _msg2];
                    if (_magazine call BIS_fnc_isThrowable) then {
                        player addMagazine _magazine;
                    } else {
                        player setAmmo [currentWeapon player, (player ammo currentWeapon player) + 1];
                    };
                };
            };
        }];
        (UO_FW_SETPLVAR(ND_EHid,_UO_FW_FiredEh));
        [{(CBA_missionTime > UO_FW_Anti_ND_Time)},{player removeEventHandler ["Fired", _this]; (UO_FW_SETPLVAR(ND_EHid,"DISABLED"));},_UO_FW_FiredEh] call CBA_fnc_waitUntilAndExecute;
    }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;
