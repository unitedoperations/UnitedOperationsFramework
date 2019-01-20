/*  Zone Monitor monitors each zone for players and initiates the loading of the zone when activated (player in range).
 * 	Arguments:
 * 		NIL
 * 	Return Value:
 * 		BOOL	- True
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);


[] spawn {
	sleep 1;
	while {true} do {
		{
			_x params ["_zone","_loc","_radiusX","_isOn","_side","_Type","_cond","_delay","_code","_radiusY","_isRectangle","_direction"];
			LOG_1("zone checked: %1",_x);
			private _initial = _zone getVariable ["initiallyspawned",false];
			private _populated = 0;
			private _area = [_loc,_radiusX,_radiusY,_direction,_isRectangle];
			if ((call _cond) && (_isOn isEqualTo 0) && (!_initial)) then {
				[_zone,_delay,_code] spawn UO_FW_AI_fnc_setup;
				_x set [3, 1];
			} else {
				private _aliveplayers = [] call UO_FW_fnc_alivePlayers;
				_populated = {
					private _player = _x;
					(({(vehicle _player) isKindOf _x} count _Type) > 0)
					&& (side _player) in _side
					&& _player inArea _area
				} count _aliveplayers;
			};
			private _shouldBeOn = if ( _populated > 0 ) then { 1 } else { 0 };
			if (!_initial) then {
				if (_isOn != _shouldBeOn) then {
					if (_shouldBeOn > 0) then {
						[_zone,_delay,_code] spawn UO_FW_AI_fnc_setup;
						_x set [3, 1];
						_isOn = 1;
						_zone setVariable ["UO_FW_AI_zone_activated",true];
					};
				};
			};
		} forEach UO_FW_AI_Zones;
		[] spawn UO_FW_AI_fnc_taskMonitor;
		sleep 7;
	};
};
true
