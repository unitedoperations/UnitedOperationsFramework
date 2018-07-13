#include "x\UO_FW\addons\main\FiremissionModule\Global\defs.hpp"
_guns = player getVariable [VAR_SART_OBSGUNS,[]];
	_usableGuns = [];
	{
		if(_x call UO_FW_FNC_IsArtyAviable) then
		{
			_usableGuns pushBack _x;
		};
	}forEach _guns;
	_selectedUnit = objNull;
	 if((count _usableGuns) > 0) then { _selectedUnit = (_usableGuns select (lbCurSel LFM_DIA_IDC_GUNSELECT));};
	_selectedAmmo = lbCurSel LFM_DIA_IDC_SHELLSELECT;
	_startGrid = 	ctrlText LFM_DIA_IDC_STARTGRID;
	_endGrid =  ctrlText LFM_DIA_IDC_ENDGRID;
 	_burstNumber = (ctrlText LFM_DIA_IDC_BURSTNUMBER) call BIS_fnc_parseNumber;
	_burstRounds = (ctrlText LFM_DIA_IDC_BURSTROUNDS) call BIS_fnc_parseNumber;
	_burstDelay = (ctrlText LFM_DIA_IDC_BURSTDELAY) call BIS_fnc_parseNumber;
	_spotting =  (ctrlText LFM_DIA_IDC_SPOTTING) call BIS_fnc_parseNumber;

	_inputIsCorrect = true;
	_inputIsCorrect = _inputIsCorrect && [_selectedUnit,"No Arty selected/aviable"] call UO_FW_FNC_InputIsUnit;
	_inputIsCorrect = _inputIsCorrect && [_burstNumber,"Burst number is not a number"] call UO_FW_FNC_InputIsNumber;
	_inputIsCorrect = _inputIsCorrect && [_burstRounds,"Burst rounds is not a number"] call UO_FW_FNC_InputIsNumber;
	_inputIsCorrect = _inputIsCorrect && [_burstDelay,"Burst delay is not a number"] call UO_FW_FNC_InputIsNumber;
	_inputIsCorrect = _inputIsCorrect && [_spotting,"Spotting distance is not a number"] call UO_FW_FNC_InputIsNumber;

	if(_inputIsCorrect ) then
	{

						private _round =  ((_selectedUnit call UO_FW_FNC_GetArtyAmmo) select _selectedAmmo) select 0;
						hint (([_selectedUnit,[_startGrid,true] call CBA_fnc_mapGridToPos,[_endGrid,true] call CBA_fnc_mapGridToPos,_burstNumber,_burstRounds,_burstDelay,_spotting,_selectedAmmo] call UO_FW_FNC_GetLineFiremissionText)
							+ "Requested by:" + (name player)
							+ "\nETA: " + str (round ((_selectedUnit call UO_FW_FNC_GetArtyAimTime) + ([_selectedUnit,[_startGrid,true] call CBA_fnc_mapGridToPos,_round] call UO_FW_FNC_GetArtyEta))) + " s");
							["CallLineFiremission", [player,_selectedUnit,_selectedAmmo,_startGrid,_endGrid,_burstNumber,_burstRounds,_burstDelay,_spotting]] call CBA_fnc_serverEvent;
						[] call UO_FW_FNC_DIA_LineFiremissionCloseDialog;
	};



