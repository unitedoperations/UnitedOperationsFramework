#include "..\..\Global\defs.hpp"
    private _unit = _this select 0;
    private _target = _this select 1;
    private _dispersion = _this select 2;
    private _salvoSize = _this select 3;
    private _roundClassName = _this select 4;
    private _fireRate = _this select 5;
    _unit call EFUNC(Firemission,AddEventHandler);
    _unit call EFUNC(Firemission,InternalRepackArtilleryMagazines);
    private _hasAmmunition = false;
    {
        if (_x select 0 == _roundClassName) then {
                _hasAmmunition = true;
                _salvoSize = _salvoSize min (_x select 1);
        };
    } forEach (magazinesAmmo _unit);
    private _ammoClass = getText (configFile >> "CfgMagazines" >> _roundClassName >> "ammo");
    if (_hasAmmunition) then {
       
        for [{_i = 0}, {_i < _salvoSize}, {_i = _i + 1}] do {
             _randomPos = [[[_target, _dispersion]],[]] call BIS_fnc_randomPos;
             _randomPos =    [[[_randomPos, _unit getVariable[QEGVAR(Firemission,ArtAccuracy),MEANPlOTTEDACCURACY]]],[]] call BIS_fnc_randomPos;
            _mortarStrike = _ammoClass createVehicle [_randomPos # 0,_randomPos # 1,450];
			_mortarStrike setVelocity [0, 0, -225];
            sleep(_fireRate)
        };
    };