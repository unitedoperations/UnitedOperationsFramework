#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC)


params ["_pos","_spos","_ordnance","_wait","_i",["_aircraftType","RHS_C130J"]];
	private _dir = _spos getDir _pos;
	private _epos = _pos getPos [(((count _ordnance)*70) max 350), _dir];
	sleep _wait;
	private _aircraft = createVehicle [_aircraftType, _spos, [], 0, "FLY"];
	_aircraft setPosATL _spos;
	_aircraft setDir _dir;
	createVehicleCrew _aircraft;
	_aircraft setVelocity [((velocity _aircraft) select 0) + (sin _dir * 200),((velocity _aircraft) select 1) + (cos _dir * 200),((velocity _aircraft) select 2)];
	_aircraft flyInHeight 150;
	_grp = (group (driver _aircraft));
	[_aircraft] join _grp;
	[_grp,_pos,0,0,"CARELESS","RED","FULL"] call UO_FW_AI_fnc_createWaypoint;
	[_grp,_epos,0,0,"CARELESS","RED","FULL"] call UO_FW_AI_fnc_createWaypoint;
	[_grp,_spos,0,0,"CARELESS","RED","FULL","WEDGE","MOVE","{deleteVehicle (vehicle _x); deleteVehicle _x;} forEach thisList;",300] call UO_FW_AI_fnc_createWaypoint;
	sleep 1;
	waitUntil{sleep 0.2; ((_aircraft distance _pos) < 230 || !alive _aircraft);};
	for [{_i=0},{(_i < (count _ordnance) && alive _aircraft)},{_i = _i + 1}] do {
		private _item = createVehicle [_ordnance select _i, (((vectorDir _aircraft) vectorMultiply -50) vectorAdd (getPosATL _aircraft)), [], 0, "FLY"];
		_item setDir (((direction _aircraft) + 180) % 360);
		_item setVelocity (((velocity _aircraft) vectorMultiply 0.5) vectorAdd [0,0,-20]);
		[_item,false,true] spawn UO_FW_AI_fnc_paraVehicle;
		_item setVariable["persistent",true,true];
		sleep 0.2;
	};
true
