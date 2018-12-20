/*	Description: Set the task as active for the group.
 * 	Arguments:
 * 		GROUP	- Group
 * 		OBJECT	- New Task Module
 * 	Return Value:
 * 		BOOL 	- True
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params ["_grp","_i"];
	([_grp] call UO_FW_AI_fnc_getGroupVariables) params ["_pos","_behave","_combat","_speed","_formation","_taskRadius","_wait","_task","_taskTimer","_occupyOption","_waypoints","_tasks","_fl","surrender","_tracker"];
	if(_occupyOption > 0 && _task < 6) then {
		if(_task isEqualTo 2 || _task isEqualTo 4 || _task isEqualTo 5) then {
			for [{_i=0},{(_i < (count(units _grp)))},{_i = _i + 1}] do {
				_u = (units _group) select _i;
				_u setvariable["UO_FW_Occupy",true];
				_blds = ["_spos","_taskRadius","_occupyOption","_grpcount"] call UO_FW_AI_fnc_getBuildingList;
				_blds params [["_bld",[],[[]]],["_bldPos",[],[[]]]];
				_setBldPos = [_occupyOption,_i,_bld,_bldPos] call UO_FW_AI_fnc_setBuildingPos;
				_setBldPos params [["_spos",[],[[]]],["_uBld",objNull,[objNull]]];
				[_u,_uBld,_bldPos,_wait,[_behave,_combat,_speed,_formation]] spawn UO_FW_AI_fnc_taskBuildingPatrol;
			};
			_grp setVariable["UO_FW_CompletedTasks",[]];
			_grp setVariable["UO_FW_CurrentTaskEndTime",(time + _taskTimer)];
		};
		if(_task isEqualTo 0 || _task isEqualTo 1 || _task isEqualTo 3) then {
			{_x setvariable["UO_FW_Occupy",true]} forEach (units _grp);
			_grp setVariable["UO_FW_CompletedTasks",[]];
			_grp setVariable["UO_FW_CurrentTaskEndTime",(time + _taskTimer)];
			[_task,_grp,_pos,_taskRadius,_wait,_behave,_combat,_speed,_formation,_occupyOption] call UO_FW_AI_fnc_taskAssign;
		};
	} else {
		_grp setVariable["UO_FW_CompletedTasks",[]];
		_grp setVariable["UO_FW_CurrentTaskEndTime",(time + _taskTimer)];
		[_task,_grp,_pos,_taskRadius,_wait,_behave,_combat,_speed,_formation,_occupyOption] call UO_FW_AI_fnc_taskAssign;
	};
