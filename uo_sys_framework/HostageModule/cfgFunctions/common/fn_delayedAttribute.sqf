#define COMPONENT Hostage
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);

params ["_object",["_value",false,[false]]];

private _marker = _this getvariable ['UO_FW_Hostage_Rescue_Location','hostage_rescue'];
_marker setMarkerAlpha 0;

    params ["","_object","_fnc","_value"];
    if (local _object) then {
        LOG_2("_object: %1 calling _fnc: %2",_object,_fnc);
        [_object,_value] call FUNC(Set);
    };
},[_time,_object,_fnc,_value]] call CBA_fnc_WaitUntilAndExecute;
