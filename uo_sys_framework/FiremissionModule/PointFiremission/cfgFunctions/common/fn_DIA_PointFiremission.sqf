#include "..\..\..\Global\defs.hpp"

if (isServer) then {_id = ["CallPointFiremission", {_this call UO_FW_fnc_DIA_PointFiremissionFireServer;}] call CBA_fnc_addEventHandler;};
