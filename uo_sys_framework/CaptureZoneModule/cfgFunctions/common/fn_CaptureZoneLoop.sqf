#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER)
private ["_markername","_marker","_oldOwner","_playersInArea","_owner"];

//[_logic,_zoneName,_area,_interval,_repeatable,_capArray,_timeArray,_messagesArray,_colours,_hidden,_silent,_automessages,_ratioNeeded,_cond] passed array
params ["_logic","_zoneName","_area","_interval","_repeatable","_capArray","_timeArray","_messagesArray","_colours","_hidden","_silent","_automessages","_ratioNeeded","_cond"];
_area params ["_loc","_radiusX","_radiusY","_direction","_isRectangle"];
_colours params ["_bluforcolour","_opforcolour","_indforcolour","_civiliancolour","_uncontestedcolour","_contestedcolour"];
_messagesArray params ["_bluformessageArray","_opformessageArray","_indformessageArray","_civilianmessageArray","_uncontestedmessage","_contestedmessage"];
_capArray params ["_bluforCapMode","_opforCapMode","_indforCapMode","_civCapMode"];

[] spawn {
	waituntil {!isNil "UO_FW_Framework_Initialized"};
	["Capture Zone", "Creates Capture Zones", "Sacher & PiZZADOX"] call UO_FW_FNC_RegisterModule;
};

if(!(_this call UO_FW_fnc_ValidateCaptureZone)) exitWith {
	UO_FW_DEBUG("",format ["CaptureZone %1 failed to Validate",_zoneName])
};

if (_interval > 5) then {
	UO_FW_DEBUG("",format ["CaptureZone %1 has too low an interval check! Setting to 5 seconds", _variablename]);
	_interval = 5;
};

if !(_hidden) then {
	UO_FW_DEBUG("",format ["Creating CaptureZone %1 Marker",_zoneName])
	_markername = format ["%1_ZoneMarker",_zoneName];
	_marker = createmarker [_markername,_loc];
	if (_isRectangle) then {
		_marker setMarkerShape "RECTANGLE";
	} else {
		_marker setMarkerShape "ELLIPSE";
	};
	_marker setMarkerSize [_radiusX, _radiusY];
	_marker setMarkerAlpha 0.25;
	_marker setMarkerBrush "SolidBorder";
	_marker setMarkerDir _direction;
	_marker setMarkerColor _uncontestedcolour;
};

//define var for use in endconditions
private _varName = format ["%1_var",_zoneName];
private  _teamControllingvarName = format ["%1_teamControlling",_zoneName];
MissionNamespace setVariable [_varName,false,true];
MissionNamespace setVariable [_teamControllingvarName,"UNCONTESTED",true];

_run = true;
_oldOwner = "UNCONTESTED";
_owner = "UNCONTESTED";
_ownerControlCount = 0;
_bluforIndex = 0;
_opforIndex = 1;
_indforIndex = 2;
_civIndex = 3;

waitUntil {time > 0.1};

UO_FW_DEBUG("",format ["Starting CaptureZone %1 Loop",_zoneName])

