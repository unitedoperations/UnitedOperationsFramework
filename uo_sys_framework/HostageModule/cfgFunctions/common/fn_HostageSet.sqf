#define COMPONENT Hostage
#include "\x\UO_FW\addons\Main\script_macros.hpp"
if (!UO_FW_Server_HostageModule_Allowed) exitWith {};
UO_FW_EXEC_CHECK(ALL);

["Hostage Control", "Allows the mission maker to easily add hostages to their missions.", "Starfox64, TrainDoctor and PiZZADOX"] call UO_FW_fnc_RegisterModule;

params ["_unit"];

private _marker = _unit getVariable ["UO_FW_Hostage_Rescue_Location","hostage_rescue"];

if (getMarkerColor _marker isEqualto "") exitwith {
	ERROR_1("hostage _marker: %1 does not exist!",_marker);
};

_marker setMarkerAlpha 0;

private _rescueaction = ["Rescue Hostage", "Rescue Hostage","",{_this call UO_FW_FNC_HostageRescue},{!((_this select 0) getVariable ['UO_FW_Rescued', false]) && (alive (_this select 0))}] call ace_interact_menu_fnc_createAction;
[_unit, 0, ["ACE_MainActions"], _rescueaction] call ace_interact_menu_fnc_addActionToObject;

_unit setBehaviour "CARELESS";
_unit allowFleeing 0;
_unit setCaptive true;

_unit playMoveNow "Acts_AidlPsitMstpSsurWnonDnon04";

private _EhAnimDone = _unit addEventHandler ["AnimDone", {
	if (!alive _unit) exitWith {
		_unit removeEventHandler ["AnimDone", _unit getVariable ["UO_FW_EhAnimDone", 0]];
	};
	_unit playMoveNow "Acts_AidlPsitMstpSsurWnonDnon04";
}];

_unit setVariable ["UO_FW_EhAnimDone", _EhAnimDone];

private _HostageSetPFHhandle = [{
	params ["_argNested", "_idPFH"];
	_argNested params ["_unit","_marker","_lastCheckedTime"];

	private _timeDifference = (CBA_missionTime - _lastCheckedTime);
	if (_timeDifference < 1) exitwith {};
	_argNested set [2,(CBA_missionTime)];

	if (!(animationState _unit isEqualto "acts_aidlpsitmstpssurwnondnon04") && {(_unit inArea _marker)}) exitwith {
		if ((vehicle _unit) isEqualto _unit) then {
			[_unit] joinSilent grpNull;
			_unit disableAI "MOVE";
			[{
				_this playMoveNow "AmovPsitMstpSnonWnonDnon_ground";
			}, _unit, 1] call CBA_fnc_waitAndExecute;
		};
		_this setVariable ["UO_FW_Rescued", true, true];
		[_idPFH] call CBA_fnc_removePerFrameHandler;
	};

}, 0, [_unit,_marker,CBA_missionTime]] call CBA_fnc_addPerFrameHandler;
