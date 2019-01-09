#define COMPONENT AOLimit
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

["AO Limit", "Allows the mission maker to set AO limits to specific sides.", "Olsen, Sacher and PiZZADOX"] call UO_FW_FNC_RegisterModule;

//[_logic,_area,_selectedSides,_entryMode,_airsetting,_AOMode,_softAOtime,_softAOtimeAir] passed array
params ["_logic","_area","_selectedSides","_entryMode","_airsetting","_AOMode","_softAOtime","_softAOtimeAir"];

if (!isDedicated && hasInterface) then {

	_this spawn {

		scopename "AOLimitMainSpawn";

		waitUntil {!isNull player};
		waitUntil {time > 1};

		//[_logic,_area,_selectedSides,_entryMode,_airsetting,_AOMode,_softAOtime,_softAOtimeAir] passed array
		params ["_logic","_area","_selectedSides","_entryMode","_airsetting","_AOMode","_softAOtime","_softAOtimeAir"];
		private ["_startedInside","_pos","_startTime","_displayed","_run","_arrayname","_enteredZone","_outSide","_allowedOutside"];
		private _softAOMode = false;
		if (_AOMode isEqualto 1) then {_softAOMode = true;};

		if !((side player) in _selectedSides) exitwith {};

		//if adding new area to existing loop, add area to UO_FW_AOLimit_Array and exit
		//if (!isNil "UO_FW_AOLimit_Array") exitwith {UO_FW_AOLimit_Array pushBackUnique _area;};
		//UO_FW_AOLimit_Array = [_area];
		_run = false;
		_displayed = false;

		if (isNil "UO_FW_AOLimit_Array_1") then {
			UO_FW_AOLimit_Array_1 = [_area];
			UO_FW_AOLimit_Arrays = [];
			UO_FW_AOLimit_Arrays pushback UO_FW_AOLimit_Array_1;
			_arrayname = "UO_FW_AOLimit_Array_1";
			_run = true;
		} else {
			{
				private _AOLimitArray = _x;
				if (({_logic inArea _x} count _AOLimitArray) > 0) exitwith {
						_AOLimitArray pushBackUnique _area;
						_run = false;
						//diag_log "exiting AO limit fnc, already one running!";
						breakOut "AOLimitMainSpawn";
				};
			} foreach UO_FW_AOLimit_Arrays;
			private _count = (count UO_FW_AOLimit_Arrays);
			private _arrayname = format ["UO_FW_AOLimit_Array_%1",_count];
			missionNamespace setvariable [_arrayname,[_area]];
			_run = true;
		};

		//diag_log format ["arrayname: %1",(missionNamespace getvariable _arrayname)];

		if (({(vehicle player) inArea _x} count (missionNamespace getvariable _arrayname)) isEqualto 0) then {
			if !(_entryMode) exitwith {};
			_startedInside = false;
			_outSide = true;
			_enteredZone = false;
		} else {
			_startedInside = true;
			_outSide = false;
			_enteredZone = true;
		};

		LOG("Starting AO Limit");
		private _recheckDead = false;

		while {_run} do {

			private _air = (vehicle player) isKindOf "Air";

			if ((_airsetting) && (_air)) then {
				waituntil {sleep 30; !(_air)};
			};

			_allowedOutside = (((_softAOtime < 0) && !_air) || ((_softAOtimeAir < 0) && _air));

			if ((count (missionNamespace getvariable _arrayname)) isEqualto 1) then {
				if ((vehicle player) inArea _area) then {
					_outSide = false;
					_enteredZone = true;
					if !(_softAOMode) then {
						//diag_log "in area ";
						_pos = getPosATL (vehicle player);
					} else {
						//diag_log "in soft area 1";
						missionNamespace setVariable ["UO_FW_AOL_Display", _outSide];
					};
				} else {
					if ((!(_startedInside) && (_enteredZone)) || (_startedInside)) then {
						if !(_softAOMode) then {
						//private _reldir = (vehicle player) getdir _logic;
						//diag_log "going out of area 1";
						(vehicle player) setVelocity [0,0,0];
						(vehicle player) setPos _pos;
						//_backpos = _pos getPos [2,_reldir];
						//(vehicle player) setPos _backpos;
						} else {
							//diag_log "going out of soft area 1";
							_outSide = true;
							if !(missionNamespace getVariable ["UO_FW_AOL_DisplayOpen", false]) then {
								private _timeLeft = if (_air) then {_softAOtimeAir} else {_softAOtime};
								//diag_log "created display";
								missionNamespace setVariable ["UO_FW_AOL_Display", _outSide];
								missionNamespace setVariable ["UO_FW_AOL_TimeLeft", _timeLeft];
								("UO_FW_AOLimit_Layer" call BIS_fnc_rscLayer) cutRsc ["RscAOLimit", "PLAIN", 0.5, false];
							};
						};
					};
				};
			} else {
				if (({(vehicle player) inArea _x} count (missionNamespace getvariable _arrayname)) > 0) then {
					_enteredZone = true;
					_outSide = false;
					if !(_softAOMode) then {
						//diag_log "in area 2";
						_pos = getPosATL (vehicle player);
					} else {
						//diag_log "in soft area 2";
						missionNamespace setVariable ["UO_FW_AOL_Display", _outSide];
					};
				} else {
					if ((!(_startedInside) && (_enteredZone)) || (_startedInside)) then {
						if !(_softAOMode) then {
							//private _reldir = (vehicle player) getdir _logic;
							//diag_log "going out of area 2";
							(vehicle player) setVelocity [0,0,0];
							(vehicle player) setPos _pos;
							//_backpos = _pos getPos [2,_reldir];
							//(vehicle player) setPos _backpos;
						} else {
							//diag_log "going out of soft area 2";
							_outSide = true;
							if !(missionNamespace getVariable ["UO_FW_AOL_DisplayOpen", false]) then {
								private _timeLeft = if (_air) then {_softAOtimeAir} else {_softAOtime};
								//diag_log "created display";
								missionNamespace setVariable ["UO_FW_AOL_Display", _outSide];
								missionNamespace setVariable ["UO_FW_AOL_TimeLeft", _timeLeft];
								("UO_FW_AOLimit_Layer" call BIS_fnc_rscLayer) cutRsc ["RscAOLimit", "PLAIN", 0.5, false];
							};
						};
					};
				};
			};

			missionNamespace setVariable ["UO_FW_AOL_Display", _outSide];

			//diag_log "checking AO Limit Loop";
			if ((count (missionNamespace getvariable _arrayname)) isEqualto 1) then {
				if ((!(_startedInside) && !_softAOMode && (_entryMode) && !((vehicle player) inArea _area)) || (_recheckDead && !_softAOMode)) then {
					//diag_log "not inside or dead, waituntil loop";
					waituntil {sleep 10; (vehicle player) inArea _area};
					_recheckDead = false;
					_enteredZone = true;
				};
			} else {
				if ((({(vehicle player) inArea _x} count (missionNamespace getvariable _arrayname) < 1) && !(_startedInside) && !_softAOMode && (_entryMode)) || (_recheckDead && !_softAOMode)) then {
					//diag_log "not inside or dead, waituntil loop";
					waituntil {sleep 10; (({(vehicle player) inArea _x} count (missionNamespace getvariable _arrayname)) > 0)};
					_recheckDead = false;
					_enteredZone = true;
				};
			};

			if (!((vehicle player) call UO_FW_fnc_alive) && !(_recheckDead)) then {
				//diag_log "dead check var";
				_recheckDead = true;
				_enteredZone = false;
			};

		sleep(0.1);
		};
	};
};
