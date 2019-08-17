#include "..\..\Global\defs.hpp"
private _unit = _this select 0;
private _target = _this select 1;
private _roundClassName = _this select 2;
_unit call EFUNC(Firemission,AddEventHandler);
sleep((_unit call EFUNC(Firemission,GetArtyAimTime)));
private _dis = 1000;
private _minSpottedDistance = _this select 3;
private _tempAcc = (_unit getVariable [QEGVAR(Firemission,ArtSpotAccuracy),MEANSPOTTINGACCURACY]) + 1;
private _ammoClass = getText (configFile >> "CfgMagazines" >> _roundClassName >> "ammo");
if(_dis >_minSpottedDistance && SPOTTINGROUNDSREQUIRED) then {
    if((_unit getVariable [QEGVAR(Firemission,ArtAllowChat),false])) then {
        _msg1 	= (_unit call EFUNC(Firemission,GetArtyDisplayName)) + ": Firing Spotting Rounds";
        [QGVAR(Event_FireMessage),[[1,_msg1,side _unit]]] call CBA_fnc_globalEvent;
    };
    while{(_dis >_minSpottedDistance && SPOTTINGROUNDSREQUIRED )} do {
        _randomPos = [[[_target, _tempAcc]],[]] call BIS_fnc_randomPos;
        _dis = _randomPos distance2D _target;
        _eta = [_unit,_randomPos, _roundClassName] call EFUNC(Firemission,GetArtyEta);
        _mortarStrike = _ammoClass createVehicle [_randomPos # 0,_randomPos # 1,450];
		_mortarStrike setVelocity [0, 0, -225];
        if((_unit getVariable [QEGVAR(Firemission,ArtAllowChat),false])) then {
            _msg1 	= (_unit call EFUNC(Firemission,GetArtyDisplayName)) + ": Spotting Shot, Observe";
            [QGVAR(Event_FireMessage),[[1,_msg1,side _unit]]] call CBA_fnc_globalEvent;
        };

        _waitTime = (_fireRate max _eta);

        sleep(_waitTime max ((_unit getVariable [QEGVAR(Firemission,ArtAimSpeed),MEANAIMTIME]) + 1));
        _tempAcc = [_dis,_tempAcc] call EFUNC(Firemission,GetNewAccuracy);

    };
};   
    