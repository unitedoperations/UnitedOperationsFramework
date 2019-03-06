/*    Description: Set the task as active for the group.
 *     Arguments:
 *         GROUP    - Group
 *         OBJECT    - New Task Module
 *     Return Value:
 *         BOOL     - True
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_grp",["_newTask",objNull,[objNull]],["_setTime",0,[0]]];
if (!isNull _newTask) then {
    (_newTask call EFUNC(AI,getTaskParams)) params ["_newTask","_cond","_prior","_time","_onComp","_TaskId","_radius","_task","_occupy","_wait","_behave","_combat","_speed","_form","_stance"];
    if (_time isEqualTo 0) then {
        _setTime = 1E10;
    } else {
        _setTime = _time;
    };
    _grp setVariable["UO_FW_AI_CurrentTaskEndTime",(CBA_MissionTime + _setTime)];
    if (!isNull (_grp getVariable["UO_FW_AI_CurrentTask",objNull])) then {
        [_grp,(_grp getVariable["UO_FW_AI_CurrentTask",objNull])] call EFUNC(AI,taskComplete);
    };
    _grp setVariable["UO_FW_AI_CurrentTask",_newTask];
    _grp call CBA_fnc_clearWaypoints;
    if (!(_stance isEqualTo "unchanged")) then {
        {
            _x setUnitPos _stance;
        } forEach (units _grp);
    };
    private _newBehave = if (_behave isEqualTo "unchanged") then {(behaviour (leader _grp))} else {_behave};
    private _newCombat = if (_combat isEqualTo "unchanged") then {(combatMode _grp)} else {_combat};
    private _newSpeed = if (_speed isEqualTo "unchanged") then {(speedMode _grp)} else {_speed};
    private _newForm = if (_form isEqualTo "unchanged") then {(formation _grp)} else {_form};
    _passarray = [_task,_grp,(getPosATL _newTask),_radius,_wait,_newBehave,_newCombat,_newSpeed,_newForm,_occupy];
    [{!((count waypoints (_this select 1)) isEqualto 0)},{
        _this call EFUNC(AI,taskAssign);
    },_passarray] call CBA_fnc_waitUntilAndExecute;
};
true
