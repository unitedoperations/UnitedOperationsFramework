/*	Description: Continuously checks for nearby players while the pressure plate is alive.
 * 	Arguments:
 *		OBJECT	- IED Pressure Plate
 * 		ARRAY 	- Position
 *		NUMBER	- Radius
 *		ARRAY	- Side
 * 	Return Value:
 *		BOOL 	- True
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
	if(missionnamespace getvariable ["UO_FW_iedmonitor", false]) exitWith {};
	missionnamespace setVariable ["UO_FW_iedmonitor", true];
	while {count UO_FW_ieds > 0} do {	
		for [{_i = (count UO_FW_ieds)- 1}, {_i >= 0}, {_i = _i - 1}] do {
			(UO_FW_ieds select _i) params ["_ied","_loc","_radiusX","_radiusY","_type","_isRectangle","_direction"];
			private _populated = 0;
			if (alive _ied) then {
				_area = [_loc,_radiusX,_radiusY,_direction,_isRectangle];
				_populated = { 
					_player = _x;				
					alive _player 
					&& (({(vehicle _player) isKindOf _x} count _type) > 0)
					&& ([_player,["PRONE"]] call UO_AI_fnc_checkStance)
					&& _player inArea _area				
				} count allPlayers; 	
				if(_populated > 0) then {
					if(!(_ied getVariable ["UO_FW_defused", false])) then {
						if(!(_ied getVariable ["UO_FW_yield",0] == 6) && !(_ied getVariable ["UO_FW_defused", false])) then { 
							_loc remoteExec ["UO_AI_fnc_iedPlayPPSound",0];
						};
						sleep (_ied getVariable ["UO_FW_iedDelay",1]);
						[_ied] spawn UO_AI_fnc_iedDetonate;
					};
				};
				if (damage _ied > 0.6) then {
					[_ied] spawn UO_AI_fnc_iedDetonate;
				};
			} else {
				UO_FW_ieds deleteAt _i;
				publicVariable 'UO_FW_ieds';
			};
		};
		sleep 1;
	};
	missionnamespace setVariable ["UO_FW_iedmonitor", false];
	true