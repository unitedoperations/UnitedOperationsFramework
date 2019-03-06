//Handles Group States, communications between friendly groups, and command structure

#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

UO_FW_AI_GroupArray = [];
private _HCGroupHandlerPFH = [{
    {
        private _group = _x;
        private _leader = leader _group;
        if (isNull _leader || (isPlayer _leader) || !(alive _leader)) exitwith {};
        if (!((side _leader) in UO_FW_AI_SideBasedExecution) || (vehicle _leader getVariable ["UO_FW_AI_NOAI",false])) exitwith {};
        private _side = side _leader;
        private _behaviourtasking = (_Group getVariable ["UO_FW_AI_Mission","NONE"]);
        private _groupcount = (count units _group);
        private _behaviour = behaviour _leader;
        private _target = _group getVariable ["UO_FW_AI_CurrentTarget",objnull];
        private _position = getposASL _leader;
        private _hasradio = _group getVariable ["UO_FW_AI_HasRadio",false];
        private _groupArray = [_side,_group,_leader,_groupcount,_behaviourtasking,_behaviour,_target,_position,_hasradio];

        if (UO_FW_AI_GroupArray isEqualTo []) then {
            UO_FW_AI_GroupArray pushback _groupArray;
        } else {
            private _index = [UO_FW_AI_GroupArray, _group, 1] call EFUNC(AI,searchNestedArray);
            if (_index != -1) then {
                UO_FW_AI_GroupArray set [_index,_groupArray];
            } else {
                UO_FW_AI_GroupArray pushback _groupArray;
            };
        };
    } forEach allGroups;
}, 120] call CBA_fnc_addPerFrameHandler;
