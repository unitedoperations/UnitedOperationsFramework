params ["_unit"]; private ["_morale","_state"];

_morale	= _unit getVariable "aiCover_morale_up";
_state	= _unit getVariable "aiCover_state_up";

if (alive _unit) then {
    [{morale (_this select 0) >= (_this select 1) || !alive (_this select 0)},{
        params ["_unit","_morale","_state"];

        _unit setUnitPos _state;
        [_unit] call UO_FNC_addCover;
    },[_unit,_morale,_state]] call CBA_fnc_waitUntilAndExecute;
};
