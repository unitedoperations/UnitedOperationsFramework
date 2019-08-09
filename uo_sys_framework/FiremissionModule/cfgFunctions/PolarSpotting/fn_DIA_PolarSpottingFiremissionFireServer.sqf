#include "..\..\Global\defs.hpp"
    private _requester  = _this select 0;
    private _selectedUnit = _this select 1;
    private _callGrid = _this select 2;
    private _mils = _this select 3;
    private _distance = _this select 4;
    private _roundType = _this select 5;

    private _guns = _requester getVariable [QEGVAR(Firemission,ObsGuns),[]];

    [_selectedUnit,_requester] call EFUNC(Firemission,SetArtyCaller);
    [_selectedUnit,[_callGrid,true] call CBA_fnc_mapGridToPos,_mils,_distance,_roundType]   call EFUNC(Firemission,PolarSpottingFiremission);