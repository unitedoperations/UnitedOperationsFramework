/*	Description: Task a group to patrol randomly in their patrol radius.
 * 	Arguments:
 * 		GROUP	- Group
 * 		ARRAY	- Task Position
 * 	Optional:
 * 		NUMBER	- Task Radius
 * 		NUMBER	- Wait Time at Waypoints
 * 		STRING	- Behaviour
 * 		STRING	- CombatMode
 * 		STRING	- Speed
 * 		STRING	- Formation
 * 		STRING	- Waypoint Type
 * 		STRING	- On Waypoint Complete Statement
 * 		NUMBER	- Waypoint Complete Radius
 *		NUMBER	- Required Waypoint Amount
 * 	Return Value:
 * 		BOOL 	- True
 *	Author:
 *		Rommel
 *	Modified
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC)
params [
	"_grp",
	"_pos",
	["_radius",30,[0]],
	["_wait",3,[0]],
	["_behave","SAFE",[""]],
	["_combat","RED",[""]],
	["_speed","LIMITED",[""]],
	["_formation","WEDGE",[""]],
	["_type","MOVE",[""]],
	["_oncomplete","this call UO_FW_AI_fnc_taskSearchNearby",[""]],
	["_compradius",0,[0]],
	["_wpcount",10,[0]],
	"_i"
];

diag_log format ["taskPatrol started _this: %1",_this];
//_grp call CBA_fnc_clearWaypoints;
{_x forcespeed -1; _x enableAI "PATH";} foreach units _grp;
//CBA backup
//private _timeout = [_wait*0.5,_wait,_wait*1.5];
//[_grp, _pos, _radius, _wpcount, _type, _behave, _combat, _speed, _formation, _oncomplete, _timeout] call CBA_fnc_taskPatrol;

_pos = [_pos,_grp] select (_pos isEqualTo []);
_pos = _pos call CBA_fnc_getPos;
for [{_i=0},{(_i < _wpcount)},{_i = _i + 1}] do {
	_wp = _this call UO_FW_AI_fnc_createWaypoint;
};
_this2 =+ _this;
_this2 set [(count _this2), "CYCLE"];
_this2 call UO_FW_AI_fnc_createWaypoint;
deleteWaypoint ((waypoints _grp) select 0);

_grp setvariable ["InitialWPSet",true];
_grp setVariable ["UO_FW_AI_Mission","PATROLLING"];
true
