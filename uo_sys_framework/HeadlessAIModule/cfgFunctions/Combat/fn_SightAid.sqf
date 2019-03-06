#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

UO_FW_SIGHTAID_DEBUG = false;
params ["_unit"];

private _MyNearestEnemySight = _Unit call EFUNC(AI,ClosestEnemy);
private _distance = _unit distance2d _MyNearestEnemySight;
if (_distance > UO_FW_AI_SIGHTAID_DISTANCE) exitwith {};
private _knowsabouttarget = _unit knowsabout _MyNearestEnemySight;
if (_knowsabouttarget < 4) then {
    private _cansee = [objNull, "VIEW"] checkVisibility [eyePos _Unit, eyePos _MyNearestEnemySight];
    if (UO_FW_SIGHTAID_DEBUG) then {
        LOG_3("%1 cansee %2 by %3",_unit,_MyNearestEnemySight,_cansee);
    };
    if ((_cansee > 0.6) && {(_distance < UO_FW_AI_SightAid_EngageDistance)}) exitwith {
        _unit reveal [_MyNearestEnemySight,4];
        if (vehicle _unit isEqualto _unit) then {
            _unit dotarget _MyNearestEnemySight;
            _unit fireAtTarget [_MyNearestEnemySight];
        };
        if (UO_FW_SIGHTAID_DEBUG) then {
            LOG_2("revealing: %1 to %2, engage!",_MyNearestEnemySight,_unit);
        };
    };
    if (_cansee > 0.2) then {
        private _revealValue = linearConversion [100,UO_FW_AI_SIGHTAID_DISTANCE,_distance,4,UO_FW_AI_SightAid_MinIncrease];
        _unit reveal [_MyNearestEnemySight,_knowsabouttarget + _revealValue];
        if (UO_FW_SIGHTAID_DEBUG) then {
            LOG_4("revealing: %1 to %2, old knows: %3 new: %4",_MyNearestEnemySight,_unit,_knowsabouttarget,(_unit knowsabout _MyNearestEnemySight));
        };
    };
};
