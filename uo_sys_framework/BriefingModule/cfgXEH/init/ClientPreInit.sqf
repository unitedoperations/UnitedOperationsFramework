#define COMPONENT Briefing
#include "\x\UO_FW\addons\Main\BriefingModule\module_macros.hpp"
EXEC_CHECK(CLIENT);

[QEGVAR(Core,SettingsLoaded), {
    [{!isNull player}, {
        private _briefing = [];
        switch (side player) do {
            case west: {
                #include "\x\UO_FW\addons\Main\BriefingModule\defines\blufor_briefing.hpp"
            };
            case east: {
                #include "\x\UO_FW\addons\Main\BriefingModule\defines\opfor_briefing.hpp"
            };
            case independent: {
                #include "\x\UO_FW\addons\Main\BriefingModule\defines\indfor_briefing.hpp"
            };
            case civilian: {
                #include "\x\UO_FW\addons\Main\BriefingModule\defines\civilian_briefing.hpp"
            };
        };
    }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;
