#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(SERVER);

LOG("Server Post Init");

UO_FW_EventRespawnedHandle = addMissionEventHandler ["EntityRespawned", {_this call UO_FW_fnc_EventRespawned;}];
UO_FW_EventKilledHandle = addMissionEventHandler ["EntityKilled", {_this call UO_FW_fnc_EventKilled;}];
UO_FW_EventDisconnectHandle = addMissionEventHandler ["HandleDisconnect", {_this call UO_FW_fnc_EventDisconnect;}];

if (EGETMVAR(AI,ViewDistance_Enforce,false)) then {
    setViewDistance EGETMVAR(AI,ViewDistance,2500);
};

SETMPVAR(MissionEnded,false);
SETMPVAR(ServerInitialized,true);

[{CBA_missionTime > 1}, {
    ESETMVAR(Respawn,TeamTicketsRemaining_Blufor,(EGETMVAR(Respawn,TeamTickets_Blufor,30)));
    ESETMVAR(Respawn,TeamTicketsRemaining_Opfor,(EGETMVAR(Respawn,TeamTickets_Opfor,30)));
    ESETMVAR(Respawn,TeamTicketsRemaining_Indfor,(EGETMVAR(Respawn,TeamTickets_Indfor,30)));
    ESETMVAR(Respawn,TeamTicketsRemaining_Civilian,(EGETMVAR(Respawn,TeamTickets_Civilian,30)));
    [] call EFUNC(EndConditions,Init);
}] call CBA_fnc_WaitUntilAndExecute;
