#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

LOG("UO_FW_Spawned_Event called");
["UO_FW_Spawned_Event", _this] call CBA_fnc_serverEvent;
