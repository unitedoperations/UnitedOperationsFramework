#include "..\..\Global\defs.hpp"
private _unit = _this select 0;
    private _target = _this select 1;
    private _innerRadius = _this select 2;
    private _outerRadius = _this select 3;
    private _salvoCount = _this select 4;
    private _salvoSize = _this select 5;
    private _salvoWait = _this select 6;
    private _minSpottedDistance = _this select 7;
    private _rounds = _this select 8;
    private _text =  getText (configfile / "CfgMagazines" / _rounds / "displayName");

    _unitName = _unit call EFUNC(Firemission,GetArtyDisplayName);


    _ret =     "Name: " + _unitName +"\n" +
            "Firemission type: Donut-Firemission \n" +
            "Shell: " + _text +" \n" +
            "Targetgrid: " + (mapGridPosition _target) + "\n" +
            "Inner radius: " + (str _innerRadius) +"\n" +
            "Outer radius: " + (str _outerRadius) +"\n" +
            "Number of Salvos: " + (str _salvoCount) +"\n" +
            "Rounds per Salvo: " + (str _salvoSize) +"\n" +
            "Delay per Salvo: " + (str _salvoWait) +"\n" +
            "Minimum Spotted distance: " + (str _minSpottedDistance) +"\n";

    _ret