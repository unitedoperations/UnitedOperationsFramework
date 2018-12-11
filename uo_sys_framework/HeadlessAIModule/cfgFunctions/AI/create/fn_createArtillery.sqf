/*	Description: Create a unit of a group and apply required settings.
 * 	Arguments:
 * 		LOGIC	- Artillery Module Name
 *	Optional:
 * 		BOOL	- Repeat Strike
 * 		BOOL	- New Strike
 * 		LOGIC	- New Strike - Module Name
 * 		NUMBER	- Radius - New Strike - Radius
 *		NUMBER	- Volleys - New Strike - How many times the artillery will fire a barrage (0=99999, only way to stop it firing is to kill it)
 *		NUMBER	- Barrage - New Strike - How many rounds will be fire in a barrage
 *		NUMBER	- Reload - New Strike - How long the gun will take to reload for next barrage
 *		NUMBER	- Multiple Battery Delay - New Strike - Spacing in firing time between guns
 * 	Return Value:
 * 		BOOL 	- True
 *	Author
 *		suits & PiZZADOX
 *	Examples:
 *		[logic,radius,volleys,roundsPerBarrage,reloadTime,delayBetweenGuns,repeat] spawn UO_AI_fnc_createArtillery;
 *		[arty1,300,1,8,20,3,true] spawn UO_AI_fnc_createArtillery;
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)

params["_logic",["_guns",[],[[]]],"_g"];
_hold = _logic getVariable ['aeARTHold',false];
_radius = _logic getVariable ['aeARTRadius',300];
_volley = _logic getVariable ['aeARTVolleys',3];
_barrage = _logic getVariable ['aeARTBarrages',1];
_reload = _logic getVariable ['aeARTReload',30];
_delay = _logic getVariable ['aeARTOffset',3];	
if(_volley == -1) then {_volley = floor random [1,2,20];};
if(_volley == 0) then {_volley = 99999;};
if(_barrage == -1) then {_barrage = floor random [1,2,10];};	
if(_reload == -1) then {_reload = floor random [25,30,120];};
if(_delay == -1) then {_delay = floor random [3,10,20];};
if (count (_logic getVariable ["aeArtGunsCreated",[]]) == 0) then {
	(_logic getVariable ["aeArtGuns",[]]) params [["_grps",[],[[]]],["_emptyvehs",[],[[]]],["_objs",[],[[]]]];
	for [{_g=0},{(_g < (count _grps))},{_g=_g+1}] do {
		_ngrp = _grps select _g;
		_grp = _ngrp call UO_AI_fnc_createGroup;
		_guns = _guns + ((units _grp) select {_x != vehicle _x;} apply {vehicle _x});		
	};
	_guns = _guns arrayIntersect _guns;
	_logic setVariable ["aeArtGunsCreated",_guns];
};
sleep 3;
if (!(_logic getVariable ['aeARTHold',false])) then {
	{	
		[_x,_radius,_volley,_barrage,_reload,_delay,_forEachIndex,_logic] spawn {
			params["_gun","_radius","_volley","_barrage","_reload","_delay","_index","_logic",["_i",0,[0]],["_check",0,[0]]];
			waitUntil{
				sleep 0.2; 
				_check = _check + 1;
				alive _gun || _check > 500; 
			};
			if(_index > 0) then {sleep (_delay*_index);};		
			while { alive _gun && (_i < _volley)} do {
				_pos = (([(getPosATL _logic),0,_radius,1,true] call UO_AI_fnc_getRandomPositionCircle) select 0);			
				_gun doArtilleryFire [_pos,"",_barrage];
				sleep _reload;	
				_gun setVehicleAmmo 1;
				_i = _i + 1;	
			};
			_check = 0;
		};
	} forEach (_logic getVariable ["aeArtGunsCreated",[]]);
};
_logic setVariable ['aeARTHold',false];
true