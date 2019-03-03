#define COMPONENT AILink
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC);

["UO_FW_SettingsLoaded", {
    if (!(GETMVAR(Enabled,false))) exitWith {};
    ["UO_FW_RegisterModuleEvent", ["AI link", "Shares targeting information between AI groups based on radios.", "TinfoilHate and Sacher"]] call CBA_fnc_globalEventJiP;
    [{call FUNC(Link)},[],GVAR(startDelay)] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
