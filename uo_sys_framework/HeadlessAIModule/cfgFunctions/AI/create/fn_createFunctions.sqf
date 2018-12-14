/*	Description: Gets synced modules list and checks if correct modules linked.
 *	Displays error message in debug mode if wrong links exist.
 * 	Arguments:
 * 		OBJECT	- Module (name, _logic)
 * 	Return Value:
 * 		BOOL 	- True
 *	["UO_FW_IEDModule","UO_FW_FastAirStrikeModule","UO_FW_AirResupplyModule","UO_FW_HeloInsertModule"];
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params ["_functions","_delay"];
sleep _delay;
{	
	private _logic = _x;
	private _posModules = [_logic,["UO_FW_PositionModule"]] call UO_AI_fnc_getSyncedModules;
	private _spos = [0,0,0];
	if( count _posModules > 0) then {
		private _pos = getPosATL (_posModules select 0);
		if( ((_posModules select 0) getVariable ['aePositionRadius',0]) > 0) then {
			_spos = [_pos,0,((_posModules select 0) getVariable ['aePositionRadius',0]),1] call UO_AI_fnc_getRandomPositionCircle;
		} else {
			_spos = _pos;
		};
	};
	switch (typeof _logic) do {
		case "UO_FW_IEDModule": {
			_logic spawn UO_AI_fnc_iedCreate;
		};
		case "UO_FW_FastAirStrikeModule": {[_logic,_spos] spawn UO_AI_fnc_createFastAirStrike;};
		case "UO_FW_ArtilleryStrikeModule": {[_logic] spawn UO_AI_fnc_createArtillery;};
		case "UO_FW_AirDropModule": {
			[	(getPosATL _logic),
				_logic getVariable ['aeADRadius',0],
				_logic getVariable ['aeADOrdnance',3],
				_logic getVariable ['aeADOrdnanceType',"ASOR_Ammo_Inf_Air"],
				_logic getVariable ['aeADHeight',120],
				_logic getVariable ['aeADSmoke',true],
				_logic getVariable ['aeADAircraftType',"RHS_C130J"],
				_logic getVariable ['aeADEscort',true],
				_logic getVariable ['aeADEscortAircraftType',"rhsusf_f22"],
				_spos
			] spawn UO_AI_fnc_createAirDrop;
		};
		case "UO_FW_HeloInsertModule": {	
			[	_logic,
				_logic getVariable ['aeHIRadius',200],
				_logic getVariable ['aeHIMultiplier',1],
				_logic getVariable ['aeHIHeight',120],
				_logic getVariable ['aeHIInsertType',0]
			] spawn UO_AI_fnc_createHeloInsert;
	
		};
	};
} forEach _functions;