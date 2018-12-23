//Handles Group States, communications between friendly groups, and command structure

#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC)

UO_FW_AI_GroupArray = [];

sleep 4;

while {true} do {
	{
		sleep 2;
		_group = _x;
		if (!(isNull (leader _group))) then {
			private _leader = leader _group;
			if (!(isNil "_leader") && !(isPlayer _leader) && (alive _leader)) then {
				if ((side _leader) in UO_FW_AI_SideBasedExecution) then {
					if !(_leader getVariable ["UO_FW_AI_NOAI",false]) then {
						private _side = side _leader;
						private _behaviourtasking = (_Group getVariable ["UO_FW_AI_Mission","NONE"]);
						private _groupcount = (count units _group);
						private _behaviour = behaviour _leader;
						private _target = _group getVariable ["UO_FW_AI_CurrentTarget",objnull];
						private _position = getposASL _leader;
						private _hasradio = _group getVariable ["UO_FW_AI_HasRadio",false];

						if (count UO_FW_AI_GroupArray > 0) then {
							private _index = [UO_FW_AI_GroupArray, _group, 1] call UO_FW_AI_fnc_searchNestedArray;

							if (!(_index isEqualto -1)) then {
								//UO_FW_AI_GroupArray deleteAt _index;
								UO_FW_AI_GroupArray set [_index,[_side,_group,_leader,_groupcount,_behaviourtasking,_behaviour,_target,_position,_hasradio]];
							} else {
								UO_FW_AI_GroupArray pushback [_side,_group,_leader,_groupcount,_behaviourtasking,_behaviour,_target,_position,_hasradio];
							};
						} else {
							UO_FW_AI_GroupArray pushback [_side,_group,_leader,_groupcount,_behaviourtasking,_behaviour,_target,_position,_hasradio];
						};
					};
				};
			};
		};
	} forEach allGroups;
	sleep (random (2) + 2);
};
