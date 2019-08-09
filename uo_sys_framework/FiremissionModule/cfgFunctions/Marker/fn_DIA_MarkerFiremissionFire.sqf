#include "..\..\Global\defs.hpp"
_guns = player getVariable [QEGVAR(Firemission,ObsGuns),[]];
     _selectedUnit = _guns select (lbValue [MFM_DIA_IDC_GUNSELECT,lbCurSel MFM_DIA_IDC_GUNSELECT]);
    _selectedAmmo = lbData [MFM_DIA_IDC_SHELLSELECT, lbCurSel MFM_DIA_IDC_SHELLSELECT];
private _name = ctrlText MFM_DIA_IDC_NAME;
private _dispersion = (ctrlText MFM_DIA_IDC_DISPERSION) call BIS_fnc_parseNumber;
private _salvoNumber = (ctrlText MFM_DIA_IDC_BURSTNUMBER) call BIS_fnc_parseNumber;
private _salvoRounds = (ctrlText MFM_DIA_IDC_BURSTROUNDS) call BIS_fnc_parseNumber;
private _salvoDelay = (ctrlText MFM_DIA_IDC_BURSTDELAY) call BIS_fnc_parseNumber;
private _spotting =  (ctrlText MFM_DIA_IDC_SPOTTING) call BIS_fnc_parseNumber;

_inputIsCorrect = true;
_inputIsCorrect = _inputIsCorrect && [_selectedUnit,"No Arty selected/aviable"] call EFUNC(Firemission,InputIsUnit);
_inputIsCorrect = _inputIsCorrect && [_dispersion,"Dispersion is not a number"] call EFUNC(Firemission,InputIsNumber);
_inputIsCorrect = _inputIsCorrect && [_salvoNumber,"Salvo number is not a number"] call EFUNC(Firemission,InputIsNumber);
_inputIsCorrect = _inputIsCorrect && [_salvoRounds,"Salvo rounds is not a number"] call EFUNC(Firemission,InputIsNumber);
_inputIsCorrect = _inputIsCorrect && [_salvoDelay,"Salvo delay is not a number"] call EFUNC(Firemission,InputIsNumber);
_inputIsCorrect = _inputIsCorrect && [_spotting,"Spotting distance is not a number"] call EFUNC(Firemission,InputIsNumber);
private _marker = _name call EFUNC(Firemission,FindMarkerOnMap);
if (_marker == "") then { _inputIsCorrect = false;hint "marker does not exist";    };
if (_inputIsCorrect) then {

                        hint (([_selectedUnit,_name,_dispersion,_salvoNumber,_salvoRounds,_salvoDelay,_spotting,_selectedAmmo] call EFUNC(Firemission,GetMarkerFiremissionText))
                            + "Requested by:" + (name player)
                            + "\nETA: " + str (round ((_selectedUnit call EFUNC(Firemission,GetArtyAimTime)) + ([_selectedUnit,getMarkerPos (_marker),_selectedAmmo] call EFUNC(Firemission,GetArtyEta)))) + " s");
                        [QEGVAR(Firemission,CallMarkerFiremission),  [player,_selectedUnit,_name,_dispersion,_salvoNumber,_salvoRounds,_salvoDelay,_spotting,_selectedAmmo]] call CBA_fnc_serverEvent;
                        [] call EFUNC(MarkerFiremission,DIA_MarkerFiremissionCloseDialog);

};