/*
 * Author: Olsen
 *
 * Display a debug message.
 * Must be ran during init in order to work properly.
 *
 * Arguments:
 * 0: message <string>
 *
 * Return Value:
 * nothing
 *
 * Public: No
 */

 private ["_someText", "_message", "_found", "_text"];

if (isDedicated || !FW_DebugMessagesEnabled) exitWith {};



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
    cutRsc ["DIA_DEBUG", "PLAIN"];
 	((uiNamespace getVariable "FW_Debug") displayCtrl _someText) ctrlSetStructuredText parseText _text;

 };
