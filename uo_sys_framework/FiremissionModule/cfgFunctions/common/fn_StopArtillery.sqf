#include "..\..\Global\defs.hpp"
if (isServer) then {
            [_this , false] call EFUNC(Firemission,SetArtyReadyStatus);
            [_this , false] call EFUNC(Firemission,SetArtyReadyStatus);
            terminate (_this getVariable [QEGVAR(Firemission,ArtHandle),scriptNULL]);

    };