#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

private ["_Enemy", "_Offset", "_ToWorld1", "_ToWorld2", "_PointHeight", "_PointHeightC", "_LookVar", "_dgn_returnvariable"];
params ["_Unit","_MovedRecentlyCover","_ActivelyClearing","_StartedInside"];

if (_MovedRecentlyCover || {_ActivelyClearing} || {_StartedInside}) exitWith {false};
private _Enemy = _Unit call EFUNC(AI,ClosestEnemy);
if (isNil "_Enemy") exitWith {};
if ((typeName _Enemy) isEqualTo "ARRAY") exitWith {_dgn_returnvariable = false;_dgn_returnvariable};
_dgn_returnvariable = false;
private _Position = getposASL _Enemy;
private _Array = lineIntersectsObjs [_Position,[_Position select 0,_Position select 1,(_Position select 2) + 10], objnull, objnull, true, 4];
{
    if (_x isKindof "Building") exitWith {_dgn_returnvariable = true;};
} foreach _Array;
_Array = lineIntersectsObjs [_Position,[_Position select 0,_Position select 1,(_Position select 2) - 10], objnull, objnull, true, 4];
{
    if (_x isKindof "Building") exitWith {_dgn_returnvariable = true;};
} foreach _Array;

_dgn_returnvariable
