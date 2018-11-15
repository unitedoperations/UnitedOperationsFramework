/*	Description: Assign a task from a task module to a group.
 * 	Arguments:
 * 		NIL
 * 	Return Value:
 * 		BOOL 	- True
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
	{							
		_x params ["_grp"];
		if({alive _x} count (units _grp) > 0 && _grp getVariable["UO_FW_isNotZoneActivated",true]) then {
			if(isNull (_grp getVariable["aeCurrentTask",objNull])) then {
				private _taskCheck = [_grp,_grp,true] call UO_AI_fnc_taskCheck;
				_taskCheck params [["_task",objNull,[objNull]]];
				if(!isNull _task) then {
					[_grp,_task] call UO_AI_fnc_taskSet;
				};									
			} else {
				private _taskCheck = [_grp,(_grp getVariable["aeCurrentTask",objNull])] call UO_AI_fnc_taskCheck;
				_taskCheck params [["_task",objNull,[objNull]]];
				if(_grp getVariable "aeCurrentTaskEndTime" < time && !isNull _task) then {						
					[_grp,_task] call UO_AI_fnc_taskSet;
				};
			};		
		} else {
			_index = UO_FW_taskedGroups find [_grp];
			UO_FW_taskedGroups deleteAt _index;
		};
	} forEach UO_FW_taskedGroups;
	true