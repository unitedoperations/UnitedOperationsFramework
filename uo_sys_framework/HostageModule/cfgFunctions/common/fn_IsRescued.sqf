#define COMPONENT Hostage
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params ["_unit"];

private _isRescued = (GETVAR(_unit,IsRescued,false));
_isRescued;
