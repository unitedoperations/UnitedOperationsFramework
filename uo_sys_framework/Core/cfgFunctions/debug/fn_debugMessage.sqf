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

#define COMPONENT Debug
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);

if !(UO_FW_Server_DEBUG_Allowed) exitWith {};

params ["_message"];

if (isNil QMGVAR(DebugMessages)) then {MGVAR(DebugMessages) = [];};

if (GETMVAR(Logs,false)) then {
    diag_log _message;
};

if (!(_message in MGVAR(DebugMessages))) then {
    MGVAR(DebugMessages) pushback _message;
};

if (isNull (uiNamespace getVariable [QGVAR(Control),displaynull])) then {
    QGVAR(Layer) cutRsc [QEGVAR(DIA,DEBUG), "PLAIN"];
};

[{
    params ["_message"];
    [{!(isNull (uiNamespace getVariable [QGVAR(Control),displaynull]))}, {
        params ["_message"];
        [] call FUNC(refreshDebug);
        [{
            MGVAR(DebugMessages) = MGVAR(DebugMessages) - [_message];
            [] call FUNC(refreshDebug);
        }, [_message], 30] call CBA_fnc_waitAndExecute;
    }, [_message]] call CBA_fnc_waitUntilAndExecute;
}, [_message]] call CBA_fnc_execNextFrame;
