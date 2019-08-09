#include "..\..\Global\defs.hpp"
#define COMPONENT Firemission
#include "\x\UO_FW\addons\Main\script_macros.hpp"

private _guns = player getVariable [QEGVAR(Firemission,ObsGuns),[]];
 _selectedUnit = _guns select (lbValue [PSFM_DIA_IDC_GUNSELECT,lbCurSel PSFM_DIA_IDC_GUNSELECT]);
_selectedAmmo = lbData [PSFM_DIA_IDC_SHELLSELECT, lbCurSel PSFM_DIA_IDC_SHELLSELECT];
private _grid =     ctrlText PSFM_DIA_IDC_GRID;
private _mils = (ctrlText PSFM_DIA_IDC_MILS) call BIS_fnc_parseNumber;
private _distance =  (ctrlText PSFM_DIA_IDC_DISTANCE) call BIS_fnc_parseNumber;
if (_selectedUnit isEqualTo objNull) then {
    hint "No Arty selected/aviable";
} else {
    hint (([_selectedUnit,[_grid,true] call CBA_fnc_mapGridToPos,_mils,_distance,_selectedAmmo] call EFUNC(Firemission,GetPolarSpottingFiremissionText))
    + "Requested by: " + (name player)
    + "\nETA: " + str (round ((_selectedUnit call EFUNC(Firemission,GetArtyAimTime)) + ([_selectedUnit,[_grid,true] call CBA_fnc_mapGridToPos,_selectedAmmo] call EFUNC(Firemission,GetArtyEta)))) + " s");
    [QEGVAR(Firemission,CallPolarSpottingFiremission), [player,_selectedUnit,_grid,_mils,_distance,_selectedAmmo]] call CBA_fnc_serverEvent;
    [] call EFUNC(PolarSpottingFiremission,DIA_PolarSpottingFiremissionCloseDialog);
};
