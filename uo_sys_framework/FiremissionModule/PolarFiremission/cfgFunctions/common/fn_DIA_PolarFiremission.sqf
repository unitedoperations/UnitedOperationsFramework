#include "..\..\..\Global\defs.hpp"
if (isServer) then {_id = ["CallPolarFiremission", {_this call UO_FW_FNC_DIA_PolarFiremissionFireServer;}] call CBA_fnc_addEventHandler;};
