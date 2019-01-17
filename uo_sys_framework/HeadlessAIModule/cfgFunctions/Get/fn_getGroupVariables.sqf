/*	Description: Set group variables on GROUP.
 * 	Arguments:
 * 		GROUP	- Group
 * 	Return Value:
 * 		ARRAY 	- Variables
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_grp",["_vars",[],[[]]]];
	_vars = [
		_grp getVariable ['UO_FW_AI_GroupPos',[]],
		_grp getVariable ['UO_FW_AI_behaviour','safe'],
		_grp getVariable ['UO_FW_AI_combatMode','red'],
		_grp getVariable ['UO_FW_AI_speed','limited'],
		_grp getVariable ['UO_FW_AI_formation','wedge'],
		_grp getVariable ['UO_FW_AI_patrolRadius',30],
		_grp getVariable ['UO_FW_AI_waypointWait',3],
		_grp getVariable ['UO_FW_AI_task',4],
		_grp getVariable ['UO_FW_AI_TaskTimer',0],
		_grp getVariable ['UO_FW_AI_occupyOption',0],
		_grp getVariable ['UO_FW_AI_Waypoints',[]],
		_grp getVariable ['UO_FW_AI_tasks',[]],
		_grp getVariable ['UO_FW_AI_forceLights',false],
		_grp getVariable ['UO_FW_AI_surrender',false],
		_grp getVariable ['UO_FW_AI_Tracker',false]
	];
	_vars
