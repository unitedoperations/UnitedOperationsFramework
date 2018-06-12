/*	Description: Cancels placement of the flag.
 * 	Arguments:
 *		NIL
 * 	Return Value:
 *		NIL
 */
	if (UO_FW_flagPfeh_running) then {
		[UO_FW_flagPlacement,"OnEachFrame"] call BIS_fnc_removeStackedEventHandler;
		UO_FW_flagPfeh_running = false;
	};
	if (!isNull (UO_FW_flagSetup)) then {
		deleteVehicle UO_FW_flagSetup;
	};
	UO_FW_flagSetup = objNull;
	if (isNil {UO_FW_flagPlacer}) then {
		UO_FW_flagPlacer = objNull;
	};
	[UO_FW_flagPlacer, "ACE_Explosives", false] call ace_common_fnc_setForceWalkStatus;
	UO_FW_flagPlacer = objNull;
	call ace_interaction_fnc_hideMouseHint;
	[ACE_player, "DefaultAction", ACE_player getVariable ['Place',  -1]] call ace_common_fnc_removeActionEventHandler;
	[ACE_player, "zoomtemp",      ACE_player getVariable ['Cancel', -1]] call ace_common_fnc_removeActionEventHandler;