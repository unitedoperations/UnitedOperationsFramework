/*	Description: Compiles global arrays from 3DEN mission property values and default settings
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY
 *	Author
 *		PiZZADOX
 */

#define COMPONENT 3DEN
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

//[_this,'%s',_value, false]
params ["_object","_propertyName","_value",["_globalMode",false,[false]]];

_object setVariable [_propertyName, _value];

if !(is3DEN) then {
	[{
		_this params ["_object","_propertyName","_value","_globalMode"];
		if (_globalMode) then {
			[_object,[_propertyName, _value]] remoteExecCall ["setVariable", 0, true];
		} else {
			[_object,[_propertyName, _value]] remoteExecCall ["setVariable", _object, true];
		};
	}, [_object,_propertyName,_value,_globalMode]] call CBA_fnc_execNextFrame;
};
