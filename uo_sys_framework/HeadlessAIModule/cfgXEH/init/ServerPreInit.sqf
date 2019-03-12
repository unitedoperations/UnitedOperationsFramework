#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
EXEC_CHECK(SERVER);

["UO_FW_AI_EH_Event", {

}] call CBA_fnc_addEventHandler;

[QEGVAR(Core,SettingsLoaded), {

}] call CBA_fnc_addEventHandler;

if (isNil "UO_FW_var_HC_ID") then {
    [] call EFUNC(AI,initMain);
};
