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

params ["_basicmsg","_detailedmsg"];

if ((UO_FW_Debug_Enabled) && !(UO_FW_Debug_Detailed_Enabled)) then {
	if (_basicmsg isEqualto "") exitwith {};
	if !((typename _basicmsg) isEqualto "STRING") then {
		private _basicmsgprint = format ["%1",_basicmsg];
		_basicmsgprint call UO_FW_fnc_DebugMessage;
	} else {
		_basicmsg call UO_FW_fnc_DebugMessage;
	};
};
if (UO_FW_Debug_Detailed_Enabled) then {
	if (_detailedmsg isEqualto "") exitwith {};
	if !((typename _detailedmsg) isEqualto "STRING") then {
		private _detailedmsgprint = format ["%1",_detailedmsg];
		_detailedmsgprint call UO_FW_fnc_DebugMessage;
		diag_log _detailedmsgprint;
	} else {
		_detailedmsg call UO_FW_fnc_DebugMessage;
		diag_log _detailedmsg;
	};
};
