/*	Description: Performs a para drop of object.
 *	Arguments:
 *		NUMBER	- Amount of Items to Drop
 *		ANY		- OBJECT, MARKER, LOCATION, GROUP, POSITION to determine drop location
 *	Optional:
 *		STRING	- Classname of Resupply Item to Drop
 *		NUMBER	- Drop and Flight Height
 *		BOOL	- Deply smoke on item reaching ground
 *		STRING 	- Classname of aircraft to perform drop
 *		BOOL	- Fighter Escort into drop area
 *		STRING 	- Classname of fighter to perform escort
 *		ANY		- OBJECT, MARKER, LOCATION, GROUP, POSITION to determine start/spawn location, closest edge of map if empty array
 *	Return Value:
 *		TRUE
 * [3,"drop"] spawn UO_FW_AI_fnc_createAirResupply;
 * [3,"drop","bma3_bushmaster_pws127mm_F",120,false,false,"start"] spawn UO_FW_AI_fnc_createAirDrop;
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)



	params ["_logic",["_radius",300,[0]],["_amount",3,[0]],["_ord","Box_NATO_Ammo_F",[""]],["_fh",120,[0]],["_ps",true,[true]],["_btype","RHS_C130J",[""]],["_escort",true,[true]],["_ftype","rhsusf_f22",[""]],["_spos",[],[[]]],["_grp",grpNull,[grpNull]],"j","f"];
	_spos = _spos vectorAdd [0,0,_fh*3];
	for [{_j=0},{(_j < _amtB)},{_j = _j + 1}] do {
		if(_radius > 0) then {
			_dpos = (([_dpos,0,_radius,1] call UO_FW_AI_fnc_getRandomPositionCircle) select 0);
		};
		private _dir = _spos getDir _dpos;
		private _epos = _dpos getPos [((_amtO*70) max 350), _dir];
		_epos = _epos vectorAdd [0,0,_fh];
		_dpos = _dpos vectorAdd [0,0,_fh];
		private _b = createVehicle [_btype, _spos, [], 0, "FLY"];
		_b setDir _dir;
		createVehicleCrew _b;
		_crew = (crew _b);
		_b setVelocity [((velocity _b) select 0) + (sin _dir * 120),((velocity _b) select 1) + (cos _dir * 120),((velocity _b) select 2)];
		_b flyInHeight _fh;
		if(_j isEqualTo 0) then {
			_grp = (group (driver _b));
		} else {
			[_b] join _grp;
		};
		_bombers pushBack _b;
		[_grp,_dpos,0,0,"CARELESS","RED","FULL"] call UO_FW_AI_fnc_createWaypoint;
		[_grp,_epos,0,0,"CARELESS","RED","FULL"] call UO_FW_AI_fnc_createWaypoint;
		[_grp,_spos,0,0,"CARELESS","RED","FULL","WEDGE","MOVE","{deleteVehicle (vehicle _x); deleteVehicle _x;} forEach thisList;",300] call UO_FW_AI_fnc_createWaypoint;
		sleep 1;
		for [{_f=0},{(_f < _amtB)},{_f = _f + 1}] do {
			private _fpos = _spos vectorAdd [0,(_f*50),(_fh+(_f*20))];
			private _e = createVehicle [_ftype, _fpos, [], 0, "FLY"];
			_e setDir _dir;
			createVehicleCrew _e;
			_crew = (crew _e);
			_e setVelocity [((velocity _e) select 0) + (sin _dir * 120),((velocity _e) select 1) + (cos _dir * 120),((velocity _e) select 2)];
			_e flyInHeight (_fh+(_f*20));
			[_e] join _grp;
		};
		sleep 1;
	};

	{
		[_x,_dpos,_amtO,_ord,_ps] spawn {
			params ["_b","_dpos","_amtO","_ord","_ps""_i"];
			waitUntil{sleep 0.2; ((_b distance _dpos) < 300 || !alive _b);};
			for [{_i=0},{(_i < _amtO && alive _b)},{_i = _i + 1}] do {
				private _item = _ord createVehicle [((getposATL _b) select 0),((getposATL _b) select 1),(((getposATL _b) select 2)-50)];
				_item setDir (((direction _b) + 180) % 360);
				_item setVelocity (((velocity _b) vectorMultiply 0.5) vectorAdd [0,0,-50]);
				[_item,false,_ps] spawn UO_FW_AI_fnc_paraVehicle;
				_item setVariable["persistent",true,true];
				sleep 0.5;
			};
		};
	} forEach _bombers;
	true
