params ["_unit","_marker"];

if(hasInterface) then {
	_unit addAction ["<t color='#FBB829'>Rescue Hostage</t>",{
		[-2,{_this call UO_FW_FNC_HostageRescue;},[_this select 0, _this select 1]] call CBA_fnc_globalExecute;
	}, nil, 6, true, true, "", "(_target distance _this) < 2 && !(_target getVariable ['UO_FW_Rescued', false]);"];
};

if (!isServer) exitWith {};

_this spawn {

	private ["_EhAnimDone", "_break"];

	//hint (str _this);
	_unit = _this select 0;
	_marker = _this select 1;

	waitUntil {time > 0.1};

	_unit setBehaviour "CARELESS";
	_unit allowFleeing 0;
	_unit setCaptive true;

	_unit playMoveNow "Acts_AidlPsitMstpSsurWnonDnon04";

	_EhAnimDone = _unit addEventHandler ["AnimDone", {
			private "_unit";
			_unit = _this select 0;

			if (!alive _unit) exitWith {
				_unit removeEventHandler ["AnimDone", _unit getVariable ["UO_FW_EhAnimDone", 0]];
			};

			_unit playMoveNow "Acts_AidlPsitMstpSsurWnonDnon04";
		}
	];

	_unit setVariable ["UO_FW_EhAnimDone", _EhAnimDone];

	_break = false;

	while {true} do {
		if (animationState _unit != "acts_aidlpsitmstpssurwnondnon04" && [_unit, _marker] call UO_FW_FNC_InArea) then {

			_unit setVariable ["UO_FW_Rescued", true, true];

			if (vehicle _unit == _unit) then {

				[_unit] joinSilent grpNull;
				_unit disableAI "MOVE";

				sleep 1;

				_unit playMoveNow "AmovPsitMstpSnonWnonDnon_ground";

				_break = true;

			};

		};

		if (_break) exitWith {};

		sleep 15;
	};

};