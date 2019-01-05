#include "\x\UO_FW\addons\main\script_macros.hpp"
if (!UO_FW_SERVER_HOSTAGEMODULE_ALLOWED) exitWith {};
UO_FW_EXEC_CHECK(ALL);

["Hostage Control", "Allows the mission maker to easily add hostages to their missions.", "Starfox64 and TrainDoctor"] call UO_FW_FNC_RegisterModule;

params ["_unit"];

private _marker = _unit getVariable ["UO_FW_Hostage_Rescue_Location","hostage_rescue"];

if (getMarkerColor _marker isEqualto "") exitwith {
	private _msg = format ["hostage _marker: %1 does not exist!",_marker];
	UO_FW_DEBUG("",_msg);
};

_marker setMarkerAlpha 0;

_rescueaction = ["Rescue Hostage", "Rescue Hostage","",{_this call UO_FW_FNC_HostageRescue},{!((_this select 0) getVariable ['UO_FW_Rescued', false]) && (alive (_this select 0))}] call ace_interact_menu_fnc_createAction;
[_unit, 0, ["ACE_MainActions"], _rescueaction] call ace_interact_menu_fnc_addActionToObject;

//if (hasInterface) then {
//	_unit addAction ["<t color='#FBB829'>Rescue Hostage</t>",{
//	[{_this call UO_FW_FNC_HostageRescue}] remoteExec ["bis_fnc_call",-2];
//	}, nil, 6, true, true, "", ";"];
//};

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
_run = true;

[_unit,_marker,_run,_break] spawn {
	params ["_unit","_marker","_run","_break"];
	while {_run} do {
		if (!(animationState _unit isEqualto "acts_aidlpsitmstpssurwnondnon04") && (_unit inArea _marker)) then {

			_unit setVariable ["UO_FW_Rescued", true, true];

			if ((vehicle _unit) isEqualto _unit) then {

				[_unit] joinSilent grpNull;
				_unit disableAI "MOVE";

				sleep 1;

				_unit playMoveNow "AmovPsitMstpSnonWnonDnon_ground";

				_break = true;
				_run = false;

			};

		};

		if (_break) exitWith {};

		sleep 15;
	};
};
