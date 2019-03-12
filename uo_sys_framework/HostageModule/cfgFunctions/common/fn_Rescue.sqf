#define COMPONENT Hostage
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);

params ["_unit", "_caller"];

LOG_2("Hostage Rescue called with: _unit: %1 _caller: %2",_unit,_caller);

if (GETVAR(_unit,IsRescued,false)) exitWith {};
if !((animationState _unit find "acts_aidlpsitmstpssurwnondnon") isEqualto -1) then {
    _unit removeEventHandler ["AnimDone", (GETVAR(_unit,EhAnimDone,0))];
    _unit playMoveNow "Acts_AidlPsitMstpSsurWnonDnon_out";
    _unit enableAI "MOVE";
};

if (GETVAR(_unit,Freed_Behavior_Modifier,true)) then {
    _unit setBehaviour (GETVAR(_unit,Freed_Behavior,"careless"));
};

if (GETVAR(_unit,Freed_JoinSquad,true)) then {
    [_unit] joinSilent (group _caller);
};
