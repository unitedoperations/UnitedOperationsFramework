#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER)

_this spawn {

	params ["_unit"];

	waitUntil {time > 0.1};

	private _marker = _unit getVariable ["UO_FW_Hostage_Rescue_Location","hostage_rescue"];

	if (getMarkerColor _marker == "") exitwith {
		private _msg = format ["hostage _marker: %1 does not exist!",_marker];
		UO_FW_DEBUG("",_msg)
	};

	if(hasInterface) then {
		_unit addAction ["<t color='#FBB829'>Rescue Hostage</t>",{
			[-2,{_this call UO_FW_FNC_HostageRescue;},[_this select 0, _this select 1]] call CBA_fnc_globalExecute;
			}, nil, 6, true, true, "", "(_target distance _this) < 2 && !(_target getVariable ['UO_FW_Rescued', false]);"];
		};

	private ["_EhAnimDone", "_break"];

	_unit setBehaviour "CARELESS";
	_unit allowFleeing 0;
	_unit setCaptive true;

	_unit playMoveNow "Acts_AidlPsitMstpSsurWnonDnon04";

	_EhAnimDone = _unit addEventHandler ["AnimDone", {
			if (!alive _unit) exitWith {
				_unit removeEventHandler ["AnimDone", _unit getVariable ["UO_FW_EhAnimDone", 0]];
			};

			_unit playMoveNow "Acts_AidlPsitMstpSsurWnonDnon04";
		}
	];

	_unit setVariable ["UO_FW_EhAnimDone", _EhAnimDone];

	_break = false;

	while {true} do {
		if (animationState _unit != "acts_aidlpsitmstpssurwnondnon04" && (_unit inArea _marker)) then {

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
