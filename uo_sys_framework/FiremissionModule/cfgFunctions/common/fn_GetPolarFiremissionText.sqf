#include "..\..\Global\defs.hpp"
private _unit = _this select 0;
    private _callGrid = _this select 1;

    private _mils = _this select 2;
    private _distance = _this select 3;

    private    _dispersion = _this select 4;
    private    _salvoCount = _this select 5;
    private    _salvoSize = _this select 6;
    private    _salvoWait = _this select 7;
    private    _minSpottedDistance = _this select 8;
    private    _roundType = _this select 9;

    private    _loc = [_callGrid,true] call CBA_fnc_mapGridToPos;
    private    _degrees = MILSPERROUND / _mils * 360;
    private _dir = [cos _degrees,sin _degrees,0];

    private    _rounds = ((_unit call UO_FW_fnc_GetArtyAmmo) select _roundType);

    private _text =  getText (configfile / "CfgMagazines" / (_rounds select 0) / "displayName");

    private    _unitName = _unit call UO_FW_fnc_GetArtyDisplayName;


    private _ret =     "Name: " + _unitName + "\n" +
            "Firemission type: Polar to Point-Firemission \n" +
            "Shell: " + _text +" \n" +
            "Call Grid: " + (mapGridPosition _callGrid) + "\n" +
            "Mils: " +(str _mils) + "\n" +
            "Distance: " + (str _distance) + "\n" +
            "Dispersion: " + (str _dispersion) +"\n" +
            "Number of Salvos: " + (str _salvoCount) +"\n" +
            "Rounds per Salvo: " + (str _salvoSize) +"\n" +
            "Delay per Salvo: " + (str _salvoWait) +"\n" +
            "Minimum Spotted distance: " + (str _minSpottedDistance) +"\n";

    _ret