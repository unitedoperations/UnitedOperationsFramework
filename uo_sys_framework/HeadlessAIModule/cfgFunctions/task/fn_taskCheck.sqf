/*    Description: Check available task condition and priority.
 *     Arguments:
 *        GROUP            - Group Task Belongs To
 *         GROUP/OBJECT    - Group or Object to Check
 *     Return Value:
 *         OBJECT     - Next Task
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_grp","_check",["_init",false,[false]],["_syncedTasks",[],[[]]],["_task",objNull,[objNull]],["_taskCheck",[],[[]]],["_taskOrder",[],[[]]]];
if (_grp getVariable "UO_FW_AI_CurrentTaskEndTime" < time || _init) then {
    if ( !isNull (_grp getVariable["UO_FW_AI_CurrentTask",objNull]) ) then {[_grp,_check] call UO_FW_AI_fnc_setCompletedTasks;};
    private _groupTaskOrder = _grp getVariable ["UO_FW_AI_groupTaskOrder",[]];
    if (count _groupTaskOrder > 1) then {_taskOrder = _groupTaskOrder select 1;};
    if (count _taskOrder > 0) then {
        private _tasks = _taskOrder select {!(_x in (_grp getVariable["UO_FW_AI_CompletedTasks",[]]))};
        if (count _tasks > 0) then {
            _tasks sort (_groupTaskOrder select 0);
            _task = (_tasks select 0 select 2);
            _taskCheck = [_task];
        } else {
            private _sort = if (_groupTaskOrder select 0) then {false} else {true};
            _taskOrder sort _sort;
            _grp setVariable["UO_FW_AI_CompletedTasks",[]];
            [_grp,(_taskOrder select 0 select 2)] call UO_FW_AI_fnc_setCompletedTasks;
            private _tasks = _taskOrder select {!(_x in (_grp getVariable["UO_FW_AI_CompletedTasks",[]]))};
            if (count _tasks > 0) then {
                _task = (_tasks select 0 select 2);
                _taskCheck = [_task];
                _grp setVariable ["UO_FW_AI_groupTaskOrder",[_sort,_taskOrder]];
            } else {
                _taskCheck = [(_grp getVariable["UO_FW_AI_CurrentTask",objNull])];
            };
        };
    } else {
        if (_init) then {
            private _grpSet = [_grp] call UO_FW_AI_fnc_getGroupVariables;
            _syncedTasks = (_grpSet select 11);
        } else {
            if ((typeName _check) isEqualTo "GROUP") then {
                _syncedTasks = [(leader _check),["UO_FW_AI_TaskModule"]] call UO_FW_AI_fnc_getSyncedModules;
            } else {
                _syncedTasks = [_check,["UO_FW_AI_TaskModule"]] call UO_FW_AI_fnc_getSyncedModules;
            };
        };
        private _tasks = _syncedTasks select {!(_x in (_grp getVariable["UO_FW_AI_CompletedTasks",[]]))};
        if (_tasks isEqualTo []) then {
            private _index = UO_FW_AI_taskedGroups find [_grp];
            UO_FW_AI_taskedGroups deleteAt _index;
        } else {
            private _activeTasks = [];
            for "_i" from 0 to ((count _tasks)-1) do {
                private _checkTask = (_tasks select _i);
                private _taskSet = _checkTask call UO_FW_AI_fnc_getTaskParams;
                _taskSet params ["_task","_cond","_prior","_time","_onComp","_taskId"];
                if (call _cond) then {
                    _activeTasks pushback [_taskId,_prior,_task];
                };
            };
            if (!(_activeTasks isEqualTo [])) then {
                _activeTasks sort true;
                _task = (_activeTasks select 0 select 2);
            };
            _taskCheck = [_task];
        };
    };
} else { _taskCheck = [objNull]; };
_taskCheck
