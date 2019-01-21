//Function that executes on AI when they are hit.
//Updated on 08/17/17 @ 1725

private _Unit = _this select 0;

//If the unit got hit recently, ignore this.
if (_Unit getVariable ["UO_FW_AI_GHit",false]) exitWith {};
_Unit setVariable ["UO_FW_AI_GHit",true];
_Unit spawn {sleep 30;_this setVariable ["UO_FW_AI_GHit",false];};

if (isPlayer _Unit) exitWith {};
if ((vehicle _Unit) != _Unit) exitWith {};

//Lay down
_Unit setUnitPos "DOWN";_Unit spawn {sleep 30; _this setUnitPos "MIDDLE";sleep 30;_this setUnitPos "AUTO";};

if ((random 100) < 5) then {
    _unit setUnconscious true;
    _unit spawn {sleep 15;_this setUnconscious false;};
};

//[_Unit,false,false,false,false] spawn UO_FW_AI_fnc_MoveToCover;
