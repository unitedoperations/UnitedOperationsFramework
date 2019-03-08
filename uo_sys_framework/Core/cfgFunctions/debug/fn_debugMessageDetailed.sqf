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
EXEC_CHECK(ALL);

params ["_basicmsg","_detailedmsg"];

if ((UO_FW_Debug_Enabled) && !(UO_FW_Debug_Detailed_Enabled)) then {
    if (_basicmsg isEqualto "") exitwith {};
    if !((typename _basicmsg) isEqualto "STRING") then {
        private _basicmsgprint = format ["%1",_basicmsg];
        _basicmsgprint call FUNC(DebugMessage);
    } else {
        _basicmsg call FUNC(DebugMessage);
    };
};
if (UO_FW_Debug_Detailed_Enabled) then {
    if (_detailedmsg isEqualto "") exitwith {};
    if !((typename _detailedmsg) isEqualto "STRING") then {
        private _detailedmsgprint = format ["%1",_detailedmsg];
        _detailedmsgprint call FUNC(DebugMessage);
        diag_log _detailedmsgprint;
    } else {
        _detailedmsg call FUNC(DebugMessage);
        diag_log _detailedmsg;
    };
};
