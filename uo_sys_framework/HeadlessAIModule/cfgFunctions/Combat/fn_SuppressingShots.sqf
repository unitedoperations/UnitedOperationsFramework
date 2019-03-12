//An extra layer of suppression that will hopefully make AI go for cover better...
//If framerate is below 20 - exit this script.

#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

private ["_unit", "_bullet", "_TimeShot","_FrameRateCheck", "_Unit", "_Array2", "_Point", "_ArrayCheck", "_UnitGroup", "_CheckVariable1", "_CheckDistance"];

private _FrameRateCheck = diag_fps;
if (_FrameRateCheck <= UO_FW_AI_FPSFreeze) exitWith {};

_unit = (_this select 0) select 0;

if (UO_FW_AI_CurrentlySuppressing < UO_FW_AI_CurrentlySuppressingLimit) then {
    UO_FW_AI_CurrentlySuppressing = UO_FW_AI_CurrentlySuppressing + 1;
    _TimeShot = _unit getVariable "UO_FW_AI_FiredTime";
    if ((diag_tickTime - _TimeShot) > 25) then {
        _unit setVariable ["UO_FW_AI_FiredTime",diag_tickTime,true];
        private _pos = cursorTarget;
        if (isNull _pos) then {
            if (isPlayer _Unit) then {
                //Remember, screenToWorld is using UI coordinates!
                _pos = screenToWorld [0.5,0.5];
            } else {
                _pos = assignedTarget _Unit;
                if (isNull _pos) then {
                    _pos = getPosATL _Unit
                };
            };
        } else {
            _pos = getPosATL _pos;
        };

        _Point = _Unit call EFUNC(AI,ClosestEnemy);
        if (_Point isEqualTo [] || {isNil "_Point"}) exitWith {};
        _ArrayCheck = typeName _Point;
        if (_ArrayCheck isEqualTo "ARRAY") exitWith {};
        _UnitGroup = group _Point;

        {
                _CheckDistance = (_pos distance _x);
                private _Kn = _unit knowsAbout _x;
                if (_CheckDistance < 4 && (_Kn > 3.5)) then {
                    if (UO_FW_AI_Suppression) then {
                        if !(isPlayer _x) then {
                            _x setCustomAimCoef UO_FW_AI_SuppressionVar;
                            _x spawn {
                                params ["_thisunit"];
                                sleep 8;
                                _thisunit setCustomAimCoef 1;
                            };
                        };
                    };
                    if (UO_FW_AI_Adrenaline) then {
                        if !(isPlayer _x) then {
                            _x setAnimSpeedCoef UO_FW_AI_AdrenalineVar;
                            _x spawn {
                                params ["_thisunit"];
                                sleep 8;
                                _thisunit setAnimSpeedCoef 1;
                            };
                        };
                    };
                    if (UO_FW_AI_DEBUG) then {
                        LOG_1("%1 is suppressed!",_x);
                    };

                };
        } forEach units _UnitGroup;
    };
    UO_FW_AI_CurrentlySuppressing = UO_FW_AI_CurrentlySuppressing - 1;
};
