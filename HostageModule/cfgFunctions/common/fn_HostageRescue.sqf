params ["_unit", "_caller"];

	_unit = _this select 0;
	_caller = _this select 1;

	if (_unit getVariable ["UO_FW_Rescued", false]) exitWith {};
	if (animationState _unit find "acts_aidlpsitmstpssurwnondnon" != -1) then {
		_unit removeEventHandler ["AnimDone", _unit getVariable ["FW_EhAnimDone", 0]];
		_unit playMoveNow "Acts_AidlPsitMstpSsurWnonDnon_out";
	};

	if (_unit getVariable ["UO_FW_Hostage_Freed_Modifier", false]) then {
		[_unit] join group _caller;
	};

	if (_unit getVariable ["UO_FW_Hostage_Freed_Modifier", true]) then {
		_unit setBehaviour UO_FW_Hostage_Freed_Behavior;
		if (_unit getVariable ["UO_FW_Hostage_Freed_JoinSquad", true]) then {
			[_unit] join group _caller;
		};
	};