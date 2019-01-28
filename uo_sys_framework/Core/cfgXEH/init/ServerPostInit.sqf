#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

LOG("Server Post Init");

UO_FW_EventRespawnedHandle = addMissionEventHandler ["EntityRespawned", {_this call UO_FW_fnc_EventRespawned;}];
UO_FW_EventKilledHandle = addMissionEventHandler ["EntityKilled", {_this call UO_FW_fnc_EventKilled;}];
UO_FW_EventDisconnectHandle = addMissionEventHandler ["HandleDisconnect", {_this call UO_FW_fnc_EventDisconnect;}];

if (GETMVAR(AI_ViewDistance_Enforce,false)) then {
    setViewDistance GETMVAR(AI_ViewDistance,2500);
};

SETMPVAR(MissionEnded,false);
SETMPVAR(ServerInitialized,true);

[{CBA_missionTime > 1}, {
    [] call UO_FW_EndConditionsInit;
    SETMVAR(TeamTicketsRemaining_Blufor,(GETMVAR(RespawnSetting_TeamTickets_Blufor,30)));
    SETMVAR(TeamTicketsRemaining_Opfor,(GETMVAR(RespawnSetting_TeamTickets_Opfor,30)));
    SETMVAR(TeamTicketsRemaining_Indfor,(GETMVAR(RespawnSetting_TeamTickets_Indfor,30)));
    SETMVAR(TeamTicketsRemaining_Civ,(GETMVAR(RespawnSetting_TeamTickets_Civ,30)));
}] call CBA_fnc_WaitUntilAndExecute;

if (UO_FW_DisconnectControl_Enabled) then {
    ace_respawn_RemoveDeadBodiesDisconnected = false;
};
