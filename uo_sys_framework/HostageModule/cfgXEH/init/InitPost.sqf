#define COMPONENT Hostage
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);

params ["_unit"];
private _hostageState = GETVAR(_unit,State,false);
LOG_2("Hostage InitPost Unit: %1 Value: %2!",_unit,_hostageState);

if !(_hostageState) exitwith {};
[_unit] call FUNC(Set);
