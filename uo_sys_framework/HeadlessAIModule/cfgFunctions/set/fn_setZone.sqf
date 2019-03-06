#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params[["_zoneModules",[],[[]]],["_status",0,[0]]];
if (count _zoneModules > 0) then {
    {
        private _zoneModule = _x;
        private _set = if (_status isEqualTo 2) then {([1,0] select (([_zoneModule,UO_FW_AI_Zones] call EFUNC(AI,getDetails)) select 3))} else {_status};
        ([_zoneModule,UO_FW_AI_Zones] call EFUNC(AI,getDetails)) set [3, _set];
    } foreach _zoneModules;
};
true
