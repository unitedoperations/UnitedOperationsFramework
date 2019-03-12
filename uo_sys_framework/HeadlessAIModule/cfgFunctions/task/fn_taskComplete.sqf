/*    Description: Execute task on complete code.
 *     Arguments:
 *         GROUP    - Group
 *         OBJECT    - Task Module Completed
 *     Return Value:
 *         BOOL     - True
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_grp",["_task",objNull,[objNull]]];
private _taskSet = _task call EFUNC(AI,getTaskParams);
_taskSet params ["_task","_cond","_prior","_time","_onComp"];
[_grp,_task] call _onComp;
[_grp,_task] call EFUNC(AI,setCompletedTasks);
true
