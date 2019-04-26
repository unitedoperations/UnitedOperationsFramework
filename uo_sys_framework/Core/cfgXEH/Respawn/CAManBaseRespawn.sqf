#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);

params ["_unit","_corpse"];

LOG("Respawned_Event called");
[QGVAR(RespawnedEvent), [_unit,_corpse]] call CBA_fnc_serverEvent;

if (isPlayer _unit) then {
    [_unit,_corpse] call FUNC(RespawnHandler);
};
