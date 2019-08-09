#include "..\..\Global\defs.hpp"
_handle = _this spawn {
        private _unit = _this select 0;
        private _target = _this select 1;
        private _roundClassName = _this select 2;
        private _fireRate = _unit call EFUNC(Firemission,ArtGetFireRate);
        [_unit , true] call EFUNC(Firemission,SetArtyReadyStatus);

        private _rounds = (_roundClassName);
        _unit setVariable [QEGVAR(Firemission,ArtFMText),_this call EFUNC(Firemission,GetGridSpottingFiremissionText),true];

        sleep((_unit call EFUNC(Firemission,GetArtyAimTime)));
        private _randomPos = [[[_target, _unit getVariable [QEGVAR(Firemission,ArtSpotAccuracy),MEANSPOTTINGACCURACY]]],[]] call BIS_fnc_randomPos;
        private _eta = [_unit,_randomPos, (_roundClassName) select 0] call EFUNC(Firemission,GetArtyEta);
        _unit commandArtilleryFire [_randomPos,  (_roundClassName) select 0, 1];
        private _waitTime = (_fireRate * (_unit getVariable [QEGVAR(Firemission,ArtFireRate),MEANFIRERATE]));
        sleep(_waitTime);
        [_unit,objNULL] call EFUNC(Firemission,SetArtyCaller);
        [_unit, false] call EFUNC(Firemission,SetArtyReadyStatus);
    };