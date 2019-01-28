#define COMPONENT TeamColour
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

["UO_FW_TeamColour_Event", {
    if (!UO_FW_Server_TeamColourModule_Allowed) exitWith {};
    [{(!isNull player) && {(CBA_missionTime > 1)}}, {
        private _colour = (GETPLVAR(TeamColour,"NONE"));
        if (_colour isEqualto "White") then {_colour = "MAIN";};
        if !(_colour isEqualto "NONE") then {
            ["CBA_teamColorChanged", [player, _colour]] call CBA_fnc_globalEvent;
        };
    }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

["UO_FW_SettingsLoaded", {
    ["UO_FW_TeamColour_Event", []] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;
