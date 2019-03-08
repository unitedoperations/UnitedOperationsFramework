#define COMPONENT AOLimit
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(CLIENT);

params ["_display"];

[{!(displayNull isEqualto _this)}, {
    disableserialization;
    params ["_display"];
    private _endTime = (CBA_missionTime + (GETMVAR(TimeLeft,30)));
    private _nextBeep = _endTime - 10;

    [QGVAR(SetupTimer,Notification_Ended)] call BIS_fnc_showNotification;

    SETMVAR(DisplayOpen,true);

    GVAR(SoftPFHhandle) = [{
        params ["_argNested", "_idPFH"];
        _argNested params ["_endTime","_nextBeep",["_colorSet",["IGUI","TEXT_RGB"]],"_display"];

        private _ctrlTime = _display displayCtrl 1003;
        private _shouldDisplay = GETMVAR(Display,false);
        private _timeleft = _endTime - CBA_missionTime;

        if !(_shouldDisplay) exitwith {
            SETMVAR(DisplayOpen,false);
            [{
                _this closeDisplay 1;
            }, _display, 1] call CBA_fnc_waitAndExecute;
            [_idPFH] call CBA_fnc_removePerFrameHandler;
        };

        if (_timeLeft <= 0) exitwith {
            SETMVAR(DisplayOpen,false);
            _ctrlTime ctrlSetText "00:00.000";
            [{
                player setDamage 1;
                _this closeDisplay 1;
            }, _display, 1] call CBA_fnc_waitAndExecute;
            [_idPFH] call CBA_fnc_removePerFrameHandler;
        };

        if (CBA_missionTime >= _nextBeep) then {
            playSound "Beep_Target";
            _nextBeep = _nextBeep + 1;
            _argNested set [2,_nextBeep];
        };

        if (_timeLeft <= 10) then {
            if (_timeLeft <= 5) then {
                _colorSet = ["IGUI","ERROR_RGB"];
                _argNested set [3,_colorSet];
            } else {
                _colorSet = ["IGUI","WARNING_RGB"];
                _argNested set [3,_colorSet];
            }
        };

        private _color = _colorSet call bis_fnc_displaycolorget;
        _ctrlTime ctrlSetTextColor _color;
        _ctrlTime ctrlSetText ([_timeLeft,"MM:SS.MS"] call bis_fnc_secondsToString);

    }, 0, [_endTime,_nextBeep,["IGUI","TEXT_RGB"]],_display] call CBA_fnc_addPerFrameHandler;
}, _display] call CBA_fnc_waitUntilAndExecute;
