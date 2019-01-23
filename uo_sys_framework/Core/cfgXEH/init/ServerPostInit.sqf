#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

LOG("Server Post Init");

UO_FW_EventRespawnedHandle = addMissionEventHandler ["EntityRespawned", {_this call UO_FW_fnc_EventRespawned;}];
UO_FW_EventKilledHandle = addMissionEventHandler ["EntityKilled", {_this call UO_FW_fnc_EventKilled;}];
UO_FW_EventDisconnectHandle = addMissionEventHandler ["HandleDisconnect", {_this call UO_FW_fnc_EventDisconnect;}];

if (UO_FW_GETMVAR(AI_ViewDistance_Enforce,false)) then {
    setViewDistance UO_FW_GETMVAR(AI_ViewDistance,2500);
};

UO_FW_SETMPVAR(MissionEnded,false);
UO_FW_SETMPVAR(ServerInitialized,true);

[{CBA_missionTime > 1}, {
    [] call UO_FW_EndConditionsInit;
    UO_FW_SETMVAR(TeamTicketsRemaining_Blufor,(UO_FW_GETMVAR(RespawnSetting_TeamTickets_Blufor,30)));
    UO_FW_SETMVAR(TeamTicketsRemaining_Opfor,(UO_FW_GETMVAR(RespawnSetting_TeamTickets_Opfor,30)));
    UO_FW_SETMVAR(TeamTicketsRemaining_Indfor,(UO_FW_GETMVAR(RespawnSetting_TeamTickets_Indfor,30)));
    UO_FW_SETMVAR(TeamTicketsRemaining_Civ,(UO_FW_GETMVAR(RespawnSetting_TeamTickets_Civ,30)));
}] call CBA_fnc_WaitUntilAndExecute;

if (UO_FW_DisconnectControl_Enabled) then {
    ace_respawn_RemoveDeadBodiesDisconnected = false;
};
