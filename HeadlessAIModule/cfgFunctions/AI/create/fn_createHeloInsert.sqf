/*	Description: Performs a helicopter insertion of units.
 *	Arguments:
 *		NUMBER	- Amount of helicopters to perform insertion
 *		ARRAY	- Insertion Positions can be an ARRAY of OBJECTS, MARKERS, LOCATIONS, GROUPS, POSITIONS to determine drop location
 *	Optional:
 *		ARRAY	- Group/s to insert
 *		NUMBER	- Initial Flight Height
 *		STRING 	- Classname of helicopter to perform insertion
 *		ANY		- OBJECT, MARKER, LOCATION, GROUP, POSITION to determine start/spawn location, closest edge of map if empty array 
 *	Return Value:
 *		TRUE
 * ["drop",[groups],height,helitype,"start"] spawn UO_AI_fnc_createHeloInsert;
 * [3,"drop","ASOR_Ammo_Inf_Air",120,"start",true,true,"asor_opfor_pla_mi8_cargo"] spawn UO_AI_fnc_createAirResupply;
 * [3,"drop","bma3_bushmaster_pws127mm_F",120,"start",false,false] spawn UO_AI_fnc_createAirResupply;
 * [HELI_NAME] call AR_Rappel_All_Cargo
 */
if(!UO_FW_var_isHCorServer) exitWith {};
	params ["_logic",["_radius",200,[0]],["_gx",1,[0]],["_fh",200,[0]],"_j"];	
	private _spos = (_logic getVariable ["startPos",[0,0,0]]) vectorAdd [0,0,(_fh*2)];
	private _positions = _logic getVariable ["dropPos",[[0,0,0]]];
	private _grps = _logic getVariable "aeHIUnits";
	for [{_j=0},{(_j < (count _grps))},{_j = _j + 1}] do {	
		if(_j > 0) then { 
		   _spos = _spos vectorAdd [_j*-100,_j*-100,0]; 
		};
		private _dpos = _positions select (_j % (count _positions));
		_dpos = [_dpos select 0,_dpos select 1,0];
		[_logic,(_grps select _j),_spos,_dpos] spawn {
			params["_logic","_group","_spos","_dpos"];
			private _grp = _group call UO_AI_fnc_createGroup;
			private _h = (driver (vehicle (leader _grp)));
			if((driver _h) isEqualTo (leader _grp) ) then {
				_h setPosATL _spos;
				_h setDir (_spos getDir _dpos);					
				//_h setVelocity [((velocity _h) select 0) + (sin (_spos getDir _dpos) * 50),((velocity _h) select 1) + (cos (_spos getDir _dpos) * 50),((velocity _h) select 2)];
				_h flyInHeight _fh;				
				if((_logic getVariable 'aeHIInsertType') isEqualTo 1) then {
					private _helipad = "Land_HelipadEmpty_F" createVehicle _dpos;
					[_grp,_dpos,0,0,"CARELESS","RED","NORMAL","COLUMN","TR UNLOAD","this land 'LAND';"] call UO_AI_fnc_createWaypoint;
				} else {
					[_grp,_dpos,0,0,"CARELESS","RED","NORMAL","COLUMN","TR UNLOAD","ADD RAPPEL SCRIPT"] call UO_AI_fnc_createWaypoint;
				};
				[_grp,_spos,0,0,"CARELESS","RED","FULL","WEDGE","MOVE","{deleteVehicle (vehicle _x); deleteVehicle _x;} forEach thisList;",100] call UO_AI_fnc_createWaypoint;
				waitUntil{sleep 0.2; ((_h distance _dpos) < 2000 || !alive _h);}; 
				private _speed = speed _h;
				private _hIncr = _fh*0.5;
				private _sIncr = _speed*0.1;
				private _nfh = +_fh;
				if(alive _h) then {
					_nfh = ((_nfh - _hIncr) max 100);
					_h flyInHeight _nfh;
					_speed = _speed - _sIncr;
					_h limitSpeed  100;
					hint format["2000 | %1 | %2 | %3",_speed,speed _h,_nfh];
					waitUntil{sleep 0.2; ((_h distance _dpos) < 1500 || !alive _h);};
					hint format["1500 | %1 | %2 | %3",_speed,speed _h,_nfh];
				};/*
				if(alive _h) then {
					_nfh = ((_nfh - _hIncr) max 100);
					_h flyInHeight _nfh;
					_speed = _speed - _sIncr;
					_h limitSpeed  _speed;
					hint format["%1 | %2 | %3",_speed,speed _h,_nfh];
					waitUntil{sleep 0.2; ((_h distance _dpos) < 1250 || !alive _h);};
				};*/
				if(alive _h) then {
					_nfh = ((_nfh - _hIncr) max 100);
					_h flyInHeight _nfh;
					_speed = _speed - _sIncr;
					_h limitSpeed  _speed;
					hint format["%1 | %2 | %3",_speed,speed _h,_nfh];
					waitUntil{sleep 0.2; ((_h distance _dpos) < 1000 || !alive _h);};
				};		/*	
				if(alive _h) then {				
					_nfh = ((_nfh - _hIncr) max 70);
					_h flyInHeight _nfh;
					_speed = _speed - _sIncr;
					_h limitSpeed  _speed;
					hint format["%1 | %2 | %3",_speed,speed _h,_nfh];
					waitUntil{sleep 0.2; ((_h distance _dpos) < 750 || !alive _h);};
				};*/
				if(alive _h) then {
					_nfh = ((_nfh - _hIncr) max 70);
					_h flyInHeight _nfh;
					_speed = _speed - _sIncr;
					_h limitSpeed  _speed;
					hint format["%1 | %2 | %3",_speed,speed _h,_nfh];
					waitUntil{sleep 0.2; ((_h distance _dpos) < 500 || !alive _h);};
				};/*
				if(alive _h) then {	
					_nfh = ((_nfh - _hIncr) max 50);
					_h flyInHeight _nfh;
					_speed = _speed - _sIncr;
					_h limitSpeed  50;	
					waitUntil{sleep 0.2; ((_h distance _dpos) < 250 || !alive _h);};
				};*/			
				if(alive _h) then {				
					_h flyInHeight _fh;
					_speed = _speed - _sIncr;
					_h limitSpeed  200;
					hint format["250 | %1 | %2 | %3",_speed,speed _h,_nfh];
					_h land "LAND";
				};
			};
		};
	};
	true