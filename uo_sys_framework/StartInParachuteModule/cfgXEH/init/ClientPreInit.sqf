#define COMPONENT StartInParachute
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENTHC);

["UO_FW_StartInParachute_PlayerEvent", {
    [{(!isNull player)}, {
        [{
            private _parachuteType = ["NONE","NONSTEERABLE","STEERABLE"] select (UO_FW_GETPLVAR(StartInParachute, 0));
            private _altitude = UO_FW_GETPLVAR(ParachuteAltitude, 300);
            private _randomAltitude = UO_FW_GETPLVAR(ParachuteRandomAltitude, 100);
            switch (_parachuteType) do {
                case "NONE": {};
                case "NONSTEERABLE": {
                    [player,_altitude,_randomAltitude,false] call UO_FW_fnc_DoParachute;
                };
                case "STEERABLE": {
                    [player,_altitude,_randomAltitude,true] call UO_FW_fnc_DoParachute;
                };
            };
        }] call CBA_fnc_ExecNextFrame;
    }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

if !(hasInterface) then {
    ["UO_FW_SettingsLoaded", {
        if (!UO_FW_Server_StartInParachuteModule_Allowed) exitWith {};
        ["UO_FW_StartInParachute_LocalEvent", []] call CBA_fnc_localEvent;
    }] call CBA_fnc_addEventHandler;
} else {
    ["UO_FW_SettingsLoaded", {
        if (!UO_FW_Server_StartInParachuteModule_Allowed) exitWith {};
        ["UO_FW_StartInParachute_PlayerEvent", []] call CBA_fnc_localEvent;
    }] call CBA_fnc_addEventHandler;
};
