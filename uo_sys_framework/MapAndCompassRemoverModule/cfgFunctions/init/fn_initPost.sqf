#define COMPONENT MapAndCompassRemover
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);
if !(UO_FW_Server_MapAndCompassRemover_Allowed) exitwith {};
if !(GETMVAR(Enabled,false)) exitwith {};

params ["_obj"];
if !(_obj isKindOf "Man") exitwith {};

[QEGVAR(Core,RegisterModuleEvent), ["Map and Compass Remover", "Removes Map and Compass after briefing", "TinfoilHate, Sacher and PiZZADOX"]] call CBA_fnc_localEvent;

[{CBA_MissionTime > 0},{
    params ["_obj"];
    if (GETVAR(_obj,RemoveCompass,false)) then {
        _obj unlinkItem "ItemCompass";
    };

    if (GETVAR(_obj,RemoveMap,false)) then {
        _obj unlinkItem "ItemMap";
    };
    if !(isPlayer _obj) then {
        if (GETMVAR(RemoveAllCompass,false)) then {
            if (GETMVAR(AI_LeadersKeepCompass,false)) then {
                if !(leader _obj isEqualto _obj) then {
                    _obj unlinkItem "ItemCompass";
                };
            } else {
                _obj unlinkItem "ItemCompass";
            };
        };
        if (GETMVAR(RemoveAllMaps,false)) then {
            if (GETMVAR(AI_LeadersKeepMap,false)) then {
                if !(leader _obj isEqualto _obj) then {
                    _obj unlinkItem "ItemMap";
                };
            } else {
                _obj unlinkItem "ItemMap";
            };
        };
    };
}, [_obj]] call CBA_fnc_waitUntilandExecute;
