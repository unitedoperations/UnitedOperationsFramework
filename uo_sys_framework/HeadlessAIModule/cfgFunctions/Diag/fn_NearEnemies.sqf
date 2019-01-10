params ["_unit"];

private _UnitSide = (side _Unit);
private _Array1 = [];
{
	private _TargetSide = side _x;
	if ([_UnitSide, _TargetSide] call BIS_fnc_sideIsEnemy) then {_Array1 pushback _x;};
} forEach allUnits;

private _ReturnedEnemy = [_Array1,_Unit] call UO_FW_AI_fnc_ClosestObject;
if (isNil "_ReturnedEnemy") then {_ReturnedEnemy = [0,0,0]};

//_Unit setVariable ["UO_FW_AI_CLOSESTENEMY",_ReturnedEnemy,false];
_ReturnedEnemy
