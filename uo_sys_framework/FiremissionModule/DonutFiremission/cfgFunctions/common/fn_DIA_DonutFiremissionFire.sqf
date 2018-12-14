#include "..\..\..\Global\defs.hpp"
_guns = player getVariable [VAR_SART_OBSGUNS,[]];
	_usableGuns = [];
	{
		if(_x call UO_FW_FNC_IsArtyAviable) then
		{
			_usableGuns pushBack _x;
		};
	}forEach _guns;
	_selectedUnit = objNull;
	 if((count _usableGuns) > 0) then { _selectedUnit = (_usableGuns select (lbCurSel DFM_DIA_IDC_GUNSELECT));};
	_selectedAmmo = lbCurSel DFM_DIA_IDC_SHELLSELECT;
	_grid = 	ctrlText DFM_DIA_IDC_GRID;
	_innerRadius = ( ctrlText DFM_DIA_IDC_INNERRADIUS) call BIS_fnc_parseNumber;
	_outerRadius = ( ctrlText DFM_DIA_IDC_OUTERRADIUS) call BIS_fnc_parseNumber;
 	_salvoNumber = (ctrlText DFM_DIA_IDC_BURSTNUMBER) call BIS_fnc_parseNumber;
	_salvoRounds = (ctrlText DFM_DIA_IDC_BURSTROUNDS) call BIS_fnc_parseNumber;
	_salvoDelay = (ctrlText DFM_DIA_IDC_BURSTDELAY) call BIS_fnc_parseNumber;
	_spotting =  (ctrlText DFM_DIA_IDC_SPOTTING) call BIS_fnc_parseNumber;
	_inputIsCorrect = true;
	_inputIsCorrect = _inputIsCorrect && [_selectedUnit,"No Arty selected/aviable"] call UO_FW_FNC_InputIsUnit;
	_inputIsCorrect = _inputIsCorrect && [_innerRadius,"Inner radius is not a number"] call UO_FW_FNC_InputIsNumber;
	_inputIsCorrect = _inputIsCorrect && [_outerRadius,"Outer radius is not a number"] call UO_FW_FNC_InputIsNumber;
	_inputIsCorrect = _inputIsCorrect && [_salvoNumber,"Salvo number is not a number"] call UO_FW_FNC_InputIsNumber;
	_inputIsCorrect = _inputIsCorrect && [_salvoRounds,"Salvo rounds is not a number"] call UO_FW_FNC_InputIsNumber;
	_inputIsCorrect = _inputIsCorrect && [_salvoDelay,"Salvo delay is not a number"] call UO_FW_FNC_InputIsNumber;
	_inputIsCorrect = _inputIsCorrect && [_spotting,"Spotting distance is not a number"] call UO_FW_FNC_InputIsNumber;
	if(_innerRadius > _outerRadius) then {_inputIsCorrect = false;hint "Inner Radius bigger than outer."};
	if(_inputIsCorrect ) then
	{

								private _round =  ((_selectedUnit call UO_FW_FNC_GetArtyAmmo) select _selectedAmmo) select 0;
								hint (([_selectedUnit,_grid call CBA_fnc_mapGridToPos,_innerRadius,_outerRadius,_salvoNumber,_salvoRounds,_salvoDelay,_spotting,_selectedAmmo] call UO_FW_FNC_GetDonutFiremissionText)
									+ "Requested by:" + (name player)
									+ "\nETA: " + str (round ((_selectedUnit call UO_FW_FNC_GetArtyAimTime) + ([_selectedUnit,[_grid,true] call CBA_fnc_mapGridToPos,_round] call UO_FW_FNC_GetArtyEta))) + " s");
									["CallDonutFiremission", [player,_selectedUnit,_selectedAmmo,_grid,_innerRadius,_outerRadius,_salvoNumber,_salvoRounds,_salvoDelay,_spotting]] call CBA_fnc_serverEvent;
								[] call UO_FW_FNC_DIA_DonutFiremissionCloseDialog;

	};




