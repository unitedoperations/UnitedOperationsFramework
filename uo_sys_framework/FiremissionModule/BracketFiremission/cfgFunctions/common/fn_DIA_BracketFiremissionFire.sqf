#include "..\..\..\Global\defs.hpp"
_guns = player getVariable [VAR_SART_OBSGUNS,[]];
_usableGuns = [];
{
	if (_x call UO_FW_FNC_IsArtyAviable) then {
		_usableGuns pushBack _x;
	};
}forEach _guns;
_selectedUnit = objNull;
	if ((count _usableGuns) > 0) then { _selectedUnit = (_usableGuns select (lbCurSel BFM_DIA_IDC_GUNSELECT));};
_selectedAmmo = lbCurSel BFM_DIA_IDC_SHELLSELECT;
_startGrid = 	ctrlText BFM_DIA_IDC_STARTGRID;
_endGrid =  ctrlText BFM_DIA_IDC_ENDGRID;
_salvoNumber = (ctrlText BFM_DIA_IDC_BURSTNUMBER) call BIS_fnc_parseNumber;
_salvoRounds = (ctrlText BFM_DIA_IDC_BURSTROUNDS) call BIS_fnc_parseNumber;
_salvoDelay = (ctrlText BFM_DIA_IDC_BURSTDELAY) call BIS_fnc_parseNumber;
_spotting =  (ctrlText BFM_DIA_IDC_SPOTTING) call BIS_fnc_parseNumber;
_inputIsCorrect = true;
_inputIsCorrect = _inputIsCorrect && [_selectedUnit,"No Arty selected/aviable"] call UO_FW_FNC_InputIsUnit;
_inputIsCorrect = _inputIsCorrect && [_salvoNumber,"Salvo number is not a number"] call UO_FW_FNC_InputIsNumber;
_inputIsCorrect = _inputIsCorrect && [_salvoRounds,"Salvo rounds is not a number"] call UO_FW_FNC_InputIsNumber;
_inputIsCorrect = _inputIsCorrect && [_salvoDelay,"Salvo delay is not a number"] call UO_FW_FNC_InputIsNumber;
_inputIsCorrect = _inputIsCorrect && [_spotting,"Spotting distance is not a number"] call UO_FW_FNC_InputIsNumber;

if (_inputIsCorrect ) then {
					private _round =  ((_selectedUnit call UO_FW_FNC_GetArtyAmmo) select _selectedAmmo) select 0;
					hint (([_selectedUnit,[_startGrid,true] call CBA_fnc_mapGridToPos,[_endGrid,true] call CBA_fnc_mapGridToPos,_salvoNumber,_salvoRounds,_salvoDelay,_spotting,_selectedAmmo] call UO_FW_FNC_GetBracketFiremissionText)
						+ "Requested by:" + (name player)
						+ "\nETA: " + str (round ((_selectedUnit call UO_FW_FNC_GetArtyAimTime) + ([_selectedUnit,[_startGrid,true] call CBA_fnc_mapGridToPos,_round] call UO_FW_FNC_GetArtyEta))) + " s");
					["CallBracketFiremission", [player,_selectedUnit,_selectedAmmo,_startGrid,_endGrid,_salvoNumber,_salvoRounds,_salvoDelay,_spotting,_selectedAmmo]] call CBA_fnc_serverEvent;
					[] call UO_FW_FNC_DIA_BracketFiremissionCloseDialog;
};




