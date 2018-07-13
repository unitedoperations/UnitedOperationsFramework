#include "x\UO_FW\addons\main\FiremissionModule\Global\defs.hpp"
_guns = player getVariable [VAR_SART_OBSGUNS,[]];
_usableGuns = [];
{
	if(_x call UO_FW_FNC_IsArtyAviable) then
	{
		_usableGuns pushBack _x;
	};
}forEach _guns;
private _selectedUnit = objNull;
	if((count _usableGuns) > 0) then { _selectedUnit = (_usableGuns select (lbCurSel MFM_DIA_IDC_GUNSELECT));};
private _selectedAmmo = lbCurSel MFM_DIA_IDC_SHELLSELECT;
private _name = ctrlText MFM_DIA_IDC_NAME;
private _dispersion = (ctrlText MFM_DIA_IDC_DISPERSION) call BIS_fnc_parseNumber;
private _burstNumber = (ctrlText MFM_DIA_IDC_BURSTNUMBER) call BIS_fnc_parseNumber;
private _burstRounds = (ctrlText MFM_DIA_IDC_BURSTROUNDS) call BIS_fnc_parseNumber;
private _burstDelay = (ctrlText MFM_DIA_IDC_BURSTDELAY) call BIS_fnc_parseNumber;
private _spotting =  (ctrlText MFM_DIA_IDC_SPOTTING) call BIS_fnc_parseNumber;

_inputIsCorrect = true;
_inputIsCorrect = _inputIsCorrect && [_selectedUnit,"No Arty selected/aviable"] call UO_FW_FNC_InputIsUnit;
_inputIsCorrect = _inputIsCorrect && [_dispersion,"Dispersion is not a number"] call UO_FW_FNC_InputIsNumber;
_inputIsCorrect = _inputIsCorrect && [_burstNumber,"Burst number is not a number"] call UO_FW_FNC_InputIsNumber;
_inputIsCorrect = _inputIsCorrect && [_burstRounds,"Burst rounds is not a number"] call UO_FW_FNC_InputIsNumber;
_inputIsCorrect = _inputIsCorrect && [_burstDelay,"Burst delay is not a number"] call UO_FW_FNC_InputIsNumber;
_inputIsCorrect = _inputIsCorrect && [_spotting,"Spotting distance is not a number"] call UO_FW_FNC_InputIsNumber;
private _marker = _name call UO_FW_FNC_FindMarkerOnMap;
if(_marker == "") then { _inputIsCorrect = false;hint "marker does not exist";	};
if(_inputIsCorrect) then
{

						private _round =  ((_selectedUnit call UO_FW_FNC_GetArtyAmmo) select _selectedAmmo) select 0;

						hint (([_selectedUnit,_name,_dispersion,_burstNumber,_burstRounds,_burstDelay,_spotting,_selectedAmmo] call UO_FW_FNC_GetMarkerFiremissionText)
							+ "Requested by:" + (name player)
							+ "\nETA: " + str (round ((_selectedUnit call UO_FW_FNC_GetArtyAimTime) + ([_selectedUnit,getMarkerPos (_marker),_round] call UO_FW_FNC_GetArtyEta))) + " s");
						["CallMarkerFiremission",  [player,_selectedUnit,_name,_dispersion,_burstNumber,_burstRounds,_burstDelay,_spotting,_selectedAmmo]] call CBA_fnc_serverEvent;
						[] call UO_FW_FNC_DIA_MarkerFiremissionCloseDialog;

};