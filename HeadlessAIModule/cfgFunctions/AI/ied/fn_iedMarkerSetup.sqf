/*	Description: 
 * 	Arguments:
 *		ARRAY	- Unit and Target
 * 	Return Value:
 *		BOOL 	- True or False
 */
	private["_array","_unit","_target","_iedPos","_device","_iedActualLoc","_flag"];
	params ["_unit","_markerColor"];
	closeDialog 0;
	UO_FW_flagPlacer = _unit;
	UO_FW_flagColor = _markerColor;
	UO_FW_flagSetup = createVehicle ["FlagSmall_F",[0,0,-10000],[], 0, "NONE"];
	player disableCollisionWith UO_FW_flagSetup;
	UO_FW_flagSetup enableSimulationGlobal false;

	//[_unit, "ACE_Explosives", true] call ace_common_fnc_setForceWalkStatus;
	UO_FW_flagTweakedAngle = 180;

	['UO_FW_flagPlacement',"OnEachFrame", {
		private ["_player", "_pos"];
		_player = ACE_player;
		if (UO_FW_flagPlacer != _player) exitWith {
			call UO_AI_fnc_iedPlace_Cancel;
		};
		UO_FW_flagPfeh_running = true;
		_pos = (ASLtoATL eyePos _player) vectorAdd (positionCameraToWorld [0,0,1] vectorDiff positionCameraToWorld [0,0,0]);
		UO_FW_flagSetup setPosATL _pos;
		if (ACE_Modifier == 0) then {
			UO_FW_flagSetup setDir (UO_FW_flagTweakedAngle + getDir _player);
		};
	}] call BIS_fnc_addStackedEventHandler;

	["PlaceAction", "CancelAction","ScrollAction"] call ace_interaction_fnc_showMouseHint;
	_unit setVariable ['Place', [_unit, "DefaultAction",{UO_FW_flagPfeh_running AND !isNull (UO_FW_flagSetup)}, {call UO_AI_fnc_iedMarkerPlaceApprove;}] call ace_common_fnc_AddActionEventHandler];
	_unit setVariable ['Cancel', [_unit, "zoomtemp",{UO_FW_flagPfeh_running AND !isNull (UO_FW_flagSetup)}, {call UO_AI_fnc_iedMarkerPlaceCancel;}] call ace_common_fnc_AddActionEventHandler];
