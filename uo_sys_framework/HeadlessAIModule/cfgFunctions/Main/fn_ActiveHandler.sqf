#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(HC);

if (!(UO_FW_AI_Enabled)) exitWith {};

private _HCQueueHandlePFH = [{
    if (isNil "UO_FW_AI_ActiveList") then {UO_FW_AI_ActiveList = [];};
    {
        if (isNull _x) then {
            UO_FW_AI_ActiveList deleteAt _foreachIndex;
        };
    } foreach UO_FW_AI_ActiveList;
}, 60] call CBA_fnc_addPerFrameHandler;
