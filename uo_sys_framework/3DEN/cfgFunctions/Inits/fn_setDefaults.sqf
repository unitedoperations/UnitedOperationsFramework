/*	Description: Compiles global arrays from 3DEN mission property values and default settings
 *	Arguments:
 * 		N/A
 *	Return Value:
 * 		ARRAY
 *	Author
 *		PiZZADOX
 */

if (!UO_FW_SERVER_FRAMEWORK_ALLOWED) exitWith {};

#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

private ["_configCategories","_configCategories2","_configAttributes"];
UO_FW_SETDEFAULTSDEBUGMODE = false;
_configCategories = [];
_configCategories2 = [];
_configAttributes = [];

_configCategories = "(((str(configname _x)) find 'UO_FW') >= 0)" configClasses (Configfile >> "Cfg3DEN" >> "Mission");
	if (UO_FW_SETDEFAULTSDEBUGMODE) then {
	diag_log format ["_configCategories: %1",_configCategories];
	};
{
	//_configAttributesTemp = "(((str(configname _x)) find 'UO_FW') > 0)" configClasses (configfile >> "Cfg3DEN" >> "Mission" >> );
	if (UO_FW_SETDEFAULTSDEBUGMODE) then {
		diag_log format ["_configCategories foreach _x: %1",_x];
	};
	private _configCategories2temp = [_x,1,false] call BIS_fnc_returnChildren;
	{
		_configCategories2 pushback _x;
	} foreach _configCategories2temp;
	if (UO_FW_SETDEFAULTSDEBUGMODE) then {
		diag_log format ["_configCategories2: %1",_configCategories2];
	};
} foreach _configCategories;

{
	//_configAttributesTemp = "(((str(configname _x)) find 'UO_FW') >= 0)" configClasses (configfile >> "Cfg3DEN" >> "Mission" >> );
	if (UO_FW_SETDEFAULTSDEBUGMODE) then {
		diag_log format ["Foreach1 _x: %1",_x];
	};
	private _configAttributesTemp = [_x,1,false] call BIS_fnc_returnChildren;
	if (UO_FW_SETDEFAULTSDEBUGMODE) then {
		diag_log format ["_configAttributesTemp: %1",_configAttributesTemp];
	};
	{
	if (UO_FW_SETDEFAULTSDEBUGMODE) then {
			diag_log format ["Foreach2 _x: %1",_x];
	};
	if (UO_FW_SETDEFAULTSDEBUGMODE) then {
			diag_log format ["Foreach2 CfgData _x: %1",(_x >> "property") call BIS_fnc_getCfgData];
	};
		if (isText(_x >> "property")) then {
			_configAttributes pushback _x;
		};
	} foreach _configAttributesTemp;
} foreach _configCategories2;

{
	private _propertyname = getText (_x >> "property");
	if (UO_FW_SETDEFAULTSDEBUGMODE) then {
		diag_log format ["_propertyname: %1",_propertyname];
	};
	private _missionvalue = getMissionConfigValue [_propertyname,"NONE"];
	if (_missionvalue isEqualTo "NONE") then {
		if ((missionNamespace getvariable [_propertyname,""]) isEqualto "") then {
			private _valuetext = getText(_x >> "defaultValue");
			if (!(_valuetext isEqualto "")) then {
				missionNamespace setvariable [_propertyname, (call compile _valuetext), true];
	if (UO_FW_SETDEFAULTSDEBUGMODE) then {
					diag_log format ["_propertyname: %1 set with value: %2",_propertyname,(missionNamespace getvariable [_propertyname,""])];
	};
			} else {
	if (UO_FW_SETDEFAULTSDEBUGMODE) then {
					diag_log format ["_propertyname: %1 null default value! not set!",_propertyname];
	};
			};
		} else {
	if (UO_FW_SETDEFAULTSDEBUGMODE) then {
				diag_log format ["_propertyname: %1 already defined with value of %2! not set!",_propertyname,(missionNamespace getvariable [_propertyname,""])];
	};
		};
	} else {
	if (UO_FW_SETDEFAULTSDEBUGMODE) then {
			diag_log format ["_propertyname: %1 has mission value!",_propertyname];
	};
		missionNamespace setvariable [_propertyname, _missionvalue, true];
	if (UO_FW_SETDEFAULTSDEBUGMODE) then {
			diag_log format ["_propertyname: %1 set with value: %2",_propertyname,(missionNamespace getvariable [_propertyname,""])];
	};
	};
} foreach _configAttributes;

UO_FW_SETTINGS_INIT = true;
