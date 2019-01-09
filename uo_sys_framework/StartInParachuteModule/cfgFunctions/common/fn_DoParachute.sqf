private ["_target", "_elev", "_rand", "_stear", "_class","_doPara"];

#define COMPONENT StartInParachute
#include "\x\UO_FW\addons\main\script_macros.hpp"

_target = _this select 0;
_elev = _this select 1;
_rand = 100;
_stear = false;
_class = "NonSteerable_Parachute_F";
_doPara = false;

if (count _this > 2) then
{

	_rand = _this select 2;

};

if (count _this > 3) then {

	_stear = _this select 3;

};

if (_stear) then
{

	_class = "Steerable_Parachute_F";

};

waitUntil {!isnull _target};
private _random = floor (random _rand);
private _chute = _class createVehicle [0,0,0];
_chute setPosATL [getPosatl _target select 0, getPosatl _target select 1, _elev + _random];
_target moveIndriver _chute;
