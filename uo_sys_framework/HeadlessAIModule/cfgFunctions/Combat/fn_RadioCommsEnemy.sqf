#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

params ["_groupcaller","_enemycaller","_sidecaller"];

if (UO_FW_AI_DEBUG) then {
    LOG_1("radiocomms fnc _this: %1",_this);
};

{
    _x params ["_side","_group","_leader","_groupcount","_behaviourtasking","_behaviour","_target","_position","_hasRadio"];
    if (UO_FW_AI_DEBUG) then {
        LOG_1("radiocomms fnc _group: %1",_group);
    };
    if (!(_groupcaller isEqualto _group)) then {
        private _isFriendly = [_sidecaller, _side] call BIS_fnc_sideIsFriendly;
        if (UO_FW_AI_DEBUG) then {
            LOG_2("radiocomms fnc _group: %1 _isFriendly: %2",_group,_isFriendly);
        };
        if (_isFriendly) then {
            if (!(_enemycaller isEqualto _target) && ((_enemycaller distance _target) > 100)) then {
                if ((_hasRadio) || (!UO_FW_AI_Radio_NeedRadio)) then {
                    private _distanceToUnit = _enemycaller distance _leader;
                    if (_distanceToUnit < UO_FW_AI_Radio_Distance) then {
                        //_leader reveal [_target,3.5];
                        [_Group,_enemycaller,true] call EFUNC(AI,CombatResponse);
                        if (UO_FW_AI_DEBUG) then {
                            LOG_1("_group: %1 called combatresponse",_group);
                        };
                    };
                };
            };
        };
    };
} foreach UO_FW_AI_GroupArray;
