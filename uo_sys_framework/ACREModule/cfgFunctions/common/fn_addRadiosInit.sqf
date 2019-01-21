/*    Description: Checks ACRE module values and sets options accordingly
 *    Arguments:
 *         N/A
 *    Return Value:
 *         ARRAY
 *    Author
 *        PiZZADOX
 */
#define COMPONENT ACRE
#include "\x\UO_FW\addons\Main\script_macros.hpp"
if (!UO_FW_ACRE_SETTINGS_Enabled) exitwith {};

if (!isDedicated && hasinterface) then {
    [{(!isNull player) && (isNull acre_player) && ([] call acre_api_fnc_isInitialized)}, {
        if (player getVariable ["UO_FW_ACRE_UNITSETTINGS_Enable",false]) then {
            private ["_SRType","_LRType","_PKType"];

            switch (side player) do {
                case west: {
                    _SRType = ["NONE","ACRE_PRC343","ACRE_SEM52SL"] select UO_FW_ACRE_BLUFOR_SR_Type;
                    _LRType = ["NONE","ACRE_PRC148","ACRE_PRC152"] select UO_FW_ACRE_BLUFOR_LR_Type;
                    _PKType = ["NONE","ACRE_PRC117F","ACRE_PRC77","ACRE_SEM70"] select UO_FW_ACRE_BLUFOR_PK_Type;
                };
                case east: {
                    _SRType = ["NONE","ACRE_PRC343","ACRE_SEM52SL"] select UO_FW_ACRE_OPFOR_SR_Type;
                    _LRType = ["NONE","ACRE_PRC148","ACRE_PRC152"] select UO_FW_ACRE_OPFOR_LR_Type;
                    _PKType = ["NONE","ACRE_PRC117F","ACRE_PRC77","ACRE_SEM70"] select UO_FW_ACRE_OPFOR_PK_Type;
                };
                case independent: {
                    _SRType = ["NONE","ACRE_PRC343","ACRE_SEM52SL"] select UO_FW_ACRE_INDFOR_SR_Type;
                    _LRType = ["NONE","ACRE_PRC148","ACRE_PRC152"] select UO_FW_ACRE_INDFOR_LR_Type;
                    _PKType = ["NONE","ACRE_PRC117F","ACRE_PRC77","ACRE_SEM70"] select UO_FW_ACRE_INDFOR_PK_Type;
                };
                case civilian: {
                    _SRType = ["NONE","ACRE_PRC343","ACRE_SEM52SL"] select UO_FW_ACRE_CIVILIAN_SR_Type;
                    _LRType = ["NONE","ACRE_PRC148","ACRE_PRC152"] select UO_FW_ACRE_CIVILIAN_LR_Type;
                    _PKType = ["NONE","ACRE_PRC117F","ACRE_PRC77","ACRE_SEM70"] select UO_FW_ACRE_CIVILIAN_PK_Type;
                };
                default {};
            };

            if (player getVariable ["UO_FW_ACRE_SR_RADIO_Enabled",false]) then {player addItem _SRType;};
            if (player getVariable ["UO_FW_ACRE_LR_RADIO_Enabled",false]) then {player addItem _LRType;};
            if (player getVariable ["UO_FW_ACRE_PK_RADIO_Enabled",false]) then {player addItem _PKType;};
        };
    }] call CBA_fnc_waitUntilAndExecute;
};
