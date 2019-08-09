#include "..\..\Global\defs.hpp"
private _unit = _this select 0;
    private _target = _this select 1;
    private _rounds = _this select 2;
    private _text =  getText (configfile / "CfgMagazines" / _rounds / "displayName");
    private _unitName = _unit call EFUNC(Firemission,GetArtyDisplayName);
    private _ret = "Name: " + _unitName +"\n" +
                                                "Firemission type: Spotting-Firemission \n" +
                                                "Shell: " + _text +" \n" +
                                                "Grid: " + (mapGridPosition _target) +" \n";
    _ret
