/*
 * Author: commy2
 * Modified From:
 * ACE_hitreactions_fnc_fallDown
 *
 */
	// close map if open
	if (visibleMap) then {
		openMap false;
	};

	// play ace scream sound
    [] call UO_AI_fnc_getInjuredSound;

	// handle static weapons
	if ((vehicle player) isKindOf "StaticWeapon") exitWith {
		if (!alive player) then {
			player action ["Eject", vehicle player];
			unassignVehicle player;
		};
	};

	// don't do animations if in a vehicle (looks weird and animations never reset):
	if (vehicle player != player) exitWith {};

	// this checks most things, so it doesn't mess with being inside vehicles or while dragging etc.
	if !([player, vehicle player] call ace_common_fnc_canInteractWith) exitWith {};

	// handle ladders
	if (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> animationState player >> "ACE_isLadder") == 1) exitWith {
		player action ["LadderOff", nearestObject [position player, "House"]];
	};

	// only play animation when standing due to lack of animations, sry
	if !(stance player in ["CROUCH", "STAND"]) exitWith {};

	// get correct animation by weapon
	private _anim = player call UO_AI_fnc_getKnockDownAnimation;

	// exit if no animation for this weapon exists, i.e. binocular or rocket launcher
	if (_anim == "") exitWith {};

	// don't mess with transitions. don't fall then.
	if !([player] call ace_common_fnc_inTransitionAnim) then {
		[player, _anim, 2] call ace_common_fnc_doAnimation;
	};
	true