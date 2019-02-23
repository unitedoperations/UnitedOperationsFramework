#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

switch (true) do {
    case (UO_FW_VERSIONNUMBER >= 103): {};
    case (UO_FW_VERSIONNUMBER <= 102): {
        ["UO_FW_SettingsLoaded", {
            ["UO_FW_Gear_LocalObjectsGearLoad", []] call CBA_fnc_localEvent;
        }] call CBA_fnc_addEventHandler;
    };
};
