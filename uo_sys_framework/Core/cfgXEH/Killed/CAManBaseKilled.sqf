#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);

params ["_unit", "_killer", "_instigator"];
LOG("Killed_Event called");
[QGVAR(KilledEvent), _unit] call CBA_fnc_serverEvent;

if (isPlayer _unit) then {
    _this call FUNC(KilledHandler);
};
