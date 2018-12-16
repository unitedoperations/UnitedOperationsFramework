/*	Description: Compiles global arrays from 3DEN mission property values and default settings
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY
 *	Author
 *		PiZZADOX
 */

#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

_configCategories = [];
_configCategories2 = [];
_configAttributes = [];

_configCategories = "(((str(configname _x)) find 'UO_FW') >= 0)" configClasses (configfile >> "Cfg3DEN" >> "Mission");
{
	_configCategories2temp = [_x,1,false] call BIS_fnc_returnChildren;
	{
		_configCategories2 pushback _x;
	} foreach _configCategories2temp;
} foreach _configCategories;

{
	_configAttributesTemp = [_x,1,false] call BIS_fnc_returnChildren;
	{
		if (isText(_x >> "property")) then {
			_configAttributes pushback _x;
		};
	} foreach _configAttributesTemp;
} foreach _configCategories2;

{
	private _propertyname = getText (_x >> "property");
	if (isNil _propertyname) then {
		if ((missionNamespace getvariable [_propertyname,""]) isEqualto "") then {
			_valuetext = getText(_x >> "defaultValue");
			if (!(_valuetext isEqualto "")) then {
				_value = call compile _valuetext;
				if (typename _value isEqualto "BOOL") then {
					if (UO_FW_Enabled) then {
						missionNamespace setvariable [_propertyname, _value,true];
					} else {
						missionNamespace setvariable [_propertyname, false,true];
					};
				} else {
					missionNamespace setvariable [_propertyname, _value,true];
				};
			} else {
			};
		} else {
		};
	};
} foreach _configAttributes;

UO_FW_SETTINGS_INIT = true;
