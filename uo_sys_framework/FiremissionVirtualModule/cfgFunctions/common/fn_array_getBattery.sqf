// Function by Tinfoilhate
// Gathers and returns battery information from battery name input
#define COMPONENT FiremissionVirtual
#include "\x\UO_FW\addons\Main\script_macros.hpp"

params ["_name"];

_ret = [];

{	
	_x params ["_bat"];

	if (_name == _bat) then {
		_ret = _x;
	};	
} forEach GVAR(Batteries);

_ret