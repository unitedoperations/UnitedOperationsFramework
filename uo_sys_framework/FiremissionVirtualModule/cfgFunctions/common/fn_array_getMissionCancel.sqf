// Function by Tinfoilhate
// Sets battery cancel information from mission id input
// [name,ready,[ammoClass,quantity],guns,dispersion,reloadTime,calcTime,flightTime,delayTime,side]
#define COMPONENT FiremissionVirtual
#include "\x\UO_FW\addons\Main\script_macros.hpp"
params ["_name"];

_ret = [];
_updatedArray = [];

_fnc = {
	_x params ["_bat","_cancel"];

	if (_name == _bat) then {
		_ret = _cancel;
	};	
};

switch (_side) do {
	case west: {
		{call _fnc} forEach GVAR(Firemissions_Blufor);
	};
	
	case east: {
		{call _fnc} forEach GVAR(Firemissions_Opfor);
	};

	case independent: {
		{call _fnc} forEach GVAR(Firemissions_Indfor);
	};

	case civilian: {
		{call _fnc} forEach GVAR(Firemissions_Civfor);
	};	
};

_ret