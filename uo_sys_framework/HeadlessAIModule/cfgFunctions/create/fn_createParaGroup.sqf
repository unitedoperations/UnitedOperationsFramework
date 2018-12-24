/*	Description: Create units for para drop spawn.
 * 	Arguments:
 * 		ARRAY	- Units and Unit Settings
 * 		ARRAY	- Group Vehicles and Group Vehicle Settings
 * 	Return Value:
 * 		BOOL 	- True
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC)

params ["_grpid","_grpSet","_grpMem",["_sqdv",[],[[]]],["_currentVeh",[],[[]]]];
	_grpSet params ["_side","_gpos","_behave","_combat","_speed","_formation","_grpStance","_grpInit","_createRadius","_taskRadius","_wait","_startBld","_task","_taskTimer","_multi","_occupyOption","_vehAssigned","_waypoints","_onWater","_tasks","_fl","_pe","_ph","_pd","_pc","_psc","_psd","_ps","_pr"];
	private _dloc = (_gpos vectorAdd [0,0,_ph]);
	private _upc = ceil(_pc/_psc);
	private _col = ceil((count _grpMem)/_upc);
	private _tw = _col*_psd;
	private _sp = ([[-floor(_col*0.5*_psd),0,0],_pd] call BIS_fnc_rotateVector2D) vectorAdd _dloc;
	private _cCol = 0;
	private _nCol = [[_psd,0,0],_pd] call BIS_fnc_rotateVector2D;
	private _cRow = 0;
	private _nRow = [[0,_psd,0], _pd] call BIS_fnc_rotateVector2D;
	private _ngrp = createGroup _side;
	for [{_i=0},{(_i < (count _grpMem))},{_i = _i + 1}] do {
		if(((_grpMem select _i) select 0)) then {
			(_grpMem select _i) params ["_uv","_uc","_pos","_offset","_vcd","_vcu","_dmg","_g","_veh","_vr","_veha","_cuf","_wtr","_per","_ust","_rem","_uint","_name"];
			private _u = _ngrp createUnit [_uc,_dloc,[],0,"NONE"];
			[_u] join _ngrp;
			_u setUnitLoadout [_g, true];
			[_u] call UO_FW_AI_fnc_backpackSave;
			removeBackpackGlobal _u;
			_u addBackpackGlobal "B_Parachute";
			_u setFormDir _pd;
			_u setDir _pd;
			_u setPosATL (_sp vectorAdd (_nCol vectorMultiply _cCol) vectorAdd (_nRow vectorMultiply _cRow));
			_u spawn {
				params["_u"];
				waitUntil {sleep 5; ((getPos _u) select 2) < 1; };
				[_u] spawn UO_FW_AI_fnc_backpackLoad;
			};
			_cRow = _cRow + 1;
			if(_cRow > _upc) then {
				_cRow = 0;
				_cCol = _cCol + 1;
			};
			_u setDamage _dmg;
			if(_per) then {
				_u setVariable["persistent",true,true];
			};
			if(count _name > 1) then {
				_u setVariable["IdentityName",true,true];
				missionNamespace setVariable[_name, _u];
			};
			[_u,_grpStance,_ust] call UO_FW_AI_fnc_setStance;
			[_u,_rem] call UO_FW_AI_fnc_removeKit;
			_u spawn _uint;
			if(_veha) then {
				[_u,_vr,(_currentVeh select 0)] call UO_FW_AI_fnc_setAssignedVehicle;
			};
		} else {
			(_grpMem select _i) params ["_uv","_uc","_vpos","_vcd","_vcu","_dmg","_f","_a","_vlc","_vw","_vi"];
			private _vpos = _dloc vectorAdd [0,(25*(_i+1)),0];
			private _v = createVehicle [_uc, _vpos,[],0,"NONE"];
			_v setDir _pd;
			_v setDamage _dmg;
			_v setFuel _f;
			_v lock _vlc;
			_v spawn (compile _vi);
			{
				_x params [["_class","",[""]],["_path",[],[[]]],["_ammo",0,[0]]];
				_v setMagazineTurretAmmo [_class,_ammo,_path];
			} forEach _a;
			_v lock _vlc;
			[_v,_pr,_ps] call UO_FW_AI_fnc_paraVehicle;
			_sqdv pushBack _v;
			_currentVeh set[0,_v];
		};
		sleep 0.25;
	};
	[_ngrp,_gpos,_grpSet] call UO_FW_AI_fnc_setGroupVariables;
	_ngrp call UO_FW_AI_fnc_taskReset;
	if(count _tasks > 0) then {
		[_ngrp,_tasks] call UO_FW_AI_fnc_taskRegister;
		_tasks = _tasks call UO_FW_AI_fnc_taskRemoveZoneActivated;
	};
	if(count _tasks > 0) then {UO_FW_AI_taskedGroups pushBack [_ngrp];};
	if(count _tasks > 0) then {
		[_ngrp,_tasks] call UO_FW_AI_fnc_taskRegister;
		_tasks = _tasks call UO_FW_AI_fnc_taskRemoveZoneActivated;
	};
	if(count _waypoints > 2) then {
		[_ngrp,_waypoints] call UO_FW_AI_fnc_createWaypoints;
	} else {
		if(count _tasks > 0 && _taskTimer isEqualTo 0) then {
			[_ngrp,_tasks] call UO_FW_AI_fnc_taskInit;
		} else {
			_ngrp setVariable["UO_FW_CurrentTaskEndTime",(time + _taskTimer)];
			[_task,_ngrp,_gpos,_taskRadius,_wait,_behave,_combat,_speed,_formation] call UO_FW_AI_fnc_taskAssign;
		};
	};
	true
