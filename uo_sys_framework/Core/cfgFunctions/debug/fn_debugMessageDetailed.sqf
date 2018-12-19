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


params ["_basicmsg","_detailedmsg"];

if (isNil "UO_FW_Debug_Enabled") then
{
	UO_FW_Debug_Enabled = (getMissionConfigValue["UO_FW_Debug_Enabled",false])
};
if (isNil "UO_FW_Debug_Detailed_Enabled") then
{
	UO_FW_Debug_Detailed_Enabled = (getMissionConfigValue["UO_FW_Debug_Detailed_Enabled",false])
};
if ((UO_FW_Debug_Enabled) && !(UO_FW_Debug_Detailed_Enabled)) then
{
	if (_basicmsg isEqualto "") exitwith {};
	if !((typename _basicmsg) isEqualto "STRING") then
	{
		_basicmsgprint = format ["%1",_basicmsg];
		_basicmsgprint call UO_FW_fnc_DebugMessage;
	} else {
		_basicmsgprint call UO_FW_fnc_DebugMessage;
	};
};
if (UO_FW_Debug_Detailed_Enabled) then
{
	if (_detailedmsg isEqualto "") exitwith {};
	if !((typename _detailedmsg) isEqualto "STRING") then
	{
		_detailedmsgprint = format ["%1",_detailedmsg];
		_detailedmsgprint call UO_FW_fnc_DebugMessage;
		diag_log _detailedmsgprint;
	} else {
		_detailedmsg call UO_FW_fnc_DebugMessage;
		diag_log _detailedmsg;
	};
};
