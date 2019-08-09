#include "..\..\Global\defs.hpp"
private _requester  = _this select 0;
    private _selectedUnit = _this select 1;
    private _selectedAmmo = _this select 2;
    private _grid = _this select 3;
    private _dispersion = _this select 4;
    private _salvoNumber = _this select 5;
    private _salvoRounds = _this select 6;
    private _salvoDelay = _this select 7;
    private _spotting =  _this select 8;
    private _guns = _requester getVariable [QEGVAR(Firemission,ObsGuns),[]];

    [_selectedUnit,_requester] call EFUNC(Firemission,SetArtyCaller);
    [_selectedUnit,[_grid,true] call CBA_fnc_mapGridToPos,_dispersion,_salvoNumber,_salvoRounds,_salvoDelay,_spotting,_selectedAmmo]   call EFUNC(Firemission,PointFiremission);