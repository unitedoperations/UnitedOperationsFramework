/*	Description: Performs the para drop of object.
 *	Arguments: 
 *		ARRAY	- Airstrike Location
 *		ARRAY 	- Aircraft Start Location
 *		STRING	- Ordance/Bomb Classname
 *		NUMBER	- Wait Time from Call to Strike
 *		NUMBER	- Amount of Aircraft
 *		STRING	- Aircraft Classname
 *		NUMBER	- Bomb Release Height
 *	Return Value:
 *		TRUE
 */
if(!UO_FW_var_isHCorServer) exitWith {};
	params [
		["_dpos",[0,0,0],[[]]],
		["_spos",[0,0,0],[[]]],
		["_ordnance","Bo_GBU12_LGB_MI10",[""]],
		["_wait",30,[0]],
		["_count",1,[0]],
		["_aircraftType","B_Plane_CAS_01_F",[""]],
		["_dropHeight",100,[0]],
		["_grp",grpNull,[grpNull]]
	];
	private _dir = _spos getDir _dpos;
	private _epos = ((_dpos getPos [250, _dir]) vectorAdd [0,0,_dropHeight*3]);
	sleep _wait;
	for [{_j=0},{_j < _count},{_j = _j + 1}] do {
		if(_j > 1) then { _spos vectorAdd [50,50,50]};
		private _aircraft = createVehicle [_aircraftType, _spos, [], 0, "FLY"];
		_aircraft setPosATL _spos;
		_aircraft setDir _dir;
		createVehicleCrew _aircraft;
		_aircraft setVelocity [((velocity _aircraft) select 0) + (sin _dir * 200),((velocity _aircraft) select 1) + (cos _dir * 200),((velocity _aircraft) select 2)];  
		_aircraft flyInHeight _dropHeight;		
		if (isNull _grp) then {
			_grp = (group (driver _aircraft));
		} else {
			[_aircraft] join _grp;
		};
		if(_j == 0) then {
			[_grp,_dpos,0,0,"CARELESS","RED","NORMAL"] call UO_AI_fnc_createWaypoint;
			[_grp,_epos,0,0,"CARELESS","RED","FULL","WEDGE","MOVE","{_x FlyInHeight 500;} forEach thisList;",100] call UO_AI_fnc_createWaypoint;   
			[_grp,_spos,0,0,"CARELESS","RED","FULL","WEDGE","MOVE","{deleteVehicle (vehicle _x); deleteVehicle _x;} forEach thisList;",300] call UO_AI_fnc_createWaypoint;
		};
		[_aircraft,_dpos,_ordnance] spawn {
			params[
				["_aircraft",objNull,[objNull]],
				["_dpos",[0,0,0],[[]]],
				["_ordnance","Bo_GBU12_LGB_MI10",[""]]
			];
			private _rDist = if (_ordnance == "Bo_GBU12_LGB_MI10") then {600} else {400};
			waitUntil{sleep 0.2; ((_aircraft distance _dpos) < _rDist || !alive _aircraft);};    
			for [{_i=0},{(_i < 3 && alive _aircraft)},{_i = _i + 1}] do {
				private _item = createVehicle [_ordnance, (((vectorDir _aircraft) vectorMultiply -50) vectorAdd (getPosATL _aircraft)), [], 0, "FLY"];
				_item setDir (direction _aircraft);
				_item setVelocity [((velocity _aircraft) select 0) + (sin (direction _aircraft) * 20),((velocity _aircraft) select 1) + (cos (direction _aircraft) * 20),-100];
				sleep 0.2;
			};
		};
		sleep 1;
	};
	true