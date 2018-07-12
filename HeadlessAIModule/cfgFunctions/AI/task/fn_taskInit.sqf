/*	Description: Initial Task Module Activation.
 * 	Arguments:
 * 		GROUP	- Group
 * 		ARRAY	- Task Module/s
 * 	Return Value:
 * 		BOOL 	- True
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params ["_grp",["_tasks",[],[[]]],["_task",objNull,[objNull]],["_taskOrdered",false,[false]]];	
	private _activeTasks = [];
	for [{_i=0},{(_i < count _tasks)},{_i = _i + 1}] do {
		private _taskSet = (_tasks select _i) call UO_AI_fnc_getTaskParams;
		_taskSet params ["_task","_cond","_prior","_time","_onComp","_taskId"];
		if(call _cond) then {
			_taskOrdered = if(_taskId > 0) then {true} else {false};
			_activeTasks pushback [_taskId,_prior,_task];
		};
	};	
	if(_activeTasks isEqualTo []) then {
		[_grp] call UO_AI_fnc_taskGroup;
	} else {
		_activeTasks sort true;
		if(_taskOrdered) then {				
			_task = (_activeTasks select 0 select 2);
			_grp setVariable ["UO_FW_groupTaskOrder",[true,_activeTasks]];
		} else {
			_task = (_activeTasks select 0 select 2);
		};
	};
	if(!isNull _task) then {
		[_grp,_task] call UO_AI_fnc_taskSet;
	};
	true