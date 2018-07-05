/*	Description: Set the task as active for the group.
 * 	Arguments:
 * 		GROUP	- Group
 * 		OBJECT	- New Task Module
 * 	Return Value:
 * 		BOOL 	- True
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params ["_grp",["_newTask",objNull,[objNull]],["_setTime",0,[0]]];		
	if(!isNull _newTask) then {		
		(_newTask call UO_AI_fnc_getTaskParams) params ["_newTask","_cond","_prior","_time","_onComp","_aeTaskId","_radius","_task","_occupy","_wait","_behave","_combat","_speed","_form","_stance"];	
		if(_time isEqualTo 0) then {
			_setTime = 1E10;
		} else {
			_setTime = _time;
		};			
		_grp setVariable["aeCurrentTaskEndTime",(time + _setTime)];
		if(!isNull (_grp getVariable["aeCurrentTask",objNull])) then {
			[_grp,(_grp getVariable["aeCurrentTask",objNull])] call UO_AI_fnc_taskComplete;
		};
		_grp setVariable["aeCurrentTask",_newTask];
		_grp call UO_AI_fnc_taskReset;			
		if(!(_stance isEqualTo "unchanged")) then {	{ _x setUnitPos _stance; } forEach (units _grp); };
		private _newBehave = if(_behave isEqualTo "unchanged") then {(behaviour (leader _grp))} else {_behave};
		private _newCombat = if(_combat isEqualTo "unchanged") then {(combatMode _grp)} else {_combat};
		private _newSpeed = if(_speed isEqualTo "unchanged") then {(speedMode _grp)} else {_speed};
		private _newForm = if(_form isEqualTo "unchanged") then {(formation _grp)} else {_form};
		[_task,_grp,(getPosATL _newTask),_radius,_wait,_newBehave,_newCombat,_newSpeed,_newForm,_occupy] call UO_AI_fnc_taskAssign;
	};
	true