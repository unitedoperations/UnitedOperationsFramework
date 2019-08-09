#include "..\..\Global\defs.hpp"
_guns = player getVariable [QEGVAR(Firemission,ObsGuns),[]];
     _selectedUnit = _guns select (lbValue [DFM_DIA_IDC_GUNSELECT,lbCurSel DFM_DIA_IDC_GUNSELECT]);
    _selectedAmmo = lbData [DFM_DIA_IDC_SHELLSELECT, lbCurSel DFM_DIA_IDC_SHELLSELECT];
    _grid =     ctrlText DFM_DIA_IDC_GRID;
    _innerRadius = (ctrlText DFM_DIA_IDC_INNERRADIUS) call BIS_fnc_parseNumber;
    _outerRadius = (ctrlText DFM_DIA_IDC_OUTERRADIUS) call BIS_fnc_parseNumber;
     _salvoNumber = (ctrlText DFM_DIA_IDC_BURSTNUMBER) call BIS_fnc_parseNumber;
    _salvoRounds = (ctrlText DFM_DIA_IDC_BURSTROUNDS) call BIS_fnc_parseNumber;
    _salvoDelay = (ctrlText DFM_DIA_IDC_BURSTDELAY) call BIS_fnc_parseNumber;
    _spotting =  (ctrlText DFM_DIA_IDC_SPOTTING) call BIS_fnc_parseNumber;
    _inputIsCorrect = true;
    _inputIsCorrect = _inputIsCorrect && [_selectedUnit,"No Arty selected/aviable"] call EFUNC(Firemission,InputIsUnit);
    _inputIsCorrect = _inputIsCorrect && [_innerRadius,"Inner radius is not a number"] call EFUNC(Firemission,InputIsNumber);
    _inputIsCorrect = _inputIsCorrect && [_outerRadius,"Outer radius is not a number"] call EFUNC(Firemission,InputIsNumber);
    _inputIsCorrect = _inputIsCorrect && [_salvoNumber,"Salvo number is not a number"] call EFUNC(Firemission,InputIsNumber);
    _inputIsCorrect = _inputIsCorrect && [_salvoRounds,"Salvo rounds is not a number"] call EFUNC(Firemission,InputIsNumber);
    _inputIsCorrect = _inputIsCorrect && [_salvoDelay,"Salvo delay is not a number"] call EFUNC(Firemission,InputIsNumber);
    _inputIsCorrect = _inputIsCorrect && [_spotting,"Spotting distance is not a number"] call EFUNC(Firemission,InputIsNumber);
    if (_innerRadius > _outerRadius) then {_inputIsCorrect = false;hint "Inner Radius bigger than outer."};
    if (_inputIsCorrect) then {

                                hint (([_selectedUnit,_grid call CBA_fnc_mapGridToPos,_innerRadius,_outerRadius,_salvoNumber,_salvoRounds,_salvoDelay,_spotting,_selectedAmmo] call EFUNC(Firemission,GetDonutFiremissionText))
                                    + "Requested by:" + (name player)
                                    + "\nETA: " + str (round ((_selectedUnit call EFUNC(Firemission,GetArtyAimTime)) + ([_selectedUnit,[_grid,true] call CBA_fnc_mapGridToPos,_selectedAmmo] call EFUNC(Firemission,GetArtyEta)))) + " s");
                                    [QEGVAR(Firemission,CallDonutFiremission), [player,_selectedUnit,_selectedAmmo,_grid,_innerRadius,_outerRadius,_salvoNumber,_salvoRounds,_salvoDelay,_spotting]] call CBA_fnc_serverEvent;
                                [] call EFUNC(DonutFiremission,DIA_DonutFiremissionCloseDialog);

    };




