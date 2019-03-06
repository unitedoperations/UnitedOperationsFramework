/*    Description: Create a group with assigned parameters.
 *     Arguments:
 *         STRING    - Group ID
 *         ARRAY    - Group Settings
 *         ARRAY    - All Unit and Vehicle Settings
 *     Return Value:
 *         BOOL     - True
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

params ["_args",["_initmode",false,[false]]];
_args params ["","_grpSet","_grpMem",["_blds",[],[[]]],["_bldPos",[],[[]]],["_uBld",objNull,[objNull]]];
_grpSet params ["_side","_gpos","_behave","_combat","_speed","_formation","","","","_taskRadius","_wait","_startBld","_task","_taskTimer","","_occupyOption","","","","_tasks",""];
private _spos = _gpos;
_blds = [_spos,_taskRadius,_occupyOption,(count _grpMem)] call EFUNC(AI,getBuildingList);
_blds params [["_bld",[],[[]]],["_bldPos",[],[[]]]];
private _ngrp = createGroup _side;
{
    if !(_bld isEqualto []) then {
        private _setBldPos = [_occupyOption,_foreachIndex,_bld,_bldPos] call EFUNC(AI,setBuildingPos);
        _setBldPos params [["_hpos",[],[[]]]];
        _spos = _hpos;
    };
    private _u = [true,_ngrp,_spos,_startBld,_foreachIndex,_x,_taskRadius] call EFUNC(AI,createUnit);
    if ((count (units _ngrp)) isEqualTo 1) then { _gpos = _spos; };
    _u enableAI "Path";
    if (_task isEqualTo 2 || _task isEqualTo 4 || _task isEqualTo 5) then {
        _u setvariable["UO_FW_AI_Occupy",true];
        [_u,_uBld,_bldPos,_wait,[_behave,_combat,_speed,_formation]] spawn UO_FW_AI_fnc_taskBuildingPatrol;
    };
    if !(_initmode) then {
        sleep 0.25;
    };
} foreach _grpMem;
[_ngrp,_gpos,_grpSet] call EFUNC(AI,setGroupVariables);
if !(_tasks isEqualTo []) then {
    [_ngrp,_tasks] call EFUNC(AI,taskRegister);
    _tasks = _tasks call EFUNC(AI,taskRemoveZoneActivated);
};
if !(_tasks isEqualTo []) then {UO_FW_AI_taskedGroups pushBack [_ngrp];};
if (!(_tasks isEqualTo []) && {_taskTimer isEqualTo 0}) then {
    [_ngrp,_tasks] call EFUNC(AI,taskInit);
} else {
    if (_task isEqualTo 0 || _task isEqualTo 1 || _task isEqualTo 3) then {
        {_x setvariable["UO_FW_AI_Occupy",true]} forEach (units _ngrp);
        _ngrp setVariable["UO_FW_AI_CurrentTaskEndTime",(CBA_MissionTime + _taskTimer)];
        private _passarray = [_task,_ngrp,_spos,_taskRadius,_wait,_behave,_combat,_speed,_formation];
        [{!((count waypoints (_this select 1)) isEqualto 0)},{
            _this call EFUNC(AI,taskAssign);
        },_passarray] call CBA_fnc_waitUntilAndExecute;
    };
};
if (_blds isEqualTo []) then {
    LOG_2("Group %1 was unable to detect an enterable buildings. The group is located at %2. Increase Task Radius or move group closer to more buildings.",_ngrp,_spos);
};
true
