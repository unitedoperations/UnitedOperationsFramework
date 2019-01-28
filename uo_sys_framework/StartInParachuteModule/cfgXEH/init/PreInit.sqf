#define COMPONENT StartInParachute
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

["UO_FW_StartInParachute_LocalEvent", {
    {
        private _parachuteType = ["NONE","NONSTEERABLE","STEERABLE"] select (GETVAR(_x,StartInParachute, 0));
        private _altitude = GETVAR(_x,ParachuteAltitude, 300);
        private _randomAltitude = GETVAR(_x,ParachuteRandomAltitude, 100);
        switch (_parachuteType) do {
            case "NONE": {};
            case "NONSTEERABLE": {
                [_x,_altitude,_randomAltitude,false] call UO_FW_fnc_DoParachute;
            };
            case "STEERABLE": {
                [_x,_altitude,_randomAltitude,true] call UO_FW_fnc_DoParachute;
            };
        };
    } forEach (allUnits select {local _x && (!isPlayer _x)});
}] call CBA_fnc_addEventHandler;
