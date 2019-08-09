#include "..\..\Global\defs.hpp"
_guns = player getVariable [QEGVAR(Firemission,ObsGuns),[]];
     _selectedUnit = _guns select (lbValue [POFM_DIA_IDC_GUNSELECT,lbCurSel POFM_DIA_IDC_GUNSELECT]);
    _selectedAmmo = lbData [POFM_DIA_IDC_SHELLSELECT, lbCurSel POFM_DIA_IDC_SHELLSELECT];
    _grid =     ctrlText POFM_DIA_IDC_GRID;
    _mils =     (ctrlText POFM_DIA_IDC_MILS) call BIS_fnc_parseNumber;
    _distance =     (ctrlText POFM_DIA_IDC_DISTANCE) call BIS_fnc_parseNumber;
    _dispersion = (ctrlText POFM_DIA_IDC_DISPERSION) call BIS_fnc_parseNumber;
     _salvoNumber = (ctrlText POFM_DIA_IDC_BURSTNUMBER) call BIS_fnc_parseNumber;
    _salvoRounds = (ctrlText POFM_DIA_IDC_BURSTROUNDS) call BIS_fnc_parseNumber;
    _salvoDelay = (ctrlText POFM_DIA_IDC_BURSTDELAY) call BIS_fnc_parseNumber;
    _spotting =  (ctrlText POFM_DIA_IDC_SPOTTING) call BIS_fnc_parseNumber;
    //this can be made smaller with some bool magic
    _inputIsCorrect = true;
    _inputIsCorrect = _inputIsCorrect && [_selectedUnit,"No Arty selected/aviable"] call EFUNC(Firemission,InputIsUnit);
    _inputIsCorrect = _inputIsCorrect && [_mils,"Mils is not a number"] call EFUNC(Firemission,InputIsNumber);
    _inputIsCorrect = _inputIsCorrect && [_distance,"Distance is not a number"] call EFUNC(Firemission,InputIsNumber);
    _inputIsCorrect = _inputIsCorrect && [_dispersion,"Dispersion is not a number"] call EFUNC(Firemission,InputIsNumber);
    _inputIsCorrect = _inputIsCorrect && [_salvoNumber,"Salvo number is not a number"] call EFUNC(Firemission,InputIsNumber);
    _inputIsCorrect = _inputIsCorrect && [_salvoRounds,"Salvo rounds is not a number"] call EFUNC(Firemission,InputIsNumber);
    _inputIsCorrect = _inputIsCorrect && [_salvoDelay,"Salvo delay is not a number"] call EFUNC(Firemission,InputIsNumber);
    _inputIsCorrect = _inputIsCorrect && [_spotting,"Spotting distance is not a number"] call EFUNC(Firemission,InputIsNumber);

    if (_inputIsCorrect) then {
        hint (([_selectedUnit,[_grid,true] call CBA_fnc_mapGridToPos,_mils,_distance,_dispersion,_salvoNumber,_salvoRounds,_salvoDelay,_spotting,_selectedAmmo] call EFUNC(Firemission,GetPolarFiremissionText))
                                    + "Requested by: " + (name player)
                                    + "\nETA: " + str (round ((_selectedUnit call EFUNC(Firemission,GetArtyAimTime)) + ([_selectedUnit,[_grid,true] call CBA_fnc_mapGridToPos,_selectedAmmo] call EFUNC(Firemission,GetArtyEta))))  + " s");

        [QEGVAR(Firemission,CallPolarFiremission), [player,_selectedUnit,_selectedAmmo,_grid,_mils,_distance,_dispersion,_salvoNumber,_salvoRounds,_salvoDelay,_spotting]] call CBA_fnc_serverEvent;
        [] call EFUNC(PolarFiremission,DIA_PolarFiremissionCloseDialog);

    };