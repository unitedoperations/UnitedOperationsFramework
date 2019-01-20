#include "..\..\Global\defs.hpp"
private _unit = _this select 0;
	private	_startGrid = _this select 1;
	private	_endGrid = _this select 2;
	private	_salvoCount = _this select 3;
	private	_salvoSize = _this select 4;
	private	_salvoWait = _this select 5;
	private	_minSpottedDistance = _this select 6;
	private	_roundType = _this select 7;
	private	_rounds = ((_unit call UO_FW_fnc_GetArtyAmmo) select _roundType) select 0;
	private _text =  getText (configfile / "CfgMagazines" / _rounds / "displayName");

	_unitName = _unit call UO_FW_fnc_GetArtyDisplayName;


	_ret = 	"Name: " + _unitName +"\n" +
			"Firemission type: Line-Firemission \n" +
			"Shell: " + _text +" \n" +
			"Startgrid: " + (mapGridPosition _startGrid) + "\n" +
			"Endgrid: " + (mapGridPosition _endGrid) +"\n" +
			"Number of Salvos: " + (str _salvoCount) +"\n" +
			"Rounds per Salvo: " + (str _salvoSize) +"\n" +
			"Delay per Salvo: " + (str _salvoWait) +"\n" +
			"Minimum Spotted distance: " + (str _minSpottedDistance) +"\n";

	_ret