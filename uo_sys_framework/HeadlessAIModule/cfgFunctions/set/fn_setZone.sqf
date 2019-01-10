#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params[["_zoneModules",[],[[]]],["_status",0,[0]],["_z",0,[0]]];
if (count _zoneModules > 0) then {
	for [{_z=0}, {(_z < count _zoneModules)}, {_z = _z + 1}] do {
		_zoneModule = _zoneModules select _z;
		_set = if(_status == 2) then {([1,0] select (([_zoneModule,UO_FW_AI_Zones] call UO_FW_AI_fnc_getDetails) select 3))} else {_status};
		([_zoneModule,UO_FW_AI_Zones] call UO_FW_AI_fnc_getDetails) set [3, _set];
	};
};
true
