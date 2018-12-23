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
	_grp call UO_FW_AI_fnc_taskReset;
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
