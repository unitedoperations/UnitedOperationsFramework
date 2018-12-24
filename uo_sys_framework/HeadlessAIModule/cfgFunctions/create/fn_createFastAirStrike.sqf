/*	Description: Performs the para drop of object.
 *	Arguments:
 *		ANY		- OBJECT, MARKER, LOCATION, GROUP, POSITION to determine strike location
 *	Optional:
 *		NUMBER	- Amount of Ordance
 *		NUMBER	- Amount of Bombers
 *		NUMBER	- Drop and Fly in Height
 *		STRING	- Classname of Bomber
 *		STRING	- Classname of Bomb
 *		ANY		- OBJECT, MARKER, LOCATION, GROUP, POSITION to determine start/spawn location, closest edge of map if empty array
 *	Return Value:
 *		TRUE
 * ["bomb"] spawn UO_FW_AI_fnc_createFastAirStrike;
 * ["bomb",3,2,200,"rhsusf_f22","Bo_GBU12_LGB_MI10","start"] spawn UO_FW_AI_fnc_createFastAirStrike;
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC)

	params ["_logic",["_spos",[0,0,0],[[]]],["_bombers",[],[[]]],"_j"];
	_amtO = _logic getVariable ['UO_FW_fasOrdinance',3];
	_amtB = _logic getVariable ['aeFASAircraft',2];
	_fh = _logic getVariable ['UO_FW_fasHeight',200];
	_btype = _logic getVariable ['aeFASAircraftType',"rhsusf_f22"];
	_ord = _logic getVariable ['UO_FW_fasOrdnanceType',"Bo_Air_LGB"];
	_radius = _logic getVariable ['UO_FW_fasRadius',0];
	_entities = _logic getVariable ["aeBombers",[]];
	_entities params [["_grps",[],[[]]],["_emptyvehs",[],[[]]],["_objs",[],[[]]]];
	_spos = _spos vectorAdd [0,0,_fh*3];
	_dpos = (getPosATL _logic);
	if(_radius > 0) then {
		_dpos = (([_dpos,0,_radius,1] call UO_FW_AI_fnc_getRandomPositionCircle) select 0);
	};
	private _dir = _spos getDir _dpos;
	private _epos = _dpos getPos [((_amtO*70) max 350), _dir];
	_epos = _epos vectorAdd [0,0,_fh];
	_dpos = _dpos vectorAdd [0,0,_fh];
	for [{_j=0},{(_j < (count _grps))},{_j = _j + 1}] do {
		_ngrp = _grps select _j;
		{
			if(!(_x select 0)) then {
				(_x) set [2,_spos];
				(_x) set [13,true];
			};
		} forEach (_ngrp select 2);
		_grp = _ngrp call UO_FW_AI_fnc_createGroup;
		private _bombers = (units _grp) select {(_x != vehicle _x)} apply {vehicle _x};
		_bombers = _bombers arrayIntersect _bombers;
		{
			_x setDir _dir;
			_x flyInHeight _fh;
			[_x,_dpos,_amtO,_ord] spawn {
				params ["_b","_dpos","_amtO","_ord","_i"];
				waitUntil{sleep 0.2; ((_b distance _dpos) < 300 || !alive _b);};
				for [{_i=0},{(_i < _amtO && alive _b)},{_i = _i + 1}] do {
					private _bomb = _ord createVehicle [((getposATL _b) select 0),((getposATL _b) select 1),(((getposATL _b) select 2)-50)];
					_bomb setDir (direction _b);
					_bomb setVelocity (((velocity _b) vectorMultiply 0.5) vectorAdd [0,0,-200]);
					sleep 0.3;
				};
			};
		} forEach _bombers;
		[_grp,_dpos,0,0,"CARELESS","RED","FULL"] call UO_FW_AI_fnc_createWaypoint;
		[_grp,_epos,0,0,"CARELESS","RED","FULL"] call UO_FW_AI_fnc_createWaypoint;
		[_grp,_spos,0,0,"CARELESS","RED","FULL","WEDGE","MOVE","{deleteVehicle (vehicle _x); deleteVehicle _x;} forEach thisList;",500] call UO_FW_AI_fnc_createWaypoint;
		sleep 2;

		//private _b = createVehicle [_btype, _spos, [], 0, "FLY"];
		//createVehicleCrew _b;
		//_crew = (crew _b);
		//_b setVelocity [((velocity _b) select 0) + (sin _dir * 120),((velocity _b) select 1) + (cos _dir * 120),((velocity _b) select 2)];
		//_grp = (group (driver _b));
		//_bombers pushBack _b;
	};
	true
