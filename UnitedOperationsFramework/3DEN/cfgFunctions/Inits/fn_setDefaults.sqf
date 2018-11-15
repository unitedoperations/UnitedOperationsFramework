/*	Description: Compiles global arrays from 3DEN mission property values and default settings
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY 	
 *	Author
 *		PiZZADOX
 */
 
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL)

_configCategories = [];
_configCategories2 = [];
_configAttributes = [];

_configCategories = "(((str(configname _x)) find 'UO_FW') >= 0)" configClasses (configfile >> "Cfg3DEN" >> "Mission");
//diag_log format ["_configCategories: %1",_configCategories];
{
	//_configAttributesTemp = "(((str(configname _x)) find 'UO_FW') > 0)" configClasses (configfile >> "Cfg3DEN" >> "Mission" >> );
	//diag_log format ["_configCategories foreach _x: %1",_x];
	_configCategories2temp = [_x,1,false] call BIS_fnc_returnChildren;
	{
		_configCategories2 pushback _x;
	} foreach _configCategories2temp;
	//diag_log format ["_configCategories2: %1",_configCategories2];
} foreach _configCategories;

{
	//_configAttributesTemp = "(((str(configname _x)) find 'UO_FW') >= 0)" configClasses (configfile >> "Cfg3DEN" >> "Mission" >> );
	//diag_log format ["Foreach1 _x: %1",_x];
	_configAttributesTemp = [_x,1,false] call BIS_fnc_returnChildren;
	//diag_log format ["_configAttributesTemp: %1",_configAttributesTemp];
	{
		//diag_log format ["Foreach2 _x: %1",_x];
		//diag_log format ["Foreach2 CfgData _x: %1",(_x >> "property") call BIS_fnc_getCfgData];
		if (isText(_x >> "property")) then {
			_configAttributes pushback _x;
		};
	} foreach _configAttributesTemp;
} foreach _configCategories2;

{
	private _propertyname = getText (_x >> "property");
	//diag_log format ["_propertyname: %1",_propertyname];
	if (isNil _propertyname) then {
		if ((missionNamespace getvariable [_propertyname,""]) isEqualto "") then {
			_valuetext = getText(_x >> "defaultValue");
			//diag_log format ["_propertyname: %1 _valuetext: %2",_propertyname,_valuetext];
			if (!(_valuetext isEqualto "")) then {
				_value = call compile _valuetext;
				//diag_log format ["_propertyname: %1 _value: %2",_propertyname,_value];
				if (typename _value isEqualto "BOOL") then {
					//diag_log format ["_propertyname: %1 _value: %2 is BOOL",_value,_valuetext];
					if (UO_FW_Enabled) then {
						missionNamespace setvariable [_propertyname, _value,true];
					} else {
						missionNamespace setvariable [_propertyname, false,true];
						//diag_log format ["_propertyname: %1 setting BOOL to default false",_value,_valuetext];
					};
				} else {
					missionNamespace setvariable [_propertyname, _value,true];
				};
			} else {
				//diag_log format ["_propertyname: %1 null default value! not set!",_propertyname];
			};
		} else {
			//diag_log format ["_propertyname: %1 already defined! not set!",_propertyname];
		};
	};
} foreach _configAttributes;

UO_FW_SETTINGS_INIT = true;