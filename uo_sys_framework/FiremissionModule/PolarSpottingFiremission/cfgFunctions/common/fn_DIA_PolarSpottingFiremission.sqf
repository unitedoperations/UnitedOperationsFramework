#include "..\..\..\Global\defs.hpp"
if(isServer) then {_id = ["CallPolarSpotting", {_this call UO_FW_FNC_DIA_PolarSpottingFiremissionFireServer;}] call CBA_fnc_addEventHandler;};
