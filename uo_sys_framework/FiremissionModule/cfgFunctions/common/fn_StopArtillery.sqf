#include "..\..\Global\defs.hpp"
if (isServer) then {
            [_this , false] call UO_FW_fnc_SetArtyReadyStatus;
            [_this , false] call UO_FW_fnc_SetArtyReadyStatus;
            terminate (_this getVariable [VAR_SART_FMHANDLE,scriptNULL]);

    };