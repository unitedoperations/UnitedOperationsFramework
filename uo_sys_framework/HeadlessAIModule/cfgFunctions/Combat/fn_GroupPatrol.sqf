//This script will dictate how the loiter WP works for the AI
params ["_unit","_grp","_wp","_thisFSM"];

_Unitleader = leader _unit;
_wpPos = waypointPosition [_grp, _wp];

//mission var
_grp setVariable ["UO_FW_AI_Mission","PATROLLING"];
_grp setvariable ["InitialWPSet",true];

//CBA backup
//[_Unitleader, _wpPos, UO_FW_AI_PatrolDistance] call CBA_fnc_taskPatrol;

if (isNil "UO_FW_AI_PatrolDistance") then {UO_FW_AI_PatrolDistance = 200;};
_radius = _Unitleader getvariable ["PatrolDistance",UO_FW_AI_PatrolDistance];

//clear waypoints
_grp call CBA_fnc_clearWaypoints;

_pos = [_pos,_grp] select (_pos isEqualTo []);
_pos = _pos call CBA_fnc_getPos;
for [{_i=0},{(_i < _wpcount)},{_i = _i + 1}] do {
	_wp = _this call UO_FW_AI_fnc_createWaypoint;
};
_this2 =+ _this;
_this2 set [8, "CYCLE"];
_this2 call UO_FW_AI_fnc_createWaypoint;
deleteWaypoint ((waypoints _grp) select 0);
true
