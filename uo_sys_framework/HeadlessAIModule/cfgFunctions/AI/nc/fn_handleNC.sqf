/*	Description: Starts the non-combatant loop. Should be run on clients, is called on all by the AE module.
 *	Author
 *		suits & PiZZADOX, muffin
 *	Examples:
 *		[] spawn UO_AI_fnc_handleNC;
 */
 [] spawn {
	waitUntil { sleep .25; player == player };
	private _synced = [player, ["UO_FW_NonCombatantModule"]] call UO_AI_fnc_getSyncedModules;
	if(count _synced == 0) exitWith {};

	player setCaptive true;
	disableSerialization;
	private _ui = (findDisplay 46) ctrlCreate ["RscPictureKeepAspect", 4001]; 
	_ui ctrlSetPosition [safeZoneX + (safeZoneW/2) - 0.02, safeZoneY + (3.38 * (safeZoneH/4)) - 0.02, 0.04,0.05]; 
	_ui ctrlSetFade 1;  
	_ui ctrlCommit 0;
	_ui ctrlSetText "\a3\ui_f_curator\Data\Logos\arma3_curator_eye_32a_ca.paa";
	_wasHidden = true;
	_hidden = true;
	while {true} do {
		sleep 3; 
		_uniformClass = getText (configFile >> "cfgWeapons" >> uniform player >> "itemInfo" >> "uniformClass"); 
		_uniformSide = getNumber (configFile >> "cfgVehicles" >> _uniformClass >> "side");
		if(_uniformClass == "") then {
			_uniformSide = CIVILIAN;
		} else {
			switch(_uniformSide) do
			{
				case 0: { _uniformSide = EAST; };
				case 1: { _uniformSide = WEST; };
				case 2: { _uniformSide = RESISTANCE; };
				case 3: { _uniformSide = CIVILIAN; };
				default { _uniformSide = CIVILIAN; };
			};
		};							
		private _side = switch (side player) do {
			case EAST: {WEST};
			default {EAST};
		};	
		if((((primaryWeapon player) + (secondaryWeapon player) + (handgunWeapon player) + (vest player)) != "") || ((_uniformSide != _side) && (_uniformSide != CIVILIAN)) || ([player] call UO_AI_fnc_isInRestrictedArea)) then {
			if(captive player) then {
				player setcaptive false;
			};
		} else {
			if ((_side knowsAbout player) > (player getVariable["aeKnowsAbout",0])) then {
				player setVariable["aeKnowsAbout",(_side knowsAbout player)];
			};					
			if((_side knowsAbout player) < (player getVariable["aeKnowsAbout",0]) || ((player getVariable["aeKnowsAbout",0]) isEqualTo 0)) then {
				if(!captive player) then {
					player setcaptive true;
					player setVariable["aeknowsAbout",0];
				};											
			};
		};
		if(captive player) then {
			_hidden = false;
			if([player] call UO_AI_fnc_isNearRestrictedArea) then { [player] spawn UO_AI_fnc_nearRestrictedArea; };
		} else {
			_hidden = true;
		};
		if(_wasHidden && !_hidden) then {
			_ui ctrlSetFade 0.4;  
			_ui ctrlCommit 2;
			_wasHidden = _hidden;
		};
		if(!_wasHidden && _hidden) then {
			_ui ctrlSetFade 1;  
			_ui ctrlCommit 2;
			_wasHidden = _hidden;
		};
	};
	ctrlDelete _ui;
 };