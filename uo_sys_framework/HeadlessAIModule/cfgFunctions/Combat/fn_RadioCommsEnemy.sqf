params ["_groupcaller","_enemycaller","_sidecaller"];

if (UO_FW_AI_DEBUG) then {
	diag_log format ["radiocomms fnc _this: %1",_this];
};

{
	_x params ["_side","_group","_leader","_groupcount","_behaviourtasking","_behaviour","_target","_position","_hasRadio"];
	if (UO_FW_AI_DEBUG) then {
		diag_log format ["radiocomms fnc _group: %1",_group];
	};
	if (!(_groupcaller isEqualto _group)) then {
		private _isFriendly = [_sidecaller, _side] call BIS_fnc_sideIsFriendly;
		if (UO_FW_AI_DEBUG) then {
			diag_log format ["radiocomms fnc _group: %1 _isFriendly: %2",_group,_isFriendly];
		};
		if (_isFriendly) then {
			if (!(_enemycaller isEqualto _target) && ((_enemycaller distance _target) > 100)) then {
				if ((_hasRadio) || (!UO_FW_AI_Radio_NeedRadio)) then {
					private _distanceToUnit = _enemycaller distance _leader;
					if (_distanceToUnit < UO_FW_AI_Radio_Distance) then {
						//_leader reveal [_target,3.5];
						[_Group,_enemycaller,true] call UO_FW_AI_fnc_CombatResponse;
						if (UO_FW_AI_DEBUG) then {
							diag_log format ["_group: %1 called combatresponse",_group];
						};
					};
				};
			};
		};
	};
} foreach UO_FW_AI_GroupArray;
