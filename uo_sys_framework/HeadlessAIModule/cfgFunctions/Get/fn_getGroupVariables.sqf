/*	Description: Set group variables on GROUP.
 * 	Arguments:
 * 		GROUP	- Group
 * 	Return Value:
 * 		ARRAY 	- Variables
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC)
params ["_grp",["_vars",[],[[]]]];
	_vars = [
		_grp getVariable ['UO_FW_GroupPos',[]],
		_grp getVariable ['UO_FW_behaviour','safe'],
		_grp getVariable ['UO_FW_combatMode','red'],
		_grp getVariable ['UO_FW_speed','limited'],
		_grp getVariable ['UO_FW_formation','wedge'],
		_grp getVariable ['UO_FW_patrolRadius',0],
		_grp getVariable ['UO_FW_waypointWait',3],
		_grp getVariable ['UO_FW_task',4],
		_grp getVariable ['UO_FW_TaskTimer',0],
		_grp getVariable ['UO_FW_occupyOption',0],
		_grp getVariable ['UO_FW_Waypoints',[]],
		_grp getVariable ['UO_FW_tasks',[]],
		_grp getVariable ['UO_FW_AI_headless',true],
		_grp getVariable ['UO_FW_forceLights',false],
		_grp getVariable ['UO_FW_surrender',false],
		_grp getVariable ['UO_FW_Tracker',false]
	];
	_vars
