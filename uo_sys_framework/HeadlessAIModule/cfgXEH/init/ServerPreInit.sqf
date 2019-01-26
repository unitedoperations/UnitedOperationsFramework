#define COMPONENT ShotCount
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

["UO_FW_AI_EH_Event", {

}] call CBA_fnc_addEventHandler;

["UO_FW_SettingsLoaded", {

}] call CBA_fnc_addEventHandler;
