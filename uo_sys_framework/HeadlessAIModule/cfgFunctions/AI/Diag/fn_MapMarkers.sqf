//Prints and updates markers for all in UO_FW_AI_TrackedUnits array

#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)


sleep 10;

While {true} do {
	{
		_x params ["_side","_group","_leader","_groupcount","_behaviourtasking","_behaviour","_target","_position","_hasRadio"];
			if (alive _leader) then {
				_rankshort = [rank _leader,"displayNameShort"] call BIS_fnc_rankparams;
				_lastname = name _leader;

				private _markercolor = switch (_side) do {
					case west: {"ColorBlue"};
					case east: {"ColorRed"};
					case resistance: {"ColorGreen"};
					default {"ColorBlack"};
				};

				_trackername = format["trk_%1_%2",_lastname,_leader];

				if (!(_trackername in UO_FW_AI_MARKERARRAY)) then {
					_markerlead = createMarker [_trackername,[0,0]];
					UO_FW_AI_MARKERARRAY pushback _trackername;

					_drawicon = switch (true) do {
						case (_leader isKindOf "Man"): {"b_inf"};
						case (_leader isKindOf "LandVehicle"): {"b_motor_inf"};
						default {"b_inf"};
					};

					_trackername setMarkerShape "ICON";
					_trackername setMarkerType _drawicon;
					_trackername setmarkercolor _markercolor;
				};

				_usedest = false;
				_trackername setmarkerpos [getpos _leader select 0, getpos _leader select 1];

				_usedest = switch (_behaviourtasking) do {
					case "GARRISON": {false;};
					case "DEFAULT PATROLLING": {true;};
					case "PATROLLING": {true;};
					case "ATTACK": {true;};
					case "ASSAULT": {true;};
					case "FLANK": {true;};
					case "MOVE": {true;};
					case "DEFEND": {false;};
					case "BUNKER": {false;};
					case "LOITERING": {false;};
					case "STATIONARY": {false;};
					case "IDLE": {false;};
					case "NONE": {false;};
					case "DEFAULT WP": {true;};
					default {false};
				};

				_usetarget = false;

				if (_target isEqualto objnull) then {
					_target = "No Target";
				} else {
					_usetarget = true;
				};

				_text = format ["%1. %2 - Grpcount: %3 - Mission: %4 - CombatMode: %5 - Target: %6",_rankshort, _lastname,_groupcount,_behaviourtasking,_behaviour,_target];
				_trackername setMarkerText _text;

				if (_usedest) then {
					_destname = format["dest_%1_%2",_lastname,_leader];

					if (!(_destname in UO_FW_AI_MARKERARRAY)) then {
						_markerobj = createMarker[_destname,[0,0]];
						UO_FW_AI_MARKERARRAY pushback _destname;

						_wptext = format ["%1. %2",_rankshort, _lastname];
						_destname setMarkerShape "ICON";
						_destname setMarkerType "mil_marker";
						_destname setMarkerSize [0.5,0.5];
						_destname setmarkercolor _markercolor;
						_destname setMarkerText _wptext;
					};

					private _wpArray = waypoints _group;
					if (count _wpArray > 0) then {
						private _wpindex = currentWaypoint _group;
						private _wppos = waypointPosition [_group,_wpindex];
						_destname setmarkerpos _wppos;
					} else {
						_destname setmarkerpos [0,0];
					};
				} else {
					_destname = format["dest_%1_%2",_lastname,_leader];

					if (_destname in UO_FW_AI_MARKERARRAY) then {
						deletemarker _destname;
						UO_FW_AI_MARKERARRAY = UO_FW_AI_MARKERARRAY - [_destname];
					};
				};

				if (_usetarget) then {
					_targetname = format["target_%1_%2",_lastname,_leader];

					if (!(_targetname in UO_FW_AI_MARKERARRAY)) then {
						_markertarget = createMarker[_targetname,[0,0]];
						UO_FW_AI_MARKERARRAY pushback _targetname;

						_targettext = format ["%1. %2",_rankshort, _lastname];
						_targetname setMarkerShape "ICON";
						_targetname setMarkerType "mil_objective";
						_targetname setMarkerSize [0.5,0.5];
						_targetname setmarkercolor _markercolor;
						_targetname setMarkerText _targettext;
					};

					_targetname setMarkerPos [(getpos _target select 0),(getpos _target select 1)];
				} else {
					_targetname = format["target_%1_%2",_lastname,_leader];
					if (_trackername in UO_FW_AI_MARKERARRAY) then {
						deletemarker _targetname;
						UO_FW_AI_MARKERARRAY = UO_FW_AI_MARKERARRAY - [_targetname];
					};
				};
			} else {
				_lastname = name _leader;
				_trackername = format["trk_%1_%2",_lastname,_leader];

				if (_trackername in UO_FW_AI_MARKERARRAY) then {
					deletemarker _trackername;
					UO_FW_AI_MARKERARRAY = UO_FW_AI_MARKERARRAY - [_trackername];
				};

				_destname = format["dest_%1_%2",_lastname,_leader];

				if (_destname in UO_FW_AI_MARKERARRAY) then {
					deletemarker _destname;
					UO_FW_AI_MARKERARRAY = UO_FW_AI_MARKERARRAY - [_destname];
				};

				_targetname = format["target_%1_%2",_lastname,_leader];

				if (_targetname in UO_FW_AI_MARKERARRAY) then {
					deletemarker _targetname;
					UO_FW_AI_MARKERARRAY = UO_FW_AI_MARKERARRAY - [_targetname];
				};
			};
	} foreach UO_FW_AI_GroupArray;
	sleep 0.5;
};
