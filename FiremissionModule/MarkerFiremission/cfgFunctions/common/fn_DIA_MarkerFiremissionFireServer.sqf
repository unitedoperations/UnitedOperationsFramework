#include "..\..\..\Global\defs.hpp"
	private _requester  = _this select 0;
	private	_selectedUnit = _this select 1;
	private _marker = _this select 2;
	private _dispersion = _this select 3;
	private _salvoNumber = _this select 4;
	private _salvoRounds = _this select 5;
	private _salvoDelay = _this select 6;
	private _spotting =  _this select 7;
	private _selectedAmmo = _this select 8;

	[_selectedUnit,_requester] call UO_FW_FNC_SetArtyCaller;
	[_selectedUnit,_marker,_dispersion,_salvoNumber,_salvoRounds,_salvoDelay,_spotting,_selectedAmmo]   call UO_FW_FNC_DynamicMarkerFiremission;