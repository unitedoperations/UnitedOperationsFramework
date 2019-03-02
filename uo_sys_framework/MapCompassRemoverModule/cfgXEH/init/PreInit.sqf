#define COMPONENT MapAndCompassRemover
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

["UO_FW_MapRemover_LocalEvent", {
    [{(CBA_missionTime > 1)},{
        {
            if (GETMVAR(MAP_ALL)) then {
                if !(GETVAR(_x,KeepMapAI,false)) then {
                    _x unlinkItem "ItemMap";
                };
            } else {
                if (GETVAR(_x,RemoveMapAI,false)) then {
                    _x unlinkItem "ItemMap";
                };
            };
            if (GETMVAR(COMPASS_ALL)) then {
                if !(GETVAR(_x,KeepCompassAI,false)) then {
                    _x unlinkItem "ItemCompass";
                };
            } else {
                if (GETVAR(_x,RemoveCompassAI,false)) then {
                    _x unlinkItem "ItemCompass";
                };
            };
        } foreach (allUnits select {(local _x) && !(isPlayer _x)});
    }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;
