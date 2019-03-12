#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

//Created on ???
// Modified on : 8/19/14 - 8/3/15

params ["_Unit"];
private _UnitSide = (side _Unit);
private _Array1 = [];
{
    private _TargetSide = side _x;
    if ([_UnitSide, _TargetSide] call BIS_fnc_sideIsEnemy) then {_Array1 pushback _x;};
} forEach allUnits;

private _ReturnedEnemy = [_Array1,_Unit] call EFUNC(AI,ClosestObject);
if (isNil "_ReturnedEnemy") then {_ReturnedEnemy = [0,0,0]};

(group _Unit) setVariable ["UO_FW_AI_CLOSESTEnemy",_ReturnedEnemy];
_ReturnedEnemy
