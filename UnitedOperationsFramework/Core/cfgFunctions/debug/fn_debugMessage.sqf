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
 
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL)
if(!UO_FW_SERVER_FRAMEWORK_ALLOWED || !UO_FW_SERVER_DEBUG_ALLOWED) exitWith 
{
	
};
private _message = _this;
private _found = false;

if (isNil "UO_FW_DebugMessages") then {UO_FW_DebugMessages = [];};

if (!(_message in UO_FW_DebugMessages)) then {
	UO_FW_DebugMessages pushback _message;
};

if (isNull (uiNamespace getVariable ["UO_FW_Debug_Control",displaynull])) then {
	[_message] spawn {
		sleep 0.1;
		100 cutRsc ["UO_FW_DIA_DEBUG", "PLAIN"];
		waituntil {!(isNull (uiNamespace getVariable ["UO_FW_Debug_Control",displaynull]))};
		[] call UO_FW_fnc_refreshDebug;
		sleep 30;
		UO_FW_DebugMessages = UO_FW_DebugMessages -[(_this select 0)];
		sleep 0.1;
		[] call UO_FW_fnc_refreshDebug;
	};
} else {
	[_message] spawn {
		sleep 0.1;
		[] call UO_FW_fnc_refreshDebug;
		sleep 30;
		UO_FW_DebugMessages = UO_FW_DebugMessages - [(_this select 0)];
		sleep 0.1;
		[] call UO_FW_fnc_refreshDebug;
	};
};

