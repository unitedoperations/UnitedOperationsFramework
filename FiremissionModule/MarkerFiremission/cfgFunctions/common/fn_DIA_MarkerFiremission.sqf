#include "..\..\..\Global\defs.hpp"
if(isServer) then {_id = ["CallMarkerFiremission", {_this call UO_FW_FNC_DIA_MarkerFiremissionFireServer;}] call CBA_fnc_addEventHandler;};
