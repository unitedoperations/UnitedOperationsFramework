#include "x\UO_FW\addons\main\FiremissionModule\Global\defs.hpp"
if(isServer) then {_id = ["CallGridSpottingFiremission", {_this call UO_FW_FNC_DIA_GridSpottingFiremissionFireServer;}] call CBA_fnc_addEventHandler;};
