#include "x\UO_FW\addons\main\FiremissionModule\Global\defs.hpp"
private _unit = _this select 0;
	private _target = _this select 1;
	private	_roundType = _this select 2;
	private	_rounds = ((_unit call UO_FW_FNC_GetArtyAmmo) select _roundType);
	private _text =  (str (_rounds select 1)) + "x " + getText (configfile / "CfgMagazines" / (_rounds select 0) / "displayName");
	private	_unitName = _unit call UO_FW_FNC_GetArtyDisplayName;
	private _ret = "Name: " + _unitName +"\n" +
												"Firemission type: Spotting-Firemission \n" +
												"Shell: " + _text +" \n" +
												"Grid: " + (mapGridPosition _target) +" \n";
	_ret