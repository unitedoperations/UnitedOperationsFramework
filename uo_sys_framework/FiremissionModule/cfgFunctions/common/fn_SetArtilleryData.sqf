#include "..\..\Global\defs.hpp"
//TODO do some value checking
private _unit = _this select 0;
private _accuracy = if ((_this select 1) < 0) then { MEANPlOTTEDACCURACY} else { _this select 1 };;
private _spottingAccuracy = if ((_this select 2) < 0) then {MEANSPOTTINGACCURACY} else { _this select 2  };;
private _aimSpeed = if ((_this select 3) < 0) then {MEANAIMTIME} else {   _this select 3};;
private _calcSpeed = if ((_this select 4) < 0) then {MEANCALCULATIONTIME } else { _this select 4 };;
private _customName = _this select 5;
private _unlimitedAmmo = _this select 6;
private _allowChat = _this select 7;
_unit setVariable [QEGVAR(Firemission,ArtAccuracy),_accuracy];
_unit setVariable [QEGVAR(Firemission,ArtSpotAccuracy),_spottingAccuracy];
_unit setVariable [QEGVAR(Firemission,ArtAimSpeed),_aimSpeed];
_unit setVariable [QEGVAR(Firemission,ArtCalcSpeed),_calcSpeed];
_unit setVariable [QEGVAR(Firemission,ArtCustomName),_customName,true];
_unit setVariable [QEGVAR(Firemission,ArtUnlimitedAmmo),_unlimitedAmmo];
_unit setVariable [QEGVAR(Firemission,ArtAllowChat),_allowChat];