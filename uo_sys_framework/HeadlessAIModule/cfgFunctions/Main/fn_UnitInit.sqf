params ["_Unit"];
_Group = (group _unit);

//Add necessary eventhandlers.
//_Unit addEventHandler ["Killed",{_this spawn UO_FW_AI_fnc_ClosestAllyWarn;}];
//_Unit addEventHandler ["FiredMan",{[_this] call UO_FW_AI_fnc_SuppressingShots; [_this] call UO_FW_AI_fnc_HearingAids;}];
//_Unit addEventHandler ["Hit",{_this call UO_FW_AI_fnc_AIHit;}];

//Should the AI run to support friendlies?
if (UO_FW_AI_REINFORCE) then {
	_Group setVariable ["UO_FW_AI_REINFORCE",true];
} else {
	_Group setVariable ["UO_FW_AI_REINFORCE",false];
};