#define COMPONENT MapAndCompassRemover
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC);

["UO_FW_SettingsLoaded", {
    if (!UO_FW_Server_RemoverModule_Allowed) exitWith {};
    ["UO_FW_RegisterModuleEvent", ["Map and Compass Remover", "Removes Map and Compass upon spawn", "TinfoilHate, Sacher and PiZZADOX"]] call CBA_fnc_globalEvent;
    [{(CBA_missionTime > 1)}, {
        {
            if (UO_FW_MACR_MAP_ALL) then {
                if !(_x getvariable ["UO_FW_KeepMapAI",false]) then {_x unlinkItem "ItemMap";};
            } else {
                if (_x getVariable ["UO_FW_RemoveMap",false]) then {
                    _x unlinkItem "ItemMap";
                };
            };
            if (UO_FW_MACR_COMPASS_ALL) then {
                if !(_x getvariable ["UO_FW_KeepCompassAI",false]) then {_x unlinkItem "ItemCompass";};
            } else {
                if (_x getVariable ["UO_FW_RemoveCompass",false]) then {
                    _x unlinkItem "ItemCompass";
                };
            };
        } foreach (allUnits select {(local _x) && !(isPlayer _x)});
    }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;
