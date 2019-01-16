//UO_FW_AI_fnc_CombatAttack

params ["_Group","_currenttarget","_enemydir"];
private ["_position","_radius"];

_position = getposASL _currenttarget;
_radius = 100;

if ((random 2) > 1) then {_group setformation "LINE";} else {_group setformation "WEDGE";};
_group setformdir _enemydir;

[_Group] call CBA_fnc_clearWaypoints;
_Group setVariable ["UO_FW_AI_Mission","ATTACK"];
[_group, _position, _radius, "SAD", "AWARE", "RED"] call CBA_fnc_addWaypoint;

//_NoFlanking = _Group getVariable ["UO_FW_AI_REINFORCE",false];
//if (_NoFlanking) then {
//	[_Group] call CBA_fnc_clearWaypoints;
//	_Group setVariable ["UO_FW_AI_Mission","ATTACK"];
//	[_group, _position, _radius, "SAD", "COMBAT", "RED"] call CBA_fnc_addWaypoint;
//} else {
//	_Group setVariable ["UO_FW_AI_Mission","FLANK"];
//	[_Group,false] spawn UO_FW_AI_fnc_FlankManeuver;
//};
