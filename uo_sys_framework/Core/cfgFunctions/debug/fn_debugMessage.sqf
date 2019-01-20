/*
 * Author: PiZZADOX
 *
 * Checks and adds debug message
 *
 * Arguments:
 * 0: message <string>
 *
 * Return Value:
 * nothing
 *
 * Public: No
 */

#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

if !(UO_FW_Server_DEBUG_Allowed) exitWith {};

params ["_message"];

if (isNil "UO_FW_DebugMessages") then {UO_FW_DebugMessages = [];};

if (UO_FW_Debug_Logs) then {
	diag_log _message;
};

if (!(_message in UO_FW_DebugMessages)) then {
	UO_FW_DebugMessages pushback _message;
};

if (isNull (uiNamespace getVariable ["UO_FW_Debug_Control",displaynull])) then {
	"UO_FW_Debug_Layer" cutRsc ["UO_FW_DIA_DEBUG", "PLAIN"];
};

[{
	params ["_message"];
	[{!(isNull (uiNamespace getVariable ["UO_FW_Debug_Control",displaynull]))}, {
		params ["_message"];
		[] call UO_FW_fnc_refreshDebug;
		[{
			UO_FW_DebugMessages = UO_FW_DebugMessages - [_message];
			[] call UO_FW_fnc_refreshDebug;
		}, [_message], 30] call CBA_fnc_waitAndExecute;
	}, [_message]] call CBA_fnc_waitUntilAndExecute;
}, [_message]] call CBA_fnc_execNextFrame;
