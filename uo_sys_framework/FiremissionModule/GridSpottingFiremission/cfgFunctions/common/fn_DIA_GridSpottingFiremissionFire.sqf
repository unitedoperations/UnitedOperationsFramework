#include "..\..\..\Global\defs.hpp"
private _guns = player getVariable [VAR_SART_OBSGUNS,[]];
	private _usableGuns = [];
	{
		if (_x call UO_FW_FNC_IsArtyAviable) then {
			_usableGuns pushBack _x;
		};
	}forEach _guns;
	private _selectedUnit = objNull;
	 if ((count _usableGuns) > 0) then { _selectedUnit = (_usableGuns select (lbCurSel GSFM_DIA_IDC_GUNSELECT));};
	private _selectedAmmo = lbCurSel GSFM_DIA_IDC_SHELLSELECT;
	private _grid = 	ctrlText GSFM_DIA_IDC_GRID;
	private _pos = [_grid,true] call CBA_fnc_mapGridToPos;
	if (_selectedUnit isEqualTo objNull) then  {hint "No Arty selected/aviable";}
	else
	{
		private _round =  ((_selectedUnit call UO_FW_FNC_GetArtyAmmo) select _selectedAmmo) select 0;
		hint (([_selectedUnit,_pos,_selectedAmmo] call UO_FW_FNC_GetGridSpottingFiremissionText)
								+ "Requested by: " + (name player)
								+ "\nETA: " + str (round ((_selectedUnit call UO_FW_FNC_GetArtyAimTime) + ([_selectedUnit,_pos,_round] call UO_FW_FNC_GetArtyEta))) + " s");
					["CallGridSpottingFiremission", [player,_selectedUnit,_grid,_selectedAmmo]] call CBA_fnc_serverEvent;
		[] call UO_FW_FNC_DIA_GridSpottingFiremissionCloseDialog;

	};



