#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

params ["_group"];

private _return = false;
{
    if ([_x] call acre_api_fnc_hasRadio) exitwith {_return = true;};
} foreach units _group;

_return
