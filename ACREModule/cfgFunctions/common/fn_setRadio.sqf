params [
	["_unit", objNull, [objNull]],
	["_radio", "", [""]],
	["_channel", 0, [0]],
	["_spatial", "CENTER", [""]]
];

private _channels = _unit getVariable ["UO_FW_Channels", []];

_channels pushBack [_radio, _channel, _spatial];

_unit setVariable ["UO_FW_Channels", _channels, false];