#include "..\..\Global\defs.hpp"
if (isServer) then {
        _handle = _this spawn {
                private _unit = _this select 0;
                private _targetMarker = _this select 1;
                private _salvoCount = _this select 2;
                private _salvoSize = _this select 3;
                private _salvoWait = _this select 4;
                private _minSpottedDistance = _this select 5;
                private _roundClassName = _this select 6;
                private _fireRate = _unit call EFUNC(Firemission,ArtGetFireRate);
                [_unit , true] call EFUNC(Firemission,SetArtyReadyStatus);
                _unit setVariable [QEGVAR(Firemission,ArtFMText),_this call EFUNC(Firemission,GetPointFiremissionText),true];
                [_unit, 0,_salvoCount * _salvoSize] call EFUNC(Firemission,SetArtyFiremissionRoundsRequired);
                if((_unit getVariable [QEGVAR(Firemission,ArtAllowChat),false])) then {
                   _msg1 	= (_unit call EFUNC(Firemission,GetArtyDisplayName)) + ": Beginning Mission";
                    [QGVAR(Event_FireMessage),[[1,_msg1,side _unit]]] call CBA_fnc_globalEvent;
                };
                //calculateFiremission
                [_unit,_targetMarker,_roundClassName,_minSpottedDistance ] call EFUNC(Firemission,InternalSpottingFiremission);
                //spotting rounds finished
                sleep((_unit getVariable [QEGVAR(Firemission,ArtCalcSpeed),MEANCALCULATIONTIME]) + 1);
                if((_unit getVariable [QEGVAR(Firemission,ArtAllowChat),false])) then {
                    _msg1 	= (_unit call EFUNC(Firemission,GetArtyDisplayName)) + ": Firing On Target";
                    [QGVAR(Event_FireMessage),[[1,_msg1,side _unit]]] call CBA_fnc_globalEvent;
                };
                for [{_i = 0}, {_i < _salvoCount}, {_i = _i + 1}] do {
                        _randomPos = [[_targetMarker],[]] call BIS_fnc_randomPos;
                        [_unit,_randomPos,0,_salvoSize,_roundClassName,_fireRate] call EFUNC(Firemission,InternalFiremission);
                            [_unit, ((_unit getVariable [QEGVAR(Firemission,ArtRoundsFired),[0,0]]) select 0) + _salvoSize,_salvoCount * _salvoSize] call EFUNC(Firemission,SetArtyFiremissionRoundsRequired);
                        sleep(_fireRate max _salvoWait);
                };

                [_unit, false] call EFUNC(Firemission,SetArtyReadyStatus);
                [_unit,objNULL] call EFUNC(Firemission,SetArtyCaller);
                [_unit, 0,0] call EFUNC(Firemission,SetArtyFiremissionRoundsRequired);
                if((_unit getVariable [QEGVAR(Firemission,ArtAllowChat),false])) then {
                   _msg1 	= (_unit call EFUNC(Firemission,GetArtyDisplayName)) + ": Rounds Complete";
                    [QGVAR(Event_FireMessage),[[1,_msg1,side _unit]]] call CBA_fnc_globalEvent;
                };
        };
        (_this select 0) setVariable [QEGVAR(Firemission,ArtHandle),_handle,true];
    };