/*	Description: Create a unit of a group and apply required settings.
 * 	Arguments:
 * 		LOGIC	- Artillery Module Name
 *	Optional:
 * 		LOGIC	- New Strike Module Name
 * 	Optional2: 	- ARRAY
 * 					NUMBER	- Radius - New Strike - Radius
 *					NUMBER	- Volleys - New Strike - How many times the artillery will fire a barrage (0=99999, only way to stop it firing is to kill it)
 *					NUMBER	- Barrage - New Strike - How many rounds will be fire in a barrage
 *					NUMBER	- Reload - New Strike - How long the gun will take to reload for next barrage
 *					NUMBER	- Multiple Battery Delay - New Strike - Spacing in firing time between guns
 * 	Return Value:
 * 		BOOL 	- True
 *	Author
 *		suits & PiZZADOX
 *	Examples:
 *		[logic,targetModule,[radius,volleys,roundsPerBarrage,reloadTime,delayBetweenGuns]] spawn UO_AI_fnc_artyFire;
 *		[arty1,objNull,[300,1,8,20,3]] spawn UO_AI_fnc_createArtillery;
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params["_logic",["_target",objNull,[objNull]],["_newFM",[],[[]]]];
	_newFM params [
		["_radius",(_logic getVariable ['aeARTRadius',300]),[0]],
		["_volley",(_logic getVariable ['aeARTVolleys',3]),[3]],
		["_barrage",(_logic getVariable ['aeARTBarrages',1]),[0]],
		["_reload",(_logic getVariable ['aeARTReload',30]),[0]],
		["_delay",(_logic getVariable ['aeARTOffset',3]),[0]]
	];
	if(_barrage == -1) then {_barrage = floor random 10;};
	if(_delay == -1) then {_delay = floor random 20;};
	if(_reload == -1) then {_reload = floor random 180;};
	if(isNull _target)then{_target = _logic};
	private _guns = _logic getVariable ["aeCreatedArtGuns",[]];
	{
		if(_volley == 0) then {_volley = 99999;};			
		[_x,_radius,_volley,_barrage,_reload,_delay,_forEachIndex,_target] spawn {
			params["_gun","_radius","_volley","_barrage","_reload","_delay","_index","_target",["_i",0,[0]],["_check",0,[0]]];
			waitUntil{
				sleep 0.2; 
				_check = _check + 1;
				alive _gun || _check > 500; 
			};
			if(_index > 0) then {sleep (_delay*_index);};		
			while { alive _gun && (_i < _volley)} do {
				_pos = (([(getPosATL _target),0,_radius,1,true] call UO_AI_fnc_getRandomPositionCircle) select 0);			
				_gun doArtilleryFire [_pos,"",_barrage];
				sleep _reload;	
				_gun setVehicleAmmo 1;
				_i = _i + 1;	
			};
			_check = 0;
		};
	} forEach _guns;
	true