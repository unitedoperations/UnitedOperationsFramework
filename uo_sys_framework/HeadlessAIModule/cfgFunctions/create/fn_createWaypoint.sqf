/*	Description: Task a group to patrol a box around their patrol position.
 * 	Arguments:
 * 		GROUP	- Group
 * 		ARRAY	- Task Position
 * 	Optional:
 * 		NUMBER	- Create Waypoint Radius (random waypoint placement within radius)
 * 		NUMBER	- Wait Time at Waypoints
 * 		STRING	- Behaviour
 * 		STRING	- CombatMode
 * 		STRING	- Speed
 * 		STRING	- Formation
 * 		STRING	- Waypoint Type
 * 		STRING	- On Waypoint Complete Statement
 * 		NUMBER	- Waypoint Complete Radius
 * 	Return Value:
 * 		ARRAY 	- Waypoint
 *	Author:
 *		Rommel	- CBA_A3
 *	Modified
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC)

params [
	"_grp",
	["_pos",[],[[]]],
	["_radius",0,[0]],
	["_wait",3,[0]],
	["_behaviour", "UNCHANGED", [""]],
  ["_combat", "NO CHANGE", [""]],
  ["_speed", "UNCHANGED", [""]],
	["_formation", "NO CHANGE", [""]],
	["_type","MOVE",[""]],
	["_oncomplete","",[""]],
	["_compradius",0,[0]]
];

	private _timeout = [_wait*0.5,_wait,_wait*1.5];
	_grp = _grp call CBA_fnc_getGroup;
	_pos = _pos call CBA_fnc_getPos;
	private _wp = _grp addWaypoint [_pos,_radius];
	_wp setWaypointType _type;
	_wp setWaypointBehaviour _behaviour;
	_wp setWaypointCombatMode _combat;
	_wp setWaypointSpeed _speed;
	_wp setWaypointFormation _formation;
	_wp setWaypointStatements ["true", _oncomplete];
	_wp setWaypointTimeout _timeout;
	_wp setWaypointCompletionRadius _compradius;
	_wp
