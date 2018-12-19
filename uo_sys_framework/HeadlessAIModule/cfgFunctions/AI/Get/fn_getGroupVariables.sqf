/*	Description: Set group variables on GROUP.
 * 	Arguments:
 * 		GROUP	- Group
 * 	Return Value:
 * 		ARRAY 	- Variables
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params ["_grp",["_vars",[],[[]]]];
	_vars = [
		_grp getVariable ['aeGroupPos',[]], 
		_grp getVariable ['aeBehaviour','safe'],
		_grp getVariable ['aeCombatMode','red'],
		_grp getVariable ['aeSpeed','limited'],
		_grp getVariable ['aeFormation','wedge'],
		_grp getVariable ['aePatrolRadius',0],
		_grp getVariable ['aeWaypointWait',3],
		_grp getVariable ['aeTask',4],
		_grp getVariable ['aeTaskTimer',0],
		_grp getVariable ['aeOccupyOption',0], 
		_grp getVariable ['aeWaypoints',[]],
		_grp getVariable ['aeTasks',[]],
		_grp getVariable ['UO_FW_AI_headless',true],
		_grp getVariable ['aeForceLights',false],
		_grp getVariable ['aeSurrender',false],
		_grp getVariable ['aeTracker',false]
	];
	_vars