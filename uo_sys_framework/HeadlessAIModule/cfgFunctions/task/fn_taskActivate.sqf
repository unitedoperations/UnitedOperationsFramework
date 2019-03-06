/*    Description: Activate the task when the zone is activated.
 *     Arguments:
 *         ARRAY    - Units and Unit Settings
 *         ARRAY    - Group Vehicles and Group Vehicle Settings
 *     Return Value:
 *         GROUP     - Created Group
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
 UO_FW_AI_EXEC_CHECK(SERVERHC);
{
    private _task = _x;
    {
        private _grp = _x;
        _grp setVariable["UO_FW_AI_isNotZoneActivated",false];
        _grp setVariable["UO_FW_AI_CurrentTaskEndTime",CBA_missionTime - 1];
        [_grp,_task] call EFUNC(AI,taskSet);
    } forEach (_task getVariable ["UO_FW_AI_taskGroups", []]);
} forEach _this;
true
