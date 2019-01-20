#define COMPONENT MapAndCompassRemover
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

["UO_FW_MapRemover_LocalEvent", {
    [{(CBA_missionTime > 1) && ()}, {
        {
            if (UO_FW_MACR_MAP_ALL) then {
                if !(UO_FW_GETVAR(_x,KeepMapAI,false)) then {
                    _x unlinkItem "ItemMap";
                };
            } else {
                if (UO_FW_GETVAR(_x,RemoveMapAI,false)) then {
                    _x unlinkItem "ItemMap";
                };
            };
            if (UO_FW_MACR_COMPASS_ALL) then {
                if !(UO_FW_GETVAR(_x,KeepCompassAI,false)) then {
                    _x unlinkItem "ItemCompass";
                };
            } else {
                if (UO_FW_GETVAR(_x,RemoveCompassAI,false)) then {
                    _x unlinkItem "ItemCompass";
                };
            };
        } foreach (allUnits select {(local _x) && !(isPlayer _x)});
    }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;
