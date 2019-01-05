#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

params ["_unit", "_caller", "_actionId"];

if (_unit getVariable ["UO_FW_Rescued", false]) exitWith {};
if (animationState _unit find "acts_aidlpsitmstpssurwnondnon" != -1) then {
	_unit removeEventHandler ["AnimDone", (_unit getVariable ["UO_FW_EhAnimDone", 0])];
	_unit playMoveNow "Acts_AidlPsitMstpSsurWnonDnon_out";
};

if (_unit getVariable ["UO_FW_Hostage_Freed_JoinSquad", true]) then {
	[_unit] joinSilent (group _caller);
};

if (_unit getVariable ["UO_FW_Hostage_Freed_Modifier", false]) then {
	_unit setBehaviour (_unit getVariable ["UO_FW_Hostage_Freed_Behavior","careless"]);
	if ((_unit getVariable ["UO_FW_Hostage_Freed_JoinSquad", false])) then {
		[_unit] joinSilent (group _caller);
	};
};
