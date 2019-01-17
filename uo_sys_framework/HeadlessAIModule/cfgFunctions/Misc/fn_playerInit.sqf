
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(CLIENT);

[] spawn {
	waituntil {!isNull player};
	waituntil {!isNil "UO_FW_AI_InitMainInitialized"};
	waituntil {UO_FW_AI_InitMainInitialized};
	_unit = player;
	if (!local _unit) exitwith {};
	if !(UO_FW_AI_HEARINGAIDS_Enabled) exitwith {};
		if ((_unit getVariable ["UO_FW_AI_unitFiredManHandlerSet",false])) exitwith {};

			_ID = _unit addEventHandler ["FiredMan",{

				params ["_firer","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile","_gunner"];

				//check for lockout
				if (time < _firer getVariable ["UO_FW_AI_unitHandler_revealLockout",-1]) exitWith {};
				_firer setVariable ["UO_FW_AI_unitHandler_revealLockout", time + 5,true];//makes the reveal be available in 5s from now

				_debugText = ""; //always good to have

				allUnits select {(_x distance2d _firer <= UO_FW_AI_HEARINGDISTANCE) && (!isplayer _x)} apply {

					_distance = _x distance _firer;
					_travelTime = _distance / 343;//not using distance2d since that would be odd
					_revealValue = linearConversion [200,UO_FW_AI_HEARINGDISTANCE,_distance,4,UO_FW_AI_HEARINGMININCREASE];
					_debugText = _debugText + format ["%1 got revealed to %2\n%3m, %4 seconds, %5 reveal value.\n\n",_firer,_x,_distance,_travelTime,_revealValue];

					_delayedReveal = [_firer,_x,_distance,_travelTime,_revealValue] spawn {
						params ["_firer","_AIunit","_travelTime","_revealValue"];
						sleep _travelTime;
						_AIunit reveal [_firer,_revealValue];
						true
					};

				};
				if (UO_FW_AI_MARKERS_Enabled) then {
					LOG(_debugText);
				};
				}];

				_unit setVariable ["UO_FW_AI_unitHandler_firedRevealID",_ID];//store the EH ID on the object to keep things tidy
				_unit setVariable ["UO_FW_AI_unitFiredManHandlerSet",true];
};
