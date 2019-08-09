#include "..\..\Global\defs.hpp"
private _unit = _this select 0;
    private _startPoint = _this select 1;
    private _endPoint = _this select 2;
    private _width = _this select 3;
    private _salvoCount = _this select 4;
    private _salvoSize = _this select 5;
    private _salvoWait = _this select 6;
    private _minSpottedDistance = _this select 7;
    private _rounds = _this select 8;
    private _text =  getText (configfile / "CfgMagazines" / _rounds  / "displayName");

    _unitName = _unit call EFUNC(Firemission,GetArtyDisplayName);


    _ret =     "Name: " + _unitName +"\n" +
            "Firemission type: Curtain-Firemission \n" +
            "Shell: " + _text +" \n" +
            "Startgrid: " + (mapGridPosition _startPoint) + "\n" +
            "Endgrid: " + (mapGridPosition _endPoint) +"\n" +
            "Width: " +  (str _width) +"\n" +
            "Number of Salvos: " + (str _salvoCount) +"\n" +
            "Rounds per Salvo: " + (str _salvoSize) +"\n" +
            "Delay per Salvo: " + (str _salvoWait) +"\n" +
            "Minimum Spotted distance: " + (str _minSpottedDistance) +"\n";

    _ret