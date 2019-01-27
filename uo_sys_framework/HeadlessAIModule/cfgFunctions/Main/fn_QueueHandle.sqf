#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(HC);

if (!(UO_FW_AI_Enabled)) exitWith {};

UO_FW_AI_UnitQueue = [];
private _HCQueueHandlePFH = [{
    if (UO_FW_AI_UnitQueue isEqualTo []) exitwith {};
    scopeName "QueueHandleMain";
    private _ConsideringUnit = UO_FW_AI_UnitQueue select 0;
    if ((isNull _ConsideringUnit)
        || ((vehicle _ConsideringUnit) getVariable ["UO_FW_AI_NOAI",false])
        || ((vehicle _ConsideringUnit) isKindOf "Plane")
        || (side _ConsideringUnit in UO_FW_AI_SideBasedExecution)
    ) exitwith {
        UO_FW_AI_UnitQueue deleteAt 0;
        _ConsideringUnit forcespeed -1;
    };
    UO_FW_AI_UnitQueue deleteAt 0;
    [_ConsideringUnit] execFSM "x\UO_FW\addons\Main\HeadlessAIModule\cfgFunctions\FSM\AIBEHAVIORTEST.fsm";
    {
        if (isNull _x) then {
            UO_FW_AI_ActiveList deleteAt _foreachIndex;
        };
    } foreach UO_FW_AI_ActiveList;
}, 60] call CBA_fnc_addPerFrameHandler;
