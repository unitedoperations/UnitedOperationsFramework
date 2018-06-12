private ["_someText", "_message", "_found", "_text"];

#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT)

if ((!UO_FW_Debug_Enabled) && (!UO_FW_Debug_Detailed_Enabled)) exitWith {};

_someText = 4001;
_message = _this;
_found = false;

{

	if (_x == _message) exitWith {

		_found = true;

	};

} forEach UO_FW_DebugMessages;

if (!_found) then {

	UO_FW_DebugMessages set [count UO_FW_DebugMessages, _message];

	_text = "";

	{

		_text = _text + _x + "<br></br><br></br>";

	} forEach UO_FW_DebugMessages;

	((uiNamespace getVariable "UO_FW_Debug_Control") displayCtrl _someText) ctrlSetStructuredText parseText _text;

};
