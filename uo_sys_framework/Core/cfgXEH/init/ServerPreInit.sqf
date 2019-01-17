#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

INFO("Server Pre Init");

missionNamespace setVariable ["UO_FW_MissionEnded", false, true];
missionNamespace setVariable ["UO_FW_ServerInitialized", false, true];

//Team Init
[] call UO_FW_fnc_teamsInit;
