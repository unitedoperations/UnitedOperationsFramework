//UO_FW_AI_fnc_CombatResponse

params ["_Group",["_RadioEnemy",objnull],["_reinforcementcall",false]];

_leader = leader _group;
_currentmission = _group getVariable ["UO_FW_AI_Mission","NONE"];
if (behaviour _leader isEqualto "SAFE") then {
	_group setbehaviour "AWARE";
};
_currenttarget = _group getVariable ["UO_FW_AI_CurrentTarget",objnull];
if (!(_RadioEnemy isEqualto objnull) && (_currenttarget isEqualto objnull)) then {
	_currenttarget = _RadioEnemy;
	_group setVariable ["UO_FW_AI_CurrentTarget",_RadioEnemy];
};
_enemydir = _leader getdir _currenttarget;
_enemydist = _leader distance _currenttarget;

switch (_currentmission) do {
	default {};
	case "GARRISON": {};
	case "STATIONARY": {};
	case "BUNKER": {};
	case "DEFAULT PATROLLING": {
			if (_enemydist < 150) then {
				if (((floor random 1) > 0) || _reinforcementcall) then {
					[_Group,_currenttarget,_enemydir] call UO_FW_AI_fnc_CombatAttack;
				} else {
					[_Group,_currenttarget,_enemydir] call UO_FW_AI_fnc_CombatDefend;
				};
			} else {
				if (((floor random 1) > 0) || _reinforcementcall) then {
					[_Group,_currenttarget,_enemydir] call UO_FW_AI_fnc_CombatMoveTo;
				} else {
					[_Group,_currenttarget,_enemydir] call UO_FW_AI_fnc_CombatDefend;
				};
			};
		};
	case "PATROLLING": {
			if (_enemydist < 150) then {
				if (((floor random 1) > 0) || _reinforcementcall) then {
					[_Group,_currenttarget,_enemydir] call UO_FW_AI_fnc_CombatAttack;
				} else {
					[_Group,_currenttarget,_enemydir] call UO_FW_AI_fnc_CombatDefend;
				};
			} else {
				if (((floor random 1) > 0) || _reinforcementcall) then {
					[_Group,_currenttarget,_enemydir] call UO_FW_AI_fnc_CombatMoveTo;
				} else {
					[_Group,_currenttarget,_enemydir] call UO_FW_AI_fnc_CombatDefend;
				};
			};
		};
	case "LOITERING": {
			(group _unit) setSpeedMode "FULL";
			{_x setUnitPos "AUTO";} foreach (units _group);
			if (((floor random 1) > 0)|| _reinforcementcall) then {
				[_Group,_currenttarget,_enemydir] call UO_FW_AI_fnc_CombatAttack;
			} else {
				[_Group,_currenttarget,_enemydir] call UO_FW_AI_fnc_CombatDefend;
			};
		}; //regroups unit via a different function
	case "IDLE": {
			if (_enemydist < 150) then {
				if (((floor random 1) > 0) || _reinforcementcall) then {
					[_Group,_currenttarget,_enemydir] call UO_FW_AI_fnc_CombatAttack;
				} else {
					[_Group,_currenttarget,_enemydir] call UO_FW_AI_fnc_CombatDefend;
				};
			} else {
				if (((floor random 1) > 0)|| _reinforcementcall) then {
					[_Group,_currenttarget,_enemydir] call UO_FW_AI_fnc_CombatMoveTo;
				} else {
					[_Group,_currenttarget,_enemydir] call UO_FW_AI_fnc_CombatDefend;
				};
			};
		};
	case "NONE": {
			if (_enemydist < 150) then {
				if (((floor random 1) > 0)|| _reinforcementcall) then {
					[_Group,_currenttarget,_enemydir] call UO_FW_AI_fnc_CombatAttack;
				} else {
					[_Group,_currenttarget,_enemydir] call UO_FW_AI_fnc_CombatDefend;
				};
			} else {
				if (((floor random 1) > 0)|| _reinforcementcall) then {
					[_Group,_currenttarget,_enemydir] call UO_FW_AI_fnc_CombatMoveTo;
				} else {
					[_Group,_currenttarget,_enemydir] call UO_FW_AI_fnc_CombatDefend;
				};
			};
		};
};
