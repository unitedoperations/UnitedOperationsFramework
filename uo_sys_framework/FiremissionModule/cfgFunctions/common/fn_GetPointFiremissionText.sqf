#include "..\..\Global\defs.hpp"
private _unit = _this select 0;
	private	_target = _this select 1;
	private	_dispersion = _this select 2;
	private	_salvoCount = _this select 3;
	private	_salvoSize = _this select 4;
	private	_salvoWait = _this select 5;
	private	_minSpottedDistance = _this select 6;
	private	_roundType = _this select 7;
	private	_rounds = ((_unit call UO_FW_fnc_GetArtyAmmo) select _roundType);

	private _text =  getText (configfile / "CfgMagazines" / (_rounds select 0) / "displayName");

	private	_unitName = _unit call UO_FW_fnc_GetArtyDisplayName;


	private _ret = 	"Name: " + _unitName + "\n" +
			"Firemission type: Point-Firemission \n" +
			"Shell: " + _text +" \n" +
			"Grid: " + (mapGridPosition _target) + "\n" +
			"Dispersion: " + (str _dispersion) +"\n" +
			"Number of Salvos: " + (str _salvoCount) +"\n" +
			"Rounds per Salvo: " + (str _salvoSize) +"\n" +
			"Delay per Salvo: " + (str _salvoWait) +"\n" +
			"Minimum Spotted distance: " + (str _minSpottedDistance) +"\n";

	_ret