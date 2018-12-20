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
	_cond = _logic getVariable ["UO_FW_taskCondition","true"];
	_onComp = _logic getVariable ["UO_FW_taskOnComplete","true"];
	if(typename _cond isEqualTo "STRING") then {_cond = compile _cond;};
	if(typename _onComp isEqualTo "STRING") then {_onComp = compile _onComp;};
	_params = [
		_logic,
		_cond,		
		(_logic getVariable ["UO_FW_TaskPriority",1]),
		(_logic getVariable ["UO_FW_TaskTime",-1]),
		_onComp,
		(_logic getVariable ["UO_FW_TaskId",0]),
		(_logic getVariable ["UO_FW_taskRadius",100]),		
		(_logic getVariable ["UO_FW_taskSet",4]),
		(_logic getVariable ["UO_FW_occupyOptionSet",0]),
		(_logic getVariable ["UO_FW_changeWaypointWait",3]),
		(_logic getVariable ["UO_FW_behaviourChange","unchanged"]),
		(_logic getVariable ["UO_FW_combatMode","unchanged"]),
		(_logic getVariable ["UO_FW_speed","unchanged"]),
		(_logic getVariable ["UO_FW_formation","unchanged"]),
		(_logic getVariable ["UO_FW_groupStance","unchanged"])
	];
	_params