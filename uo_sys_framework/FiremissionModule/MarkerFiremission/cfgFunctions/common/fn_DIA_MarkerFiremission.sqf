#include "..\..\..\Global\defs.hpp"
if (isServer) then {_id = ["CallMarkerFiremission", {_this call UO_FW_fnc_DIA_MarkerFiremissionFireServer;}] call CBA_fnc_addEventHandler;};