while {_run} do {
	//var redeclares

	_bluCount = 0;
	_opCount = 0;
	_indCount = 0;
	_civCount = 0;

	private _condvalue = missionNamespace getVariable [_cond,true];
	waituntil {_condvalue};

	_playersInArea = ([] call UO_FW_fnc_alivePlayers) select {(_x inArea _area) && (!captive _x)};

	if (_playersInArea isEqualTo []) then {
		_owner = "UNCONTESTED";
		_ownerControlCount = 0;
		if !(_owner isEqualto _oldOwner) then {
			if !(_hidden) then {
				_marker setMarkerColor _uncontestedcolour;
			};
			if !(_silent) then {
				if (_automessages) then {
					private _msg = format ["%1 is uncontested!",_zoneName];
					_msg remoteExec ["hint"];
				} else {
					_uncontestedmessage remoteExec ["hint"];
				};
			};
			MissionNamespace setVariable [_varName,false,true];
			MissionNamespace setVariable [_teamControllingvarName,"UNCONTESTED",true];
		};
		waituntil {sleep _interval; !((([] call UO_FW_fnc_alivePlayers) select {(_x inArea _area) && (!captive _x)}) isEqualTo [])};
	};

	{
		switch (side _x) do {
			case west: {
				if !(_bluforCapMode isEqualto 2) then {
					_bluCount = _bluCount + 1;
				};
			};
			case east: {
				if !(_opforCapMode isEqualto 2) then {
					_opCount = _opCount + 1;
				};
			};
			case independent: {
				if !(_indforCapMode isEqualto 2) then {
					_indCount = _indCount + 1;
				};
			};
			case civilian: {
				if !(_civCapMode isEqualto 2) then {
					_civCount = _civCount + 1;
				};
			};
			default {};
		};
	} foreach _playersInArea;


	if (({(selectMax [_bluCount, _opCount, _indCount, _civCount] isEqualTo _x) && !(_x isEqualto 0)} count [_bluCount, _opCount, _indCount, _civCount]) > 1) then {
		//it's a tie between 2 or more teams
		_owner = "CONTESTED";
		_ownerControlCount = 0;
		if !(_owner isEqualto _oldOwner) then {
			if !(_hidden) then {
				_marker setMarkerColor _contestedcolour;
			};
			if !(_silent) then {
				if (_automessages) then {
					private _msg = format ["%1 is contested!",_zoneName];
					_msg remoteExec ["hint"];
				} else {
					_contestedmessage remoteExec ["hint"];
				};
			};
		};
	} else {
		//a team has a number advantage
		private _ratio = 10;
		private _findMax = ([_bluCount,_opCount,_indCount,_civCount] call CBA_fnc_findMax);
		private _max = _findMax # 0;
		private _maxindex = _findMax # 1;
		private _2ndplace = 0;
		private _ratioNeeded = 0;
		if !(_ratioNeeded isEqualto 0) then {
			_2ndplace = (selectMax ([_bluCount,_opCount,_indCount,_civCount] - [_max]));
			if !(_2ndplace isEqualTo 0) then {
				_ratio = (_2ndplace / _max);
			} else {
				_ratio = 10;
			};
		} else {
			_ratio = 10;
			_2ndplace = 0;
		};
		if (_ratio > _ratioNeeded) then {
			//a team has enough ratio for control!
			_owner = ["BLUFOR","OPFOR","INDFOR","CIV"] select _maxindex;

			switch (_owner) do {
				case "BLUFOR": {
					if (_owner isEqualto _oldOwner) then {
						if (_bluforCapMode isEqualTo 0) then {
							_ownerControlCount = _ownerControlCount + 1;
							if (_ownerControlCount > (_timeArray select _bluforIndex)) then {
								//message is blufor has captured
								if !(_hidden) then {
									_marker setMarkerColor _bluforcolour;
								};
								if !(_silent) then {
									if (_automessages) then {
										private _msg = format ["%1 has captured %2!",UO_FW_TeamSetting_Blufor_TeamName,_zoneName];
										_msg remoteExec ["hint"];
									} else {
										(_bluformessageArray select 1) remoteExec ["hint"];
									};
								};
								MissionNamespace setVariable [_varName,true,true];
								MissionNamespace setVariable [_teamControllingvarName,"BLUFOR",true];
								if !(_repeatable) then {
									_run = false;
								};
							};
						};
					} else {
						//message if blufor is capturing
						if !(_hidden) then {
							_marker setMarkerColor _bluforcolour;
						};
						if !(_silent) then {
							if (_automessages) then {
								private _msg = format ["%1 is capturing %2!",UO_FW_TeamSetting_Blufor_TeamName,_zoneName];
								_msg remoteExec ["hint"];
							} else {
								(_bluformessageArray select 0) remoteExec ["hint"];
							};
						};
					};
				};
				case "OPFOR": {
					if (_owner isEqualto _oldOwner) then {
						if (_opforCapMode isEqualTo 0) then {
							_ownerControlCount = _ownerControlCount + 1;
							if (_ownerControlCount > (_timeArray select _opforIndex)) then {
								//message is blufor has captured
								if !(_hidden) then {
									_marker setMarkerColor _opforcolour;
								};
								if !(_silent) then {
									if (_automessages) then {
										private _msg = format ["%1 has captured %2!",UO_FW_TeamSetting_Opfor_TeamName,_zoneName];
										_msg remoteExec ["hint"];
									} else {
										(_opformessageArray select 1) remoteExec ["hint"];
									};
								};
								MissionNamespace setVariable [_varName,true,true];
								MissionNamespace setVariable [_teamControllingvarName,"OPFOR",true];
								if !(_repeatable) then {
									_run = false;
								};
							};
						};
					} else {
						//message if blufor is capturing
						if !(_hidden) then {
							_marker setMarkerColor _opforcolour;
						};
						if !(_silent) then {
							if (_automessages) then {
								private _msg = format ["%1 is capturing %2!",UO_FW_TeamSetting_Opfor_TeamName,_zoneName];
								_msg remoteExec ["hint"];
							} else {
								(_opformessageArray select 0) remoteExec ["hint"];
							};
						};
					};
				};
				case "INDFOR": {
					if (_owner isEqualto _oldOwner) then {
						if (_indforCapMode isEqualTo 0) then {
							_ownerControlCount = _ownerControlCount + 1;
							if (_ownerControlCount > (_timeArray select _indforIndex)) then {
								//message is blufor has captured
								if !(_hidden) then {
									_marker setMarkerColor _indforcolour;
								};
								if !(_silent) then {
									if (_automessages) then {
										private _msg = format ["%1 has captured %2!",UO_FW_TeamSetting_Indfor_TeamName,_zoneName];
										_msg remoteExec ["hint"];
									} else {
										(_indformessageArray select 1) remoteExec ["hint"];
									};
								};
								MissionNamespace setVariable [_varName,true,true];
								MissionNamespace setVariable [_teamControllingvarName,"INDFOR",true];
								if !(_repeatable) then {
									_run = false;
								};
							};
						};
					} else {
						//message if blufor is capturing
						if !(_hidden) then {
							_marker setMarkerColor _indforcolour;
						};
						if !(_silent) then {
							if (_automessages) then {
								private _msg = format ["%1 is capturing %2!",UO_FW_TeamSetting_Indfor_TeamName,_zoneName];
								_msg remoteExec ["hint"];
							} else {
								(_indformessageArray select 0) remoteExec ["hint"];
							};
						};
					};
				};
				case "CIV": {
					if (_owner isEqualto _oldOwner) then {
						if (_civCapMode isEqualTo 0) then {
							_ownerControlCount = _ownerControlCount + 1;
							if (_ownerControlCount > (_timeArray select _civIndex)) then {
								//message is blufor has captured
								if !(_hidden) then {
									_marker setMarkerColor _civiliancolour;
								};
								if !(_silent) then {
									if (_automessages) then {
										private _msg = format ["%1 has captured %2!",UO_FW_TeamSetting_Civ_TeamName,_zoneName];
										_msg remoteExec ["hint"];
									} else {
										(_civilianmessageArray select 1) remoteExec ["hint"];
									};
								};
								MissionNamespace setVariable [_varName,true,true];
								MissionNamespace setVariable [_teamControllingvarName,"CIV",true];
								if !(_repeatable) then {
									_run = false;
								};
							};
						};
					} else {
						if !(_hidden) then {
							_marker setMarkerColor _civiliancolour;
						};
						if !(_silent) then {
							if (_automessages) then {
								private _msg = format ["%1 is capturing %2!",UO_FW_TeamSetting_Civ_TeamName,_zoneName];
								_msg remoteExec ["hint"];
							} else {
								(_civilianmessageArray select 0) remoteExec ["hint"];
							};
						};
					};
				};
				default {
					_owner = "UNCONTESTED";
					if !(_hidden) then {
						_marker setMarkerColor _uncontestedcolour;
					};
					if !(_silent) then {
						if (_automessages) then {
							private _msg = format ["%1 is uncontested!",_zoneName];
							_msg remoteExec ["hint"];
						} else {
							_uncontestedmessage remoteExec ["hint"];
						};
					};
				};
			};
		} else {
			//not enough of a ratio to gain control!
			_owner = "CONTESTED";
			_ownerControlCount = 0;
			if !(_owner isEqualto _oldOwner) then {
				if !(_hidden) then {
					_marker setMarkerColor _contestedcolour;
				};
				if !(_silent) then {
					if (_automessages) then {
						private _msg = format ["%1 is contested!",_zoneName];
						_msg remoteExec ["hint"];
					} else {
						_contestedmessage remoteExec ["hint"];
					};
				};
			};
		};
	};

	_oldOwner = _owner;
	sleep 1;
	//bases counts off of 1 second loop
};

if (!_repeatable) then {
	if !(_hidden) then {
		_marker setMarkerAlpha 0.5;
		_marker setMarkerBrush "Border";
	};
};
