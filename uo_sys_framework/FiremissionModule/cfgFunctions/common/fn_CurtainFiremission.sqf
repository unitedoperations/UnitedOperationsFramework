#include "..\..\Global\defs.hpp"
if (isServer) then {
_handle = _this spawn {
        private _unit = _this select 0;
        {
            _tempArray = _this;
            _tempArray set [0,_x];
            _x setVariable [QEGVAR(Firemission,ArtFMText),_tempArray call EFUNC(Firemission,GetCurtainFiremissionText),true];
                [_x , true] call EFUNC(Firemission,SetArtyReadyStatus);
        } forEach _unit;
        private _startPoint = _this select 1;
        private _endPoint = _this select 2;
        private _width = _this select 3;
        private _salvoCount = _this select 4;
        private _salvoSize = _this select 5;
        private _salvoWait = _this select 6;
        private _minSpottedDistance = _this select 7;

        private _roundClassName = _this select 8;
        {
            [_x , true] call EFUNC(Firemission,SetArtyReadyStatus);
            _x setVariable [QEGVAR(Firemission,ArtFMText),_this call EFUNC(Firemission,GetPointFiremissionText),true];
            [_x, 0,_salvoCount * _salvoSize] call EFUNC(Firemission,SetArtyFiremissionRoundsRequired);
        } forEach _unit;
        private _fireRate = [];
        sleep(((_unit  select 0) call EFUNC(Firemission,GetArtyAimTime)));
        private _dis = 1000;
        private _tempAcc = ((_unit select 0) getVariable [QEGVAR(Firemission,ArtSpotAccuracy),MEANSPOTTINGACCURACY]) + 1;
        private _dir = _endPoint vectorDiff  _startPoint;
        _dir = _dir vectorMultiply (1 /_salvoCount);

        private _rightDir = (vectorNormalized _dir) vectorCrossProduct [0,1,0];
        private _leftDir = [0,0,0] vectorDiff _rightDir;
        private _interval = _width / (count _unit);
        private _startingSpots = [];
        private _leftEdge = _startPoint vectorAdd (_leftDir vectorMultiply (_width / 2));
        private _tempCount = 0;
        {
                _startingSpots pushBack (_leftEdge vectorAdd (_rightDir vectorMultiply  (_tempCount * _interval)));
                _fireRate pushBack (_x call EFUNC(Firemission,ArtGetFireRate));
                _tempCount = _tempCount + 1;
        } forEach _unit;

        [_unit,_startPoint,_roundClassName ] call EFUNC(Firemission,InternalSpottingFiremission);
        //spotting rounds finished


        sleep((_unit getVariable [QEGVAR(Firemission,ArtCalcSpeed),MEANCALCULATIONTIME]) + 1);
        for [{_i = 0}, {_i < _salvoCount}, {_i = _i + 1}] do {
                _row = 0;
                {
                        [_unit,(_startingSpots select _row) vectorAdd (_dir vectorMultiply _i),0,_salvoSize,_roundClassName,_fireRate] call EFUNC(Firemission,InternalFiremission);
                        [_x, ((_x getVariable [QEGVAR(Firemission,ArtRoundsFired),[0,0]]) select 1) + _salvoSize,_salvoCount * _salvoSize] call EFUNC(Firemission,SetArtyFiremissionRoundsRequired);
                        _row = _row + 1;
                } forEach _unit;
                    sleep(_fireRate max _salvoWait);
        };
        {
                [_x, 0,0] call EFUNC(Firemission,SetArtyFiremissionRoundsRequired);
                [_x , false] call EFUNC(Firemission,SetArtyReadyStatus);
                [_x,objNULL] call EFUNC(Firemission,SetArtyCaller);
        } forEach _unit;

    };
    {
        _x setVariable [QEGVAR(Firemission,ArtHandle),_handle,true];
    } forEach (_this select 0);