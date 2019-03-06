/*    Description: Create a group with assigned parameters.
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

params ["_args",["_initmode",false,[false]]];
_args params ["","_grpSet","_grpMem",["_currentVeh",objNull,[objNull]]];
_grpSet params ["_side","_gpos","_behave","_combat","_speed","_formation","","","","_taskRadius","_wait","_startBld","_task","_taskTimer","","_occupyOption","","_waypoints","","_tasks",""];
private _ngrp = createGroup _side;
{
    if ((_x select 0)) then {
        private _u = [false,_ngrp,_gpos,_startBld,_foreachIndex,_x,_taskRadius,_currentVeh,_initmode] call EFUNC(AI,createUnit);
    } else {
        private _vpos = (_x select 2);
        private _v = [_vpos,_x,_side,_initmode] call EFUNC(AI,createVehicle);
        _currentVeh = _v;
    };
    if !(_initmode) then {
        sleep 0.25;
    };
} foreach _grpMem;
[_ngrp,_gpos,_grpSet] call EFUNC(AI,setGroupVariables);
_ngrp call CBA_fnc_clearWaypoints;
if !(_tasks isEqualTo []) then {
    [_ngrp,_tasks] call EFUNC(AI,taskRegister);
    _tasks = _tasks call EFUNC(AI,taskRemoveZoneActivated);
};
if !(_tasks isEqualTo []) then {UO_FW_AI_taskedGroups pushBack [_ngrp];};
if (count _waypoints > 2) then {
    [_ngrp,_waypoints] call EFUNC(AI,createWaypoints);
} else {
    if (!(_tasks isEqualTo []) && {(_ngrp getVariable ['UO_FW_AI_TaskTimer',0]) isEqualTo 0}) then {
        [_ngrp,_tasks] call EFUNC(AI,taskInit);
    } else {
        _ngrp setVariable["UO_FW_AI_CurrentTaskEndTime",(CBA_MissionTime + _taskTimer)];
        private _passarray = [_task,_ngrp,_gpos,_taskRadius,_wait,_behave,_combat,_speed,_formation,_occupyOption];
        [{!((count waypoints (_this select 1)) isEqualto 0)},{
            _this call EFUNC(AI,taskAssign);
        },_passarray] call CBA_fnc_waitUntilAndExecute;
    };
};
_ngrp
