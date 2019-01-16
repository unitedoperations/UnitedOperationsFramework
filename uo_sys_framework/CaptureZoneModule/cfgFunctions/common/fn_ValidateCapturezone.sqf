#define COMPONENT CaptureZone
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

//[_logic,_zoneName,_area,_interval,_repeatable,_capArray,_timeArray,_messagesArray,_colours,_hidden,_silent,_automessages,_ratioNeeded,_cond]
params ["_logic","_zoneName","_area","_interval","_repeatable","_capArray","_timeArray","_messagesArray","_colours","_hidden","_silent","_automessages","_ratioNeeded","_cond"];
private _isValid = true;

if (isNil "CaptureZone_Array") then {
	CaptureZone_Array = [];
};

if (_zoneName in CaptureZone_Array) then {
	_isValid = false;
	ERROR_1("Duplicate name for CaptureZone %1. CaptureZone must have unique name!", _zoneName);
};

if ((count _area) < 4) then {
	_isValid = false;
	ERROR_1("Invalid area generated for CaptureZone %1", _zoneName);
};

if ((count _colours) < 6) then {
	_isValid = false;
	ERROR_1("No sides defined for capture for CaptureZone %1", _zoneName);
};

if (({!(_x isEqualto 2)} count _capArray) isEqualTo 0) exitwith {
	ERROR_1("CaptureZone %1 has no teams that can be counted!", _zoneName);
};

if (({_x isEqualto 0} count _capArray) isEqualto 0) exitwith {
	ERROR_1("CaptureZone %1 has no teams that can capture!", _zoneName);
};

_isValid
