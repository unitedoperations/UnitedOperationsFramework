//3DEN Attribute Config Defines
#define UO_FW_SCENARIO_EXPRESSION "missionNamespace setVariable ['%s', _value];"

#define UO_FW_ENTITY_EXPRESSION "_propertyName = '%s'; _this setVariable [_propertyName, _value];"

#define UO_FW_ENTITY_DELAYED_FNC_EXPRESSION(FNCNAME) \
"private _propertyName = '%s';\
_this setVariable [_propertyName, _value];\
private _fncName = 'UO_FW_fnc_##FNCNAME##';\
[{CBA_missionTime > 1},{\
	params ['_object','_propertyName','_value','_fncName'];\
	if (local _object && {(_this getvariable ['_propertyName',false])}) then {\
		[_object,_value] call _fncName;\
	}\
},[_this,_propertyName,_value,_fncName]] call CBA_fnc_WaitUntilAndExecute;"

#define UO_FW_MODULE_EXPRESSION "_this setVariable ['%s', _value, true];"
