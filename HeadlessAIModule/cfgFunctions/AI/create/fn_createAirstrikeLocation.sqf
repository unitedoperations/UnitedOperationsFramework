/*  Description: Set Location for Airstrike. */
if(!UO_FW_var_isHCorServer) exitWith {};
params [
	["_ordnanceType",1,[0]],
	["_aircraftAmount",1,[0]],
	["_friendly",true,[true]],
	["_ordnance","Bo_GBU12_LGB_MI10",[""]],
	["_dropHeight",100,[0]]
];
	switch (_ordnanceType) do {
		case 1: {
			_ordnance = "BombCluster_01_Ammo_F";
			_dropHeight = 500;
		};
		case 2: {_ordnance = "Bo_GBU12_LGB_MI10";};
		default {_ordnance = "Bo_GBU12_LGB_MI10";};
	};	
	openmap true;
	hint "Select Airstrike Location";
	["airstrike_location", "onMapSingleClick", {
		[_this select 1,_this select 4,_this select 5,_this select 6] spawn {
			params [
				["_lpos",[0,0,0],[[]]],
				["_ordnance","",[""]],
				["_aircraftAmount",1,[0]],
				["_friendly",true,[true]],
				["_markerName","aeAirstrikeMarker",[""]],
				["_dropHeight",100,[0]]
			];
			deleteMarker _markerName;		
			createMarker [_markerName,_lpos];
			_markerName setMarkerText "FAS";
			_markerName setMarkerColor "ColorYELLOW";
			_markerName setMarkerSize [1.2,1.2];
			_markerName setMarkerType  "zASOR_airstrike_m";		
			player setVariable ["aeAirstikeLocation",_lpos];
			sleep 0.5;
			if(!_friendly) then {
				_markerName setMarkerAlpha 0;
			};
			hint "Airstrike Location Confirmed";
			sleep 1;
			["airstrike_location", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
			openmap true; 
			hint "Select Airstrike Approach Direction";
			["airstrike_approach", "onMapSingleClick", { 
				[_this select 1,_this select 4,_this select 5,_this select 6] spawn {
					params [
						["_apos",[0,0,0],[[]]],
						["_ordnance","",[""]],
						["_aircraftAmount",1,[0]],
						["_friendly",true,[true]],
						["_markerName","aeAirstrikeMarker",[""]],
						["_markerNameApproach","aeAistrikeApproachMarker",[""]],
						["_aircraftSide",EAST,[EAST]],
						["_dropHeight",100,[0]]
					];
					private _locPos = markerPos _markerName;
					if((_locPos) isEqualTo [0,0,0]) exitWith {hint "No Air Strike Location Set\nSet Airstrike Location First"};
					private _dir = _apos getDir _locPos;		
					_markerName setMarkerDir _dir;
					private _startPos = (_apos getPos [2000, (_locPos getDir _apos)]);
					player setVariable ["aeAirstrikeStart",_startPos];
					deleteMarker _markerNameApproach;
					if(_friendly) then {
						createMarker [_markerNameApproach,_startPos];
						_markerNameApproach setMarkerText "IP";
						_markerNameApproach setMarkerColor "ColorWHITE";
						_markerNameApproach setMarkerType  "b_unknown";
					};
					if(!_friendly) then {
						_markerName setMarkerAlpha 0;
					};
					sleep 0.5;
					openMap false;
					private _wait = (floor random [20,50,100]);	
					if (_friendly) then {
						hint format["Airstrike Approach Direction Confirmed\nAircraft Moving to IP\nETA: %1seconds",(ceil(_wait/10))*10];
						_aircraftSide = side player;
					} else {
						hint format["Enemy Aircraft Detected Inbound ETA: %1seconds",(ceil(_wait/10))*10];
						_aircraftSide = if (side player == WEST) then {EAST} else {WEST};
					};
					private _aircraft = switch (_aircraftSide) do {
						case EAST: {"rhs_mig29s_vvs";};
						case WEST: {"rhsusf_f22";};
						default {"rhs_mig29s_vvs";};
					};
					private _dpos = player getVariable ["aeAirstikeLocation",[0,0,0]];
					if((_dpos) isEqualTo [0,0,0]) exitWith {hint "No Air Strike Location Set\nSet Airstrike Location First"};
					private _spos = player getVariable ["aeAirstrikeStart",[0,0,0]];   
					if((_spos) isEqualTo [0,0,0]) exitWith {hint "No Air Strike Approach Set\nSet Airstrike Approach First"};
					_spos = _spos vectorAdd [0,0,300];
					_dpos = _dpos vectorAdd [0,0,_dropHeight];							
					[_dpos,_spos,_ordnance,_wait,_aircraftAmount,_aircraft,_dropHeight] remoteExec ["UO_AI_fnc_createAirstrikeFixedWing",[0,2] select isMultiplayer];
					["airstrike_approach", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
				};
			},[_ordnance,_aircraftAmount,_friendly,_dropHeight]] call BIS_fnc_addStackedEventHandler;
		};
	},[_ordnance,_aircraftAmount,_friendly,_dropHeight]] call BIS_fnc_addStackedEventHandler;
	true