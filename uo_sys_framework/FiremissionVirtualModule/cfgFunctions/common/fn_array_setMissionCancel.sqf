// Function by Tinfoilhate
// Sets battery cancel information from mission id input
// [name,ready,[ammoClass,quantity],guns,dispersion,reloadTime,calcTime,flightTime,delayTime,side]
#define COMPONENT FiremissionVirtual
#include "\x\UO_FW\addons\Main\script_macros.hpp"
params ["_name","_status","_side"];

_ret = [];
_updatedArray = [];

_fnc = {
	_x params ["_bat","_cancel","_array"];

	if (_name == _bat) then {
		_updatedArray pushBack [_bat,_status,_array];
	} else {
		_updatedArray pushBack _x;
	};
};

switch (_side) do {
	case west: {
		{call _fnc} forEach GVAR(Firemissions_Blufor);

		SETMPVAR(Firemissions_Blufor,_updatedArray);
	};

	case east: {
		{call _fnc} forEach GVAR(Firemissions_Opfor);

		SETMPVAR(Firemissions_Opfor,_updatedArray);
	};

	case independent: {
		{call _fnc} forEach GVAR(Firemissions_Indfor);

		SETMPVAR(Firemissions_Indfor,_updatedArray);
	};

	case civilian: {
		{call _fnc} forEach GVAR(Firemissions_Civfor);

		SETMPVAR(Firemissions_Civfor,_updatedArray);
	};
};

_ret