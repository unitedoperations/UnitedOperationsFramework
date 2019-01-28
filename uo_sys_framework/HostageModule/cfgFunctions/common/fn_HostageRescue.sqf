#define COMPONENT Hostage
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params ["_unit", "_caller"];

if (GETVAR(_unit,Rescued,false)) exitWith {};
if !(animationState _unit find "acts_aidlpsitmstpssurwnondnon" isEqualto -1) then {
    _unit removeEventHandler ["AnimDone", (_unit getVariable ["UO_FW_EhAnimDone", 0])];
    _unit playMoveNow "Acts_AidlPsitMstpSsurWnonDnon_out";
};

if (GETVAR(_unit,Hostage_Freed_Behavior_Modifier,true)) then {
    _unit setBehaviour (GETVAR(_unit,Hostage_Freed_Behavior,"careless"));
    if ((_unit getVariable ["UO_FW_Hostage_Freed_JoinSquad", false])) then {
        [_unit] joinSilent (group _caller);
    };
} else {
    if (GETVAR(_unit,Hostage_Freed_JoinSquad,true)) then {
        [_unit] joinSilent (group _caller);
    };
};
