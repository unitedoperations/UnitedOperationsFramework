#include "..\..\Global\defs.hpp"
private _unit = _this select 0;
private _guns = _this select 1;
private _allowBracket = _this select 2;
private _allowDonut = _this select 3;
private _allowGridSpotting = _this select 4;
private _allowLine = _this select 5;
private _allowMarker = _this select 6;
private _allowPoint = _this select 7;
private _allowPolar = _this select 8;
private _allowPolarspotting = _this select 9;

if (isServer) then {
    _unit setVariable [QEGVAR(Firemission,ObsGuns),_guns,true];
    ["Event_ReceiveFoGuns",[_guns,_allowBracket,_allowDonut,_allowGridSpotting,_allowLine,_allowMarker,_allowPoint,_allowPolar,_allowPolarspotting],_unit] call CBA_fnc_targetEvent;

};



