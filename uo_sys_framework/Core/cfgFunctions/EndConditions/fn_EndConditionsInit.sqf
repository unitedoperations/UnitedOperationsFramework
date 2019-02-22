/*    Description: Checks end conditions in a loop and ends mission if conditions met
 *    Arguments:
 *         N/A
 *    Return Value:
 *         ARRAY
 *    Author
 *        PiZZADOX
 */

#define COMPONENT EndConditions
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

if (isNil "UO_FW_MissionEnded") then {UO_FW_MissionEnded = false;};
private _delay = (missionNamespace getvariable ["UO_FW_EndConditions_ConditionDelay",0]);
private _frequency = (missionNamespace getvariable ["UO_FW_EndConditions_ConditionSleep",30]);
if (_frequency < 30) then {
    missionNamespace setvariable ["UO_FW_EndConditions_ConditionSleep",30];
    _frequency = 30;
};

[{
    //timelimit loop
    if (UO_FW_Timelimit_Enabled) then {
        if (UO_FW_Timelimit > 0) then {
            LOG_1("checking timelimit: %1",UO_FW_Timelimit);
            LOG_1("checking timelimit message: %1",UO_FW_Timelimit_Message);
            [{
                params ["_argNested", "_idPFH"];
                _argNested params ["_timelimit","_message","_lastCheckedTime"];
                private _timeDifference = (CBA_missionTime - _lastCheckedTime);
                if (_timeDifference <= 1) exitwith {};
                _argNested set [2,CBA_missionTime];
                if (UO_FW_MissionEnded) exitwith {
                    [_idPFH] call CBA_fnc_removePerFrameHandler;
                };
                if ((CBA_missionTime / 60) > _timelimit) exitWith {
                    _message call UO_FW_fnc_EndMission;
                    [_idPFH] call CBA_fnc_removePerFrameHandler;
                };
            }, 60, [UO_FW_Timelimit,UO_FW_Timelimit_Message,CBA_missionTime]] call CBA_fnc_addPerFrameHandler;
        } else {
            ERROR_1("invalid timelimit: %1",UO_FW_Timelimit);
        };
    };

    //exit for custom file
    if (UO_FW_EndConditions_File) exitwith {
        if !(UO_FW_EndConditions_File_Path isEqualto "") then {
            [_frequency] spawn {
                params ["_frequency"];
                private _endScript = (compile preprocessFileLineNumbers UO_FW_EndConditions_File_Path);
                while {!UO_FW_MissionEnded} do {
                    sleep _frequency;
                    [] call _endScript;
                };
            };
        } else {
            ERROR("No file found for End Conditions!");
        };
    };

    //Category 1 loop
    #include "\x\UO_FW\addons\Main\Core\cfgFunctions\EndConditions\defines\Category1Loop.hpp"
    #include "\x\UO_FW\addons\Main\Core\cfgFunctions\EndConditions\defines\Category2Loop.hpp"
    #include "\x\UO_FW\addons\Main\Core\cfgFunctions\EndConditions\defines\Category3Loop.hpp"
    #include "\x\UO_FW\addons\Main\Core\cfgFunctions\EndConditions\defines\Category4Loop.hpp"
    #include "\x\UO_FW\addons\Main\Core\cfgFunctions\EndConditions\defines\Category5Loop.hpp"
    #include "\x\UO_FW\addons\Main\Core\cfgFunctions\EndConditions\defines\Category6Loop.hpp"
}, [], _delay] call CBA_fnc_waitAndExecute;
