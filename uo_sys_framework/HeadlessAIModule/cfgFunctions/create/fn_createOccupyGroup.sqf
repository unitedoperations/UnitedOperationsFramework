/*	Description: Create a group with assigned parameters.
 * 	Arguments:
 * 		STRING	- Group ID
 * 		ARRAY	- Group Settings
 * 		ARRAY	- All Unit and Vehicle Settings
 * 	Return Value:
 * 		BOOL 	- True
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC)

params ["_grpid","_grpSet","_grpMem",["_blds",[],[[]]],["_bldPos",[],[[]]],["_uBld",objNull,[objNull]]];
	_grpSet params["_side","_gpos","_behave","_combat","_speed","_formation","_grpStance","_grpInit","_createRadius","_taskRadius","_wait","_startBld","_task","_taskTimer","_multi","_occupyOption","_vehAssigned","_waypoints","_onWater","_tasks","_fl"];
	private _spos = _gpos;
	_blds = [_spos,_taskRadius,_occupyOption,(count _grpMem)] call UO_FW_AI_fnc_getBuildingList;
	_blds params [["_bld",[],[[]]],["_bldPos",[],[[]]]];
	private _ngrp = createGroup _side;
	for [{_i=0},{(_i < (count _grpMem))},{_i = _i + 1}] do {
		if(count _bld > 0) then {
			_setBldPos = [_occupyOption,_i,_bld,_bldPos] call UO_FW_AI_fnc_setBuildingPos;
			_setBldPos params [["_hpos",[],[[]]],["_uBld",objNull,[objNull]]];
			_spos = _hpos;
		};
		private _u = [true,_ngrp,_spos,_startBld,_i,(_grpMem select _i),_taskRadius] call UO_FW_AI_fnc_createUnit;
		if((count (units _ngrp)) isEqualTo 1) then { _gpos = _spos; };
		_u enableAI "PATH";
		if(_task isEqualTo 2 || _task isEqualTo 4 || _task isEqualTo 5) then {
			_u setvariable["UO_FW_AI_Occupy",true];
			[_u,_uBld,_bldPos,_wait,[_behave,_combat,_speed,_formation]] spawn UO_FW_AI_fnc_taskBuildingPatrol;
		};
		sleep 0.25;
	};
	[_ngrp,_gpos,_grpSet] call UO_FW_AI_fnc_setGroupVariables;
	if(count _tasks > 0) then {
		[_ngrp,_tasks] call UO_FW_AI_fnc_taskRegister;
		_tasks = _tasks call UO_FW_AI_fnc_taskRemoveZoneActivated;
	};
	if(count _tasks > 0) then {UO_FW_AI_taskedGroups pushBack [_ngrp];};
	if(count _tasks > 0 && _taskTimer isEqualTo 0) then {
		[_ngrp,_tasks] call UO_FW_AI_fnc_taskInit;
	} else {
		if(_task isEqualTo 0 || _task isEqualTo 1 || _task isEqualTo 3) then {
			{_x setvariable["UO_FW_AI_Occupy",true]} forEach (units _ngrp);
			_ngrp setVariable["UO_FW_AI_CurrentTaskEndTime",(time + _taskTimer)];
			_passarray = [_task,_ngrp,_spos,_taskRadius,_wait,_behave,_combat,_speed,_formation];
			[{!((count waypoints (_this select 1)) isEqualto 0)},{
				_this call UO_FW_AI_fnc_taskAssign;
			},_passarray] call CBA_fnc_waitUntilAndExecute;
		};
	};
	if(UO_FW_AI_DEBUG && _blds isEqualTo []) then {
		(format["Group %1 was unable to detect an enterable buildings. The group is located at %2. Increase Task Radius or move group closer to more buildings.",_ngrp,_spos]) call UO_FW_fnc_DebugMessage;
	};
	true
