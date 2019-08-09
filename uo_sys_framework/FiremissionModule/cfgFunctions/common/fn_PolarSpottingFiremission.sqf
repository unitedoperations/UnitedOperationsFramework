#include "..\..\Global\defs.hpp"
_handle = _this spawn {
        private _unit = _this select 0;
        private _target = _this select 1;
        private _mils = _this select 2;
        private _distance = _this select 3;
        private _roundClassName = _this select 4;
        private _loc = [_target,true] call CBA_fnc_mapGridToPos;
        private _degrees = MILSPERROUND / _mils * 360.0;
        private _dir = [cos _degrees,sin _degrees,0];
        private _target =  _loc vectorAdd (_dir vectorMultiply _distance);

        private _fireRate = _unit call EFUNC(Firemission,ArtGetFireRate);
        [_unit , true] call EFUNC(Firemission,SetArtyReadyStatus);

        private _rounds = (_roundClassName);
        _unit setVariable [QEGVAR(Firemission,ArtFMText),_this call EFUNC(Firemission,GetPolarSpottingFiremissionText),true];

        sleep((_unit call EFUNC(Firemission,GetArtyAimTime)));
        _randomPos = [[[_target, _unit getVariable [QEGVAR(Firemission,ArtSpotAccuracy),MEANSPOTTINGACCURACY]]],[]] call BIS_fnc_randomPos;
            _eta = [_unit,_randomPos, _roundClassName] call EFUNC(Firemission,GetArtyEta);
        _unit commandArtilleryFire [_randomPos,  _roundClassName, 1];
        _waitTime = (_fireRate * (_unit getVariable [QEGVAR(Firemission,ArtFireRate),MEANFIRERATE]));
        sleep(_waitTime);
        [_unit,objNULL] call EFUNC(Firemission,SetArtyCaller);
        [_unit, false] call EFUNC(Firemission,SetArtyReadyStatus);
    };