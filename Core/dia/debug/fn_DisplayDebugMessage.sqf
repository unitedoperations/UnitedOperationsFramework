private ["_someText", "_message", "_found", "_text"];
hint "ok";
if (!isDedicated || !FW_DebugMessagesEnabled) exitWith {};
hint "ok2";
_someText = 4001;

_message = _this;

_found = false;

{

	if (_x == _message) exitWith {

		_found = true;

	};

} forEach FW_DebugMessages;

if (!_found) then {

	FW_DebugMessages set [count FW_DebugMessages, _message];

	_text = "";

	{

		_text = _text + _x + "<br></br><br></br>";

	} forEach FW_DebugMessages;

	(400 displayCtrl _someText) ctrlSetStructuredText parseText _text;

};
