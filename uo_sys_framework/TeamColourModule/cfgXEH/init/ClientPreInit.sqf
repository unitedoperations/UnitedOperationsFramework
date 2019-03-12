#define COMPONENT TeamColour
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(CLIENT);
if (!UO_FW_Server_TeamColourModule_Allowed) exitWith {};

[QGVAR(Event), {
    [{(!isNull player) && {(CBA_missionTime > 1)}}, {
        private _colour = (GETPLVAR(Colour,"NONE"));
        if (_colour isEqualto "White") then {_colour = "MAIN";};
        if !(_colour isEqualto "NONE") then {
            ["CBA_teamColorChanged", [player, _colour]] call CBA_fnc_globalEvent;
        };
    }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

[QEGVAR(Core,SettingsLoaded), {
    [QGVAR(Event), []] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;
