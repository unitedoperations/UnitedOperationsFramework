/*	Description: Set group task completed.
 * 	Arguments:
 * 		GROUP	- Group
 * 	Return Value:
 * 		ARRAY 	- Variables
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params ["_grp",["_compTask",objNull,[objNull]]];
	private _completedTasks = _grp getVariable["aeCompletedTasks",[]];
	private _taskSet = _compTask call UO_AI_fnc_getTaskParams;
	_taskSet params ["_task","_cond","_prior","_time","_onComp","_taskId"];
	_completedTask = [_taskId,_prior,_task];
	if( !(_completedTask IN _completedTasks)) then {
		_completedTasks append [_completedTask];
		_grp setVariable["aeCompletedTasks",_completedTasks];
	 };
	 true