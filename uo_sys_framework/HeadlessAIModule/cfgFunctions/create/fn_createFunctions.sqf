/*	Description: Gets synced modules list and checks if correct modules linked.
 *	Displays error message in debug mode if wrong links exist.
 * 	Arguments:
 * 		OBJECT	- Module (name, _logic)
 * 	Return Value:
 * 		BOOL 	- True
 *	["UO_FW_AI_FastAirStrikeModule","UO_FW_AI_AirDropModule","UO_FW_AI_HeloInsertModule"];
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC)

params ["_functions","_delay"];
sleep _delay;
{
	private _logic = _x;
	private _posModules = [_logic,["UO_FW_AI_PositionModule"]] call UO_FW_AI_fnc_getSyncedModules;
	private _spos = [0,0,0];
	if( count _posModules > 0) then {
		private _pos = getPosATL (_posModules select 0);
		if( ((_posModules select 0) getVariable ['UO_FW_PositionRadius',0]) > 0) then {
			_spos = [_pos,0,((_posModules select 0) getVariable ['UO_FW_PositionRadius',0]),1] call UO_FW_AI_fnc_getRandomPositionCircle;
		} else {
			_spos = _pos;
		};
	};
	switch (typeof _logic) do {
		case "UO_FW_AI_FastAirStrikeModule": {[_logic,_spos] spawn UO_FW_AI_fnc_createFastAirStrike;};
		case "UO_FW_AI_AirDropModule": {
			[	(getPosATL _logic),
				_logic getVariable ['UO_FW_artRadius',0],
				_logic getVariable ['UO_FW_adOrdinance',3],
				_logic getVariable ['UO_FW_adOrdnanceType',"Box_NATO_Ammo_F"],
				_logic getVariable ['UO_FW_adHeight',120],
				_logic getVariable ['UO_FW_adSmoke',true],
				_logic getVariable ['UO_FW_adAircraftType',"RHS_C130J"],
				_logic getVariable ['aeADEscort',true],
				_logic getVariable ['UO_FW_adEscortAircraftType',"rhsusf_f22"],
				_spos
			] spawn UO_FW_AI_fnc_createAirDrop;
		};
		case "UO_FW_AI_HeloInsertModule": {
			[	_logic,
				_logic getVariable ['UO_FW_hiRadius',200],
				_logic getVariable ['UO_FW_hiMultiplier',1],
				_logic getVariable ['UO_FW_hiHeight',120],
				_logic getVariable ['UO_FW_hiInsertType',0]
			] spawn UO_FW_AI_fnc_createHeloInsert;

		};
	};
} forEach _functions;
