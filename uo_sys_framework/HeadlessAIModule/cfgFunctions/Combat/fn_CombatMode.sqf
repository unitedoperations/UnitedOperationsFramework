//UO_FW_AI_fnc_CombatMode

params ["_unit","_LastCStance"];
private ["_NearestEnemy","_TimeShot"];

_NearestEnemy = _Unit call EFUNC(AI,ClosestEnemy);
if (isNil "_NearestEnemy") exitwith {};

_TimeShot = _Unit getVariable ["UO_FW_AI_FiredTime",0];

if ((diag_tickTime - _TimeShot) > 120 && {((_NearestEnemy distance _Unit) > 1000)}) then {
    _Unit setBehaviour (_LastCStance);
};
