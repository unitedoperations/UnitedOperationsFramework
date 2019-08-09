// Function by Tinfoilhate
// Sets battery ready information from battery name input
// [name,ready,[ammoClass,quantity],guns,dispersion,reloadTime,calcTime,flightTime,delayTime,side]
#define COMPONENT FiremissionVirtual
#include "\x\UO_FW\addons\Main\script_macros.hpp"
params ["_name","_status"];

_ret = [];
_updatedArray = [];

{
	_x params ["_bat"];

	if (_name == _bat) then {
		_ret = _status;
		_temp = _x;

		_temp set [1,_status];

		_updatedArray pushBack _temp;
	} else {
		_updatedArray pushBack _x;
	};
} forEach GVAR(Batteries);

SETMPVAR(Batteries,_updatedArray);

_ret