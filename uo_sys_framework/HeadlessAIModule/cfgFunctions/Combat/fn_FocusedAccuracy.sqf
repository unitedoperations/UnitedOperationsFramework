private ["_Unit", "_TargetPosition", "_unit", "_NewPosition", "_Accuracy", "_Shake", "_Speed", "_SpotTime", "_SpotDistance", "_target"];
params ["_Unit","_DiagLastCheck","_TargetPosition"];

_DiagLastCheck = diag_ticktime;
if (_TargetPosition isEqualTo [0,0,0]) then {
    //_target = assignedTarget _unit;
    _target = _Unit call EFUNC(AI,ClosestEnemy);if (_target isEqualTo [0,0,0]) exitwith {};
    _TargetPosition = getpos _target;
} else {
    //_target = assignedTarget _unit;
    _target = _Unit call EFUNC(AI,ClosestEnemy);if (_target isEqualTo [0,0,0]) exitwith {};
    _NewPosition = getpos _Target;


    if (_TargetPosition distance _NewPosition < 30 && {(_unit knowsabout _target) > 0.1}) then {
        _Accuracy = _Unit skill "aimingAccuracy";
        _Shake = _Unit skill "aimingShake";
        _Speed = _Unit skill "aimingSpeed";
        _SpotTime = _Unit skill "spotTime";
        _SpotDistance = _Unit skill "spotDistance";

        if (UO_FW_AI_RainImpact) then {
            private _WeatherCheck = (rain)/UO_FW_AI_RainPercent;
            _Unit setSkill ["aimingAccuracy",(_Accuracy + 0.1) - _WeatherCheck];
            _Unit setSkill ["aimingShake",(_Shake + 0.1) - _WeatherCheck];
            _Unit setSkill ["aimingSpeed",(_Speed + 0.1) - _WeatherCheck];
            _Unit setSkill ["spotTime",(_SpotTime + 0.1) - _WeatherCheck];
            _Unit setSkill ["spotDistance",(_SpotDistance + 0.1) - _WeatherCheck];
        } else {
            _Unit setSkill ["aimingAccuracy",(_Accuracy + 0.1)];
            _Unit setSkill ["aimingShake",(_Shake + 0.1)];
            _Unit setSkill ["aimingSpeed",(_Speed + 0.1)];
            _Unit setSkill ["spotTime",(_SpotTime + 0.1)];
            _Unit setSkill ["spotDistance",(_SpotDistance + 0.1)];
        };
    } else {
        _Accuracy = _Unit skill "aimingAccuracy";
        _Shake = _Unit skill "aimingShake";
        _Speed = _Unit skill "aimingSpeed";
        _SpotTime = _Unit skill "spotTime";
        _SpotDistance = _Unit skill "spotDistance";

        if (UO_FW_AI_RainImpact) then {
            private _WeatherCheck = (rain)/UO_FW_AI_RainPercent;
            _Unit setSkill ["aimingAccuracy",_Accuracy - _WeatherCheck];
            _Unit setSkill ["aimingShake",_Shake - _WeatherCheck];
            _Unit setSkill ["aimingSpeed",_Speed - _WeatherCheck];
            _Unit setSkill ["spotTime",_SpotTime - _WeatherCheck];
            _Unit setSkill ["spotDistance",_SpotDistance - _WeatherCheck];
        } else {
            _Unit setSkill ["aimingAccuracy",_Accuracy];
            _Unit setSkill ["aimingShake",_Shake];
            _Unit setSkill ["aimingSpeed",_Speed];
            _Unit setSkill ["spotTime",_SpotTime];
            _Unit setSkill ["spotDistance",_SpotDistance];
        };
    };
    _TargetPosition = _NewPosition;
};

_ReturnedArray = [_DiagLastCheck,_TargetPosition];

_ReturnedArray
