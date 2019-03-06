/*    Description: Assign a task from a task module to a group.
 *     Arguments:
 *         NIL
 *     Return Value:
 *         BOOL     - True
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

{
    _x params ["_grp"];
    if ({alive _x} count (units _grp) > 0 && _grp getVariable["UO_FW_AI_isNotZoneActivated",true]) then {
        if (isNull (_grp getVariable["UO_FW_AI_CurrentTask",objNull])) then {
            private _taskCheck = [_grp,_grp,true] call EFUNC(AI,taskCheck);
            _taskCheck params [["_task",objNull,[objNull]]];
            if (!isNull _task) then {
                [_grp,_task] call EFUNC(AI,taskSet);
            };
        } else {
            private _taskCheck = [_grp,(_grp getVariable["UO_FW_AI_CurrentTask",objNull])] call EFUNC(AI,taskCheck);
            _taskCheck params [["_task",objNull,[objNull]]];
            if (GETVAR(_grp,CurrentTaskEndTime,0) < CBA_MissionTime && !isNull _task) then {
                [_grp,_task] call EFUNC(AI,taskSet);
            };
        };
    } else {
        _index = UO_FW_AI_taskedGroups find [_grp];
        UO_FW_AI_taskedGroups deleteAt _index;
    };
} forEach UO_FW_AI_taskedGroups;
true
