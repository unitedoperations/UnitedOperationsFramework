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

private _message = _this;

private _found = false;

{

	if (_x == _message) exitWith {

		_found = true;

	};

} forEach UO_FW_DebugMessages;

if (!_found) then {

	UO_FW_DebugMessages set [count UO_FW_DebugMessages, _message];

};
