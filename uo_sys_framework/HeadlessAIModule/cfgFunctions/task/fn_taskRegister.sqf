/*    Description: Populates the zone with all linked units, vehicles and objects.
*     Arguments:
*         ARRAY    - Entities
*         NUMBER    - Spawn Delay
*     Return Value:
*         BOOL     - True
*    Author
*        suits & PiZZADOX
*/

#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params [["_grp",grpNull,[grpNull]],["_tasks",[],[[]]],["_visited",[],[[]]]];
_unvisited = + _tasks;
while {count _unvisited > 0 } do {
    private _taskModule = _unvisited select 0;
    _unvisited deleteAt 0;
    _visited pushback _taskModule;
    private _taskGroups = _taskModule getVariable ["UO_FW_AI_taskGroups", []];
    _taskGroups pushBack _grp;
    _taskModule setVariable ["UO_FW_AI_taskGroups", _taskGroups];
    _unvisited = _unvisited + (([_taskModule ,["UO_FW_AI_TaskModule"]] call EFUNC(AI,getSyncedModules)) - _visited);
};
true
