#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(ALL)

["AO Limit", "Allows the mission maker to set AO limits to specific sides.", "Olsen & Sacher & PiZZADOX"] call UO_FW_FNC_RegisterModule;

//[_logic,_area,_selectedSides,_entryMode,_airsetting] passed array
params ["_logic","_area","_selectedSides","_entryMode","_airsetting"];

if (!isDedicated) then {

	_this spawn {

	waitUntil {!isNull player};
	waitUntil {time > 1};

	//[_logic,_area,_selectedSides,_entryMode,_airsetting] passed array
	params ["_logic","_area","_selectedSides","_entryMode","_airsetting"];
	private ["_startedInside","_pos","_startTime","_displayed"];

	if !((side player) in _selectedSides) exitwith {};

	if !((vehicle player) inArea _area) then {
		_startedInside = false;
		if !(_entryMode) exitwith {};
	} else {
		_startedInside = true;
	};

	UO_FW_DEBUG("","Starting AO Limit")
	_run = true;
	_recheckDead = false;
	_enteredZone = false;

	if (isNil "UO_FW_AOLimit_Array") then {UO_FW_AOLimit_Array = [_area]; } else {UO_FW_AOLimit_Array pushBackUnique _area;};

	while {_run} do {

		if ((_airsetting) && ((vehicle player) isKindOf "Air")) then {
			waituntil {sleep 60; !((vehicle player) isKindOf "Air")};
		};

		if ((count UO_FW_AOLimit_Array) isEqualto 1) then {
			if ((vehicle player) inArea _area) then {
				diag_log "in area";
				_pos = getPosATL (vehicle player);
				_enteredZone = true;
			} else {
				if (!(_startedInside) && (_enteredZone)) then {
				//private _reldir = (vehicle player) getdir _logic;
				diag_log "going out of area";
				(vehicle player) setVelocity [0,0,0];
				(vehicle player) setPos _pos;
				//_backpos = _pos getPos [2,_reldir];
				//(vehicle player) setPos _backpos;
				};
			};
		} else {
			{
				if (({player inArea _x} count UO_FW_AOLimit_Array) > 0) then {
					diag_log "in area";
					_pos = getPosATL (vehicle player);
					_enteredZone = true;
					} else {
						if (!(_startedInside) && (_enteredZone)) then {
						//private _reldir = (vehicle player) getdir _logic;
						diag_log "going out of area";
						(vehicle player) setVelocity [0,0,0];
						(vehicle player) setPos _pos;
						//_backpos = _pos getPos [2,_reldir];
						//(vehicle player) setPos _backpos;
						};
					};
			} foreach UO_FW_AOLimit_Array;
		};

		diag_log "checking AO Limit Loop";
		if ((count UO_FW_AOLimit_Array) isEqualto 1) then {
			if ((!(_startedInside) && (_entryMode) && !(player inArea _area)) || _recheckDead) then {
				diag_log "not inside or dead, waituntil loop";
				waituntil {sleep 10; player inArea _area};
				_recheckDead = false;
				_enteredZone = true;
			};
		} else {
			if ((({player inArea _x} count UO_FW_AOLimit_Array < 1) && !(_startedInside) && (_entryMode)) || _recheckDead) then {
				diag_log "not inside or dead, waituntil loop";
				waituntil {sleep 10; ({player inArea _x} count UO_FW_AOLimit_Array > 0)};
				_recheckDead = false;
				_enteredZone = true;
			};
		};

		if (!(player call UO_FW_fnc_alive) && !(_recheckDead)) then {
			diag_log "dead check var";
			_recheckDead = true;
			_enteredZone = false;
		};

		sleep(0.1);
		};
	};
};
