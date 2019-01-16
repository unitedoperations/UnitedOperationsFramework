#include "..\..\..\Global\defs.hpp"
if (isServer) then {_id = ["CallDonutFiremission", {_this call UO_FW_FNC_DIA_DonutFiremissionFireServer;}] call CBA_fnc_addEventHandler;};
