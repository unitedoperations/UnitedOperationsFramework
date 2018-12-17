if(!isServer) exitWith {_this remoteExec ["UO_FW_AI_fnc_setRespawn", 2];};
params [["_logic",objNull,[objNull]],["_marker","respawn_west",[""]]];
diag_log format["RETURN | %1",_this];
	{
	diag_log format["RETURN SIDE | %1",_x];
		_side = _x;
		switch (_side) do {
			case WEST: {_marker = "respawn_west";};
			case EAST: {_marker = "respawn_east";};
			case INDEPENDENT: {_marker = "respawn_guerrila";};
			case CIVILIAN: {_marker = "respawn_civilian";};
			default {_marker = "respawn_west";};
		};
		if (_marker in allMapMarkers) then {
			_marker setMarkerPos (getPos _logic);
		} else {
			createMarker [_marker, getPos _logic];
		};	
		{
			_unit = _x;
			_logic remoteExec ["UO_FW_AI_fnc_setQRFPosition", _unit];
		} forEach (allUnits select {side _x == _side});
	} forEach ([_logic getVariable ["aeRespawnSide",0]] call UO_FW_AI_fnc_getSide);
	true