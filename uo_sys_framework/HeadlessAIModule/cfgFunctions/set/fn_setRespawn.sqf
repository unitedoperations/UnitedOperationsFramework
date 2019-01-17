#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params [["_logic",objNull,[objNull]],["_marker","respawn_west",[""]]];
	{
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
		} forEach (allUnits select {side _x isEqualTo _side});
	} forEach ([_logic getVariable ["UO_FW_AI_respawnside",0]] call UO_FW_AI_fnc_getSide);
	true
