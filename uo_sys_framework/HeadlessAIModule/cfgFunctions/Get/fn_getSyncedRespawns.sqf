params [["_syncedZones",[],[[]]],["_respawns",[],[[]]]];
{
	_zone = _x;
	_module = [_zone,["UO_FW_AI_RespawnModule"]] call UO_FW_AI_fnc_getSyncedModules;
	{
		_m = _x;
		_respawns pushBack _m;
	} forEach _module;
} forEach _syncedZones;
_respawns
