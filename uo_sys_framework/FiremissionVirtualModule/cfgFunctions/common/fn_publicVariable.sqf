#define COMPONENT FiremissionVirtual
#include "\x\UO_FW\addons\Main\script_macros.hpp"

if (_varName isEqualTo "") exitWith {
	hint "Variable name is undefined";
};

if (isNil "_value") then {
	missionNamespace setVariable [_varName, nil];
	publicVariable _varName;
} else {
	missionNamespace setVariable [_varName, _value];
	publicVariable _varName;
};