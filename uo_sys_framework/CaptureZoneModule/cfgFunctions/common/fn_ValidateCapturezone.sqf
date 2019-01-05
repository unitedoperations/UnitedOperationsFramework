#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

//[_logic,_zoneName,_area,_interval,_repeatable,_capArray,_timeArray,_messagesArray,_colours,_hidden,_silent,_automessages,_ratioNeeded,_cond]
params ["_logic","_zoneName","_area","_interval","_repeatable","_capArray","_timeArray","_messagesArray","_colours","_hidden","_silent","_automessages","_ratioNeeded","_cond"];
private _isValid = true;

if (isNil "CaptureZone_Array") then {
	CaptureZone_Array = [];
};

if (_zoneName in CaptureZone_Array) then {
	_isValid = false;
	private _msg = format ["Duplicate name for CaptureZone %1. CaptureZone must have unique name!", _zoneName];
	UO_FW_DEBUG("",_msg);
};

if ((count _area) < 4) then {
	_isValid = false;
	private _msg = format ["Invalid area generated for CaptureZone %1", _zoneName];
	UO_FW_DEBUG("",_msg);
};

if ((count _colours) < 6) then {
	_isValid = false;
	private _msg = format ["No sides defined for capture for CaptureZone %1", _zoneName];
	UO_FW_DEBUG("",_msg);
};

if (({!(_x isEqualto 2)} count _capArray) isEqualTo 0) exitwith {
	private _msg = format ["CaptureZone %1 has no teams that can be counted!", _zoneName];
	UO_FW_DEBUG("",_msg);
};

if (({_x isEqualto 0} count _capArray) isEqualto 0) exitwith {
	private _msg = format ["CaptureZone %1 has no teams that can capture!", _zoneName];
	UO_FW_DEBUG("",_msg);
};

_isValid
