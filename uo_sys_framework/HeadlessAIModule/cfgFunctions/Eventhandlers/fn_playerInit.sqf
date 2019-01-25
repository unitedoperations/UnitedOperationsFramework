#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(CLIENT);

UO_FW_AI_PlayerFiredManEH = player addEventHandler ["FiredMan",{
    params ["_firer","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile","_gunner"];
    if (CBA_MissionTime < (missionNamespace getVariable ["UO_FW_AI_unitHandler_revealLockout",-1])) exitWith {};
    missionNamespace setVariable ["UO_FW_AI_unitHandler_revealLockout",(CBA_MissionTime + 5)];
    ["UO_FW_AI_PlayerShotEvent", [_firer,_weapon,_ammo]] call CBA_fnc_globalEvent;
}];
