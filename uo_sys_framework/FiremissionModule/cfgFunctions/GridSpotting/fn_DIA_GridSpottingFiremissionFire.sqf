#include "..\..\Global\defs.hpp"
private _guns = player getVariable [QEGVAR(Firemission,ObsGuns),[]];
     _selectedUnit = _guns select (lbValue [GSFM_DIA_IDC_GUNSELECT,lbCurSel GSFM_DIA_IDC_GUNSELECT]);
    _selectedAmmo = lbData [GSFM_DIA_IDC_SHELLSELECT, lbCurSel GSFM_DIA_IDC_SHELLSELECT];
    private _grid =     ctrlText GSFM_DIA_IDC_GRID;
    private _pos = [_grid,true] call CBA_fnc_mapGridToPos;
    if (_selectedUnit isEqualTo objNull) then  {hint "No Arty selected/aviable";}
    else
    {
        hint (([_selectedUnit,_pos,_selectedAmmo] call EFUNC(Firemission,GetGridSpottingFiremissionText))
                                + "Requested by: " + (name player)
                                + "\nETA: " + str (round ((_selectedUnit call EFUNC(Firemission,GetArtyAimTime)) + ([_selectedUnit,_pos,_selectedAmmo] call EFUNC(Firemission,GetArtyEta)))) + " s");
                    [QEGVAR(Firemission,CallGridSpottingFiremission), [player,_selectedUnit,_grid,_selectedAmmo]] call CBA_fnc_serverEvent;
        [] call EFUNC(GridSpottingFiremission,DIA_GridSpottingFiremissionCloseDialog);

    };



