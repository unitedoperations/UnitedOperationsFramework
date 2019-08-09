#include "..\..\Global\defs.hpp"
private _id = _this select 0;
private _gun = _this select 1;
if (_gun >= 0) then {
    _guns = player getVariable [QEGVAR(Firemission,ObsGuns),[]];
    _usableGuns = [];
    {
        if (_x call EFUNC(Firemission,isArtyAviable)) then {
            _usableGuns pushBack _x;
        };
    } forEach _guns;
    
    _actualGunUnit = _usableGuns select _gun;
    lbClear _id;
    _ammo =  magazinesAmmo _actualGunUnit;

    {
        _text = (str (_x select 1)) + "x " + getText (configfile / "CfgMagazines" / (_x select 0) / "displayName");
        lbAdd [_id, _text];
        lbSetData [_id, _forEachIndex, (_x select 0)];

    } forEach _ammo;
    lbSetCurSel [_id,0];
};