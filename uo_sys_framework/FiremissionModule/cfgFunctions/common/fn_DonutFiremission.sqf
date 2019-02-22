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
            private _roundType = _this select 8;
            private _roundClassName = ((_unit call UO_FW_fnc_GetArtyAmmo) select _roundType) select 0 ;
            private _fireRate = _unit call UO_FW_fnc_ArtGetFireRate;

            [_unit , true] call UO_FW_fnc_SetArtyReadyStatus;
            _unit setVariable [VAR_SART_ARTFMTEXT,_this call UO_FW_fnc_GetDonutFiremissionText,true];
            [_unit, 0,_salvoCount * _salvoSize] call UO_FW_fnc_SetArtyFiremissionRoundsRequired;
            [_unit,_target,_roundClassName ] call UO_FW_fnc_InternalSpottingFiremission;
                //spotting rounds finished
                sleep( (_unit getVariable [VAR_SART_ARTCALCSPEED,MEANCALCULATIONTIME]) + 1);
                for "_i" from 0 to _salvoCount do {


                        _randomPos = [[[_target, _outerRadius]],[[_target, _innerRadius]]] call BIS_fnc_randomPos;
                        [_unit,_randomPos,0,_salvoSize,_roundClassName] call UO_FW_fnc_InternalFiremission;
                        [_unit, ((_unit getVariable [VAR_SART_ARTROUNDSFIRED,[0,0]]) select 0) + _salvoSize,_salvoCount * _salvoSize] call UO_FW_fnc_SetArtyFiremissionRoundsRequired;
                        sleep(((_fireRate * (_unit getVariable [VAR_SART_ARTFIRERATE,MEANFIRERATE]) ) * _salvoSize) max _salvoWait);
                };
                [_unit,objNULL] call UO_FW_fnc_SetArtyCaller;
                [_unit, false] call UO_FW_fnc_SetArtyReadyStatus;
                [_unit, 0,0] call UO_FW_fnc_SetArtyFiremissionRoundsRequired;
        };

        (_this select 0) setVariable [VAR_SART_FMHANDLE,_handle,true];
    };