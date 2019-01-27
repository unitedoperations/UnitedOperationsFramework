#include "..\..\..\Global\defs.hpp"
_guns = player getVariable [VAR_SART_OBSGUNS,[]];
_usableGuns = [];
{
    if (_x call UO_FW_fnc_IsArtyAviable) then {
        _usableGuns pushBack _x;
    };
} forEach _guns;
_selectedUnit = objNull;
    if ((count _usableGuns) > 0) then { _selectedUnit = (_usableGuns select (lbCurSel PFM_DIA_IDC_GUNSELECT));};
_selectedAmmo = lbCurSel PFM_DIA_IDC_SHELLSELECT;
_grid =     ctrlText PFM_DIA_IDC_GRID;
_dispersion = ( ctrlText PFM_DIA_IDC_DISPERSION) call BIS_fnc_parseNumber;
_salvoNumber = (ctrlText PFM_DIA_IDC_BURSTNUMBER) call BIS_fnc_parseNumber;
_salvoRounds = (ctrlText PFM_DIA_IDC_BURSTROUNDS) call BIS_fnc_parseNumber;
_salvoDelay = (ctrlText PFM_DIA_IDC_BURSTDELAY) call BIS_fnc_parseNumber;
_spotting =  (ctrlText PFM_DIA_IDC_SPOTTING) call BIS_fnc_parseNumber;

_inputIsCorrect = true;
_inputIsCorrect = _inputIsCorrect && [_selectedUnit,"No Arty selected/aviable"] call UO_FW_fnc_InputIsUnit;
_inputIsCorrect = _inputIsCorrect && [_dispersion,"Dispersion is not a number"] call UO_FW_fnc_InputIsNumber;
_inputIsCorrect = _inputIsCorrect && [_salvoNumber,"Salvo number is not a number"] call UO_FW_fnc_InputIsNumber;
_inputIsCorrect = _inputIsCorrect && [_salvoRounds,"Salvo rounds is not a number"] call UO_FW_fnc_InputIsNumber;
_inputIsCorrect = _inputIsCorrect && [_salvoDelay,"Salvo delay is not a number"] call UO_FW_fnc_InputIsNumber;
_inputIsCorrect = _inputIsCorrect && [_spotting,"Spotting distance is not a number"] call UO_FW_fnc_InputIsNumber;

if (_inputIsCorrect) then {
                        private _round =  ((_selectedUnit call UO_FW_fnc_GetArtyAmmo) select _selectedAmmo) select 0;
                        hint (([_selectedUnit,[_grid,true] call CBA_fnc_mapGridToPos,_dispersion,_salvoNumber,_salvoRounds,_salvoDelay,_spotting,_selectedAmmo] call UO_FW_fnc_GetPointFiremissionText)
                            + "Requested by: " + (name player)
                            + "\nETA: " + str (round ((_selectedUnit call UO_FW_fnc_GetArtyAimTime) + ([_selectedUnit,[_grid,true] call CBA_fnc_mapGridToPos,_round] call UO_FW_fnc_GetArtyEta)))  + " s");

                        ["CallPointFiremission", [player,_selectedUnit,_selectedAmmo,_grid,_dispersion,_salvoNumber,_salvoRounds,_salvoDelay,_spotting]] call CBA_fnc_serverEvent;
                        [] call UO_FW_fnc_DIA_PointFiremissionCloseDialog;

};
