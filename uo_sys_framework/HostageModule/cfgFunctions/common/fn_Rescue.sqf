#define COMPONENT Hostage
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);

params ["_unit", "_caller"];

LOG_2("Hostage Rescue called with: _unit: %1 _caller: %2",_unit,_caller);

if ((GETVAR(_unit,IsRescued,false)) || (GETVAR(_unit,IsUntied,false))) exitWith {};
if !((animationState _unit find "acts_aidlpsitmstpssurwnondnon") isEqualto -1) then {
    _unit removeEventHandler ["AnimDone", (GETVAR(_unit,EhAnimDone,0))];
    _unit enableAI "ANIM";
    _unit enableAI "MOVE";
	[_unit, "Acts_AidlPsitMstpSsurWnonDnon_out", 1] remoteExecCall ["ace_common_fnc_doAnimation", _unit];
	if !((animationState _unit find "Acts_AidlPsitMstpSsurWnonDnon_loop") isEqualto -1) then {
		while {(animationState _unit find "Acts_AidlPsitMstpSsurWnonDnon_loop") isEqualto -1} do {
		    [_unit, "Acts_AidlPsitMstpSsurWnonDnon_out", 1] remoteExecCall ["ace_common_fnc_doAnimation", _unit];
		};
	};
};

if (GETVAR(_unit,Freed_Behavior_Modifier,true)) then {
    _unit setBehaviour (GETVAR(_unit,Freed_Behavior,"careless"));
};

if (GETVAR(_unit,Freed_JoinSquad,true)) then {
    [_unit] joinSilent (group _caller);
};

SETPVAR(_unit,IsUntied,true);
