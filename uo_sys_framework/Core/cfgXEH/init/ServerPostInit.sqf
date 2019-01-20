#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

LOG("Server Post Init");
//Create Respawn Markers
{_x call UO_FW_fnc_CreateRespawnMarker;} foreach ["west","east","guer","civ"];

UO_FW_EventPlayerSpawnedHandle = ["UO_FW_PlayerSpawned", {_this call UO_FW_fnc_EventPlayerSpawned;}] call CBA_fnc_addEventHandler;
UO_FW_EventRespawnedHandle = addMissionEventHandler ["EntityRespawned", {_this call UO_FW_fnc_EventRespawned;}];
UO_FW_EventKilledHandle = addMissionEventHandler ["EntityKilled", {_this call UO_FW_fnc_EventKilled;}];
UO_FW_EventDisconnectHandle = addMissionEventHandler ["HandleDisconnect", {_this call UO_FW_fnc_EventDisconnect;}];

setViewDistance UO_FW_AI_ViewDistance;

if (UO_FW_DisconnectControl_Enabled) then {
	ace_respawn_RemoveDeadBodiesDisconnected = false;
};
