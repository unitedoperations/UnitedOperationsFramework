#include "..\..\Global\defs.hpp"
private _unit = _this select 0;
    private _target = _this select 1;
    private _dispersion = _this select 2;
    private _salvoSize = _this select 3;
    private _roundClassName = _this select 4;
    _unit call EFUNC(Firemission,InternalRepackArtilleryMagazines);
    private _hasAmmunition = false;
    {
        if (_x select 0 == _roundClassName) then {
                _hasAmmunition = true;
                _salvoSize = _salvoSize min (_x select 1);
        };
    } forEach (magazinesAmmo _unit);
    if (_hasAmmunition) then {
        _randomPos = [[[_target, _dispersion]],[]] call BIS_fnc_randomPos;
        _randomPos =    [[[_randomPos, _unit getVariable[QEGVAR(Firemission,ArtAccuracy),MEANPlOTTEDACCURACY]]],[]] call BIS_fnc_randomPos;
        _unit commandArtilleryFire [_randomPos,  _roundClassName, _salvoSize];
    };