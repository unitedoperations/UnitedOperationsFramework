#include "..\..\..\Global\defs.hpp"
private _requester  = _this select 0;
    private    _selectedUnit = _this select 1;
    private _grid = _this select 2;
    private _selectedAmmo = _this select 3;
    private _guns = _requester getVariable [VAR_SART_OBSGUNS,[]];

    [_selectedUnit,_requester] call UO_FW_fnc_SetArtyCaller;
    [_selectedUnit,[_grid,true] call CBA_fnc_mapGridToPos,_selectedAmmo]   call UO_FW_fnc_GridSpottingFiremission;