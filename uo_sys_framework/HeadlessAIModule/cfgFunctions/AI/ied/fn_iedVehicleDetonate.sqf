/*	Description: Detonate VBIED.
 * 	Arguments:
 *		OBJECT	- Unit
 *		OBJECT	- Target Object
 * 	Return Value:
 *		BOOL 	- True or False
 */
if(!isServer) exitWith {_this remoteExec ["UO_AI_fnc_iedVehicleDetonate",2];};
params [["_target",objNull,[objNull]],["_unit",objNull,[objNull]]];
	if(!(_target getVariable ["UO_FW_defused", false])) then {
	  	if ((floor random 100) > 20) then {
	  		"DETONATION IN PROGRESS! - EXPLOSIVE TRIGGERED" remoteExec ["hint", _unit];
			//add sound here
      			sleep (random [5, 10, 15]);
		};
		_target setDamage 1;
    	//"UO_FW_IED_Bomb_Huge" createVehicle (getPos _target);
  	};
	true
