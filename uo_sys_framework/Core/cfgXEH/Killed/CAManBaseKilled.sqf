#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);

LOG("Killed_Event called");
[QGVAR(KilledEvent), _this] call CBA_fnc_serverEvent;
