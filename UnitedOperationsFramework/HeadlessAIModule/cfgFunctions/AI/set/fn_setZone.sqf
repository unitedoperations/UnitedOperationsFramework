if(!isServer) exitWith {_this remoteExec ["UO_AI_fnc_setZone",2];};
params[["_zoneModules",[],[[]]],["_status",0,[0]],["_z",0,[0]]]; 
if (count _zoneModules > 0) then {
	for [{_z=0}, {(_z < count _zoneModules)}, {_z = _z + 1}] do { 
		_zoneModule = _zoneModules select _z;
		_set = if(_status == 2) then {([1,0] select (([_zoneModule,UO_FW_zones] call UO_AI_fnc_getDetails) select 3))} else {_status};
		([_zoneModule,UO_FW_zones] call UO_AI_fnc_getDetails) set [3, _set];
	};
};
true