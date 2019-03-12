/*    Description: Return task params from linked task module.
 *     Arguments:
 *         OBJECT        - Task Module
 *     Return Value:
 *        ARRAY         - Task Module Settings
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_logic",["_params",[],[[]]]];
private _cond = _logic getVariable ["UO_FW_AI_taskCondition","true"];
private _onComp = _logic getVariable ["UO_FW_AI_taskOnComplete","true"];
if (_cond isEqualType "STRING") then {_cond = compile _cond;};
if (typename _onComp isEqualTo "STRING") then {_onComp = compile _onComp;};
_params = [
    _logic,
    _cond,
    (GETVAR(_logic,TaskPriority,1)),
    (_logic getVariable ["UO_FW_AI_TaskTime",-1]),
    _onComp,
    (GETVAR(_logic,TaskId,0)),
    (GETVAR(_logic,taskRadius,100)),
    (GETVAR(_logic,taskSet,4)),
    (GETVAR(_logic,occupyOptionSet,0)),
    (GETVAR(_logic,changeWaypointWait,3)),
    (_logic getVariable ["UO_FW_AI_behaviourChange","unchanged"]),
    (_logic getVariable ["UO_FW_AI_combatMode","unchanged"]),
    (_logic getVariable ["UO_FW_AI_speed","unchanged"]),
    (_logic getVariable ["UO_FW_AI_formation","unchanged"]),
    (_logic getVariable ["UO_FW_AI_groupStance","unchanged"])
];
_params
