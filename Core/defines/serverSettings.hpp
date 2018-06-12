UO_FW_Teams = []; //DO NOT REMOVE
UO_FW_MissionEnded = false; //Mission has not ended

//Create respawn markers
{_x call UO_FW_fnc_CreateRespawnMarker;} foreach ["west","east","guer","civ"];

UO_FW_EventPlayerSpawnedHandle = ["UO_FW_PlayerSpawned", {_this call UO_FW_fnc_EventPlayerSpawned;}] call CBA_fnc_addEventHandler;
UO_FW_EventRespawnedHandle = addMissionEventHandler ["EntityRespawned", {_this call UO_FW_fnc_EventRespawned;}];
UO_FW_EventKilledHandle = addMissionEventHandler ["EntityKilled", {_this call UO_FW_fnc_EventKilled;}];
UO_FW_EventDisconnectHandle = addMissionEventHandler ["HandleDisconnect", {_this call UO_FW_fnc_EventDisconnect;}];

_AIViewDistance = missionNamespace getvariable ["UO_FW_AIViewDistance",2000];
setViewDistance _AIViewDistance;