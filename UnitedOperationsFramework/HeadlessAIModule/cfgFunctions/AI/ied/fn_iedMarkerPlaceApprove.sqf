/*	Description: Approves placement of the flag, releases the placement object for it to settle in a location suitable for the flag to be created.
 * 	Arguments:
 *		NIL
 * 	Return Value:
 *		NIL
 */
	if (UO_FW_flagPfeh_running) then {
		['UO_FW_flagPlacement',"OnEachFrame"] call BIS_fnc_removeStackedEventHandler;
		UO_FW_flagPfeh_running = false;
	};
	private ["_flag", "_player", "_dir"];
	_flag = UO_FW_flagSetup;
	UO_FW_flagSetup = objNull;
	[UO_FW_flagPlacer, "ACE_Explosives", false] call ace_common_fnc_setForceWalkStatus;
	[ACE_player, "DefaultAction", ACE_player getVariable ['Place',  -1]] call ace_common_fnc_removeActionEventHandler;
	[ACE_player, "zoomtemp",      ACE_player getVariable ['Cancel', -1]] call ace_common_fnc_removeActionEventHandler;
	UO_FW_flagPlacer = objNull;
	_player = ACE_player;
	call ace_interaction_fnc_hideMouseHint;
	_dir = (getDir _flag);
	if (_dir > 180) then {
		_dir = _dir - 180;
	} else {
		_dir = 180 + _dir;
	};
	_flag setDir _dir;
	_pos = getPosATL _flag;
	_pos set [2, 0];
	_placedFlag = createVehicle ["FlagSmall_F", _pos, [], 0, "NONE"];
	_placedFlag setPosATL _pos;
	switch (UO_FW_flagColor) do {
		case "red": { _placedFlag setObjectTextureGlobal [0, "#(rgb,8,8,3)color(1,0,0,1)"]; };
		case "yellow": { _placedFlag setObjectTextureGlobal [0, "#(rgb,8,8,3)color(1,1,0,1)"]; };
		case "green": { _placedFlag setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,1,0,1)"]; };
		case "white": { _placedFlag setObjectTextureGlobal [0, "#(rgb,8,8,3)color(1,1,1,1)"]; };
		default {_placedFlag setObjectTextureGlobal [0, "#(rgb,8,8,3)color(1,1,1,1)"];};
	};
	deleteVehicle _flag;
	//_flag enableSimulationGlobal true;
	_player playActionNow "PutDown";