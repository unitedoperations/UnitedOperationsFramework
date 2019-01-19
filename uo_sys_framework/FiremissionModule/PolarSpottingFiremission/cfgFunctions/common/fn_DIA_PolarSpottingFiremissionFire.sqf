#include "..\..\..\Global\defs.hpp"
private _guns = player getVariable [VAR_SART_OBSGUNS,[]];
private	_usableGuns = [];
{
	if (_x call UO_FW_fnc_IsArtyAviable) then {
		_usableGuns pushBack _x;
	};
} forEach _guns;
private	_selectedUnit = objNull;
if ((count _usableGuns) > 0) then { _selectedUnit = (_usableGuns select (lbCurSel PSFM_DIA_IDC_GUNSELECT));};
private _selectedAmmo = lbCurSel PSFM_DIA_IDC_SHELLSELECT;
private	_grid = 	ctrlText PSFM_DIA_IDC_GRID;
private	_mils = (ctrlText PSFM_DIA_IDC_MILS) call BIS_fnc_parseNumber;
private _distance =  (ctrlText PSFM_DIA_IDC_DISTANCE) call BIS_fnc_parseNumber;
if (_selectedUnit isEqualTo objNull) then {
	hint "No Arty selected/aviable";
} else {
	private _round =  ((_selectedUnit call UO_FW_fnc_GetArtyAmmo) select _selectedAmmo) select 0;
	hint (([_selectedUnit,[_grid,true] call CBA_fnc_mapGridToPos,_mils,_distance,_selectedAmmo] call UO_FW_fnc_GetPolarSpottingFiremissionText)
	+ "Requested by: " + (name player)
	+ "\nETA: " + str (round ((_selectedUnit call UO_FW_fnc_GetArtyAimTime) + ([_selectedUnit,[_grid,true] call CBA_fnc_mapGridToPos,_round] call UO_FW_fnc_GetArtyEta))) + " s");
	["CallPolarSpotting", [player,_selectedUnit,_grid,_mils,_distance,_selectedAmmo]] call CBA_fnc_serverEvent;
	[] call UO_FW_fnc_DIA_PolarSpottingFiremissionCloseDialog;
};
