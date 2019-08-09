#include "..\..\Global\defs.hpp"
_guns = player getVariable [QEGVAR(Firemission,ObsGuns),[]];
    _selectedUnit = _guns select (lbValue [PFM_DIA_IDC_GUNSELECT,lbCurSel PFM_DIA_IDC_GUNSELECT]);
_selectedAmmo = lbData [PFM_DIA_IDC_SHELLSELECT, lbCurSel PFM_DIA_IDC_SHELLSELECT];
_grid =     ctrlText PFM_DIA_IDC_GRID;
_dispersion = (ctrlText PFM_DIA_IDC_DISPERSION) call BIS_fnc_parseNumber;
_salvoNumber = (ctrlText PFM_DIA_IDC_BURSTNUMBER) call BIS_fnc_parseNumber;
_salvoRounds = (ctrlText PFM_DIA_IDC_BURSTROUNDS) call BIS_fnc_parseNumber;
_salvoDelay = (ctrlText PFM_DIA_IDC_BURSTDELAY) call BIS_fnc_parseNumber;
_spotting =  (ctrlText PFM_DIA_IDC_SPOTTING) call BIS_fnc_parseNumber;

_inputIsCorrect = true;
_inputIsCorrect = _inputIsCorrect && [_selectedUnit,"No Arty selected/aviable"] call EFUNC(Firemission,InputIsUnit);
_inputIsCorrect = _inputIsCorrect && [_dispersion,"Dispersion is not a number"] call EFUNC(Firemission,InputIsNumber);
_inputIsCorrect = _inputIsCorrect && [_salvoNumber,"Salvo number is not a number"] call EFUNC(Firemission,InputIsNumber);
_inputIsCorrect = _inputIsCorrect && [_salvoRounds,"Salvo rounds is not a number"] call EFUNC(Firemission,InputIsNumber);
_inputIsCorrect = _inputIsCorrect && [_salvoDelay,"Salvo delay is not a number"] call EFUNC(Firemission,InputIsNumber);
_inputIsCorrect = _inputIsCorrect && [_spotting,"Spotting distance is not a number"] call EFUNC(Firemission,InputIsNumber);
INFO((str _selectedUnit));
INFO((str _selectedAmmo));
_val = (str (lbValue [PFM_DIA_IDC_GUNSELECT,lbCurSel PFM_DIA_IDC_GUNSELECT]));
_data = (str (lbData [PFM_DIA_IDC_GUNSELECT,lbCurSel PFM_DIA_IDC_GUNSELECT]));
INFO_1("%1",_data);
INFO_1("%1",_val);

if (_inputIsCorrect) then {
                        hint (([_selectedUnit,[_grid,true] call CBA_fnc_mapGridToPos,_dispersion,_salvoNumber,_salvoRounds,_salvoDelay,_spotting,_selectedAmmo] call EFUNC(Firemission,GetPointFiremissionText))
                            + "Requested by: " + (name player)
                            + "\nETA: " + str (round ((_selectedUnit call EFUNC(Firemission,GetArtyAimTime)) + ([_selectedUnit,[_grid,true] call CBA_fnc_mapGridToPos,_selectedAmmo] call EFUNC(Firemission,GetArtyEta))))  + " s");

                        [QEGVAR(Firemission,CallPointFiremission), [player,_selectedUnit,_selectedAmmo,_grid,_dispersion,_salvoNumber,_salvoRounds,_salvoDelay,_spotting]] call CBA_fnc_serverEvent;
                        [] call EFUNC(PointFiremission,DIA_PointFiremissionCloseDialog);

};
