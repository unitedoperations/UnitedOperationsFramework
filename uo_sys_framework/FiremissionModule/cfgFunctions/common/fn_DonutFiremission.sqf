#include "..\..\Global\defs.hpp"
if (isServer) then {
        _handle = _this spawn {
            private _unit = _this select 0;
            private _target = _this select 1;
            private _innerRadius = _this select 2;
            private _outerRadius = _this select 3;
            private _salvoCount = _this select 4;
            private _salvoSize = _this select 5;
            private _salvoWait = _this select 6;
            private _minSpottedDistance = _this select 7;
            private _roundClassName = _this select 8;
            private _fireRate = _unit call EFUNC(Firemission,ArtGetFireRate);

            [_unit , true] call EFUNC(Firemission,SetArtyReadyStatus);
            _unit setVariable [QEGVAR(Firemission,ArtFMText),_this call EFUNC(Firemission,GetDonutFiremissionText),true];
            [_unit, 0,_salvoCount * _salvoSize] call EFUNC(Firemission,SetArtyFiremissionRoundsRequired);
            [_unit,_target,_roundClassName ] call EFUNC(Firemission,InternalSpottingFiremission);
                //spotting rounds finished
                sleep((_unit getVariable [QEGVAR(Firemission,ArtCalcSpeed),MEANCALCULATIONTIME]) + 1);
                for "_i" from 0 to _salvoCount do {


                        _randomPos = [[[_target, _outerRadius]],[[_target, _innerRadius]]] call BIS_fnc_randomPos;
                        [_unit,_randomPos,0,_salvoSize,_roundClassName] call EFUNC(Firemission,InternalFiremission);
                        [_unit, ((_unit getVariable [QEGVAR(Firemission,ArtRoundsFired),[0,0]]) select 0) + _salvoSize,_salvoCount * _salvoSize] call EFUNC(Firemission,SetArtyFiremissionRoundsRequired);
                        sleep(((_fireRate * (_unit getVariable [QEGVAR(Firemission,ArtFireRate),MEANFIRERATE])) * _salvoSize) max _salvoWait);
                };
                [_unit,objNULL] call EFUNC(Firemission,SetArtyCaller);
                [_unit, false] call EFUNC(Firemission,SetArtyReadyStatus);
                [_unit, 0,0] call EFUNC(Firemission,SetArtyFiremissionRoundsRequired);
        };

        (_this select 0) setVariable [QEGVAR(Firemission,ArtHandle),_handle,true];
    };