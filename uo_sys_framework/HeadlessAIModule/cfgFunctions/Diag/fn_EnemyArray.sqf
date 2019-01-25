#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

private _UnitSide = side (group _this);
private _Array1 = [];
{
    private _TargetSide = side _x;
    if ([_UnitSide, _TargetSide] call BIS_fnc_sideIsEnemy) then {_Array1 pushback _x;};
} forEach allUnits;
_Array1
