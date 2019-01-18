/*	Description: Compiles global arrays from 3DEN mission property values and default settings
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY
 *	Author
 *		PiZZADOX
 */

#define DEBUG_MODE_MINIMAL
#define COMPONENT SetDefaults
#include "\x\UO_FW\addons\Main\script_macros.hpp"

if (!(getMissionConfigValue ["UO_FW_Enabled",false])) exitWith {};
if (!UO_FW_Server_Framework_Allowed) exitWith {};

private _configCategories2 = [];
private _configAttributes = [];
private _configCategories = "(((str(configname _x)) find 'UO_FW') >= 0)" configClasses (Configfile >> "Cfg3DEN" >> "Mission");
LOG_1("_configCategories: %1",_configCategories);

{
	LOG_1("_configCategories foreach _x: %1",_x);
	private _configCategories2temp = [_x,1,false] call BIS_fnc_returnChildren;
	{
		_configCategories2 pushback _x;
	} foreach _configCategories2temp;
	LOG_1("_configCategories2: %1",_configCategories2);
} foreach _configCategories;

{
	private _configAttributesTemp = [_x,1,false] call BIS_fnc_returnChildren;
	{
		if (isText(_x >> "property")) then {
			_configAttributes pushback _x;
		};
	} foreach _configAttributesTemp;
} foreach _configCategories2;

{
	private _propertyname = getText (_x >> "property");
	LOG_1("_propertyname: %1",_propertyname);
	private _missionvalue = getMissionConfigValue [_propertyname,"NONE"];
	if (_missionvalue isEqualTo "NONE") then {
		if ((missionNamespace getvariable [_propertyname,"NOTSET"]) isEqualto "NOTSET") then {
			if (isText(_x >> "defaultValue")) then {
				private _valuetext = getText(_x >> "defaultValue");
				missionNamespace setvariable [_propertyname, (call compile _valuetext), true];
				private _value = missionNamespace getvariable [_propertyname,""];
				LOG_2("_propertyname: %1 already defined with value of %2! not set!",str _propertyname,_value);
			} else {
				LOG_1("_propertyname: %1 null default value! not set!",_propertyname);
			};
		} else {
			private _value = missionNamespace getvariable [_propertyname,""];
			LOG_2("_propertyname: %1 already defined with value of %2! not set!",str _propertyname,_value);
		};
	} else {
		LOG_1("_propertyname: %1 has mission value!",_propertyname);
		missionNamespace setvariable [_propertyname, _missionvalue];
		LOG_2("_propertyname: %1 set with value: %2",str _propertyname,_propertyname);
	};
} foreach _configAttributes;

UO_FW_SetDefaults_Initialized = true;
