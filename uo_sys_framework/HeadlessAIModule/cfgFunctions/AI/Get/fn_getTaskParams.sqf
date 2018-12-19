/*	Description: Return task params from linked task module.
 * 	Arguments:
 * 		OBJECT		- Task Module
 * 	Return Value:
 *		ARRAY 		- Task Module Settings
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params ["_logic",["_params",[],[[]]]];
	_cond = _logic getVariable ["aeTaskCondition","true"];
	_onComp = _logic getVariable ["aeTaskOnComplete","true"];
	if(typename _cond isEqualTo "STRING") then {_cond = compile _cond;};
	if(typename _onComp isEqualTo "STRING") then {_onComp = compile _onComp;};
	_params = [
		_logic,
		_cond,		
		(_logic getVariable ["aeTaskPriority",1]),
		(_logic getVariable ["aeTaskTime",-1]),
		_onComp,
		(_logic getVariable ["aeTaskId",0]),
		(_logic getVariable ["aeTaskRadius",100]),		
		(_logic getVariable ["aeTaskSet",4]),
		(_logic getVariable ["aeTaskOccupy",0]),
		(_logic getVariable ["aeTaskWaypointWait",3]),
		(_logic getVariable ["aeTaskBehaviour","unchanged"]),
		(_logic getVariable ["aeTaskCombatMode","unchanged"]),
		(_logic getVariable ["aeTaskSpeed","unchanged"]),
		(_logic getVariable ["aeTaskFormation","unchanged"]),
		(_logic getVariable ["aeTaskGroupStance","unchanged"])
	];
	_params