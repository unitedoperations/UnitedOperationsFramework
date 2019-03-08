#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
EXEC_CHECK(CLIENTHC);

["UO_FW_AI_Event", {

}] call CBA_fnc_addEventHandler;

if !(hasInterface) then {
    [] call EFUNC(AI,initMain);
};
