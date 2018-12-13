params [
	["_unit", objNull, [objNull]],
	["_radio", "", [""]],
	["_channel", 0, [0]],
	["_spatial", "CENTER", [""]]
];

private _radioID = [_radio] call acre_api_fnc_getRadioByType; 
if ( ! isNil "_radioID")then 
{
	[_radioID, _channel] call acre_api_fnc_setRadioChannel; 
	[_radioID, _spatial] call acre_api_fnc_setRadioSpatial; 
}; 