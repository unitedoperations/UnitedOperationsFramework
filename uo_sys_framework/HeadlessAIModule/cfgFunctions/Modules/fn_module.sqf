/*    Description: Module initialisation checks if modules linked correctly.
 *    Arguments:
 *         STRING    - Mode of Module
 *        ARRAY    - Inputs
 *     Return Value:
 *         BOOL    - True
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

params [["_mode","",[""]],["_input",[],[[]]]];
    if (isNil "UO_FW_AI_initialised") then {call EFUNC(AI,init);};
    switch _mode do {
        case "init": {
            if !is3DEN then {
                _input params ["_logic",["_isActivated",true,[true]]];
                if !(_isActivated) exitWith {};
                private _syncedZoneModule = [_logic,["UO_FW_AI_ZoneModule"]] call EFUNC(AI,getSyncedModules);
                private _Type = typeof _logic;
                if (_syncedZoneModule isEqualto []) then {
                    LOG_2("%1 a %2 has no Zone Modules linked.",_logic,_Type);
                };
                [_logic] spawn UO_FW_AI_fnc_debugSyncedModules;
            };
        };
        case "attributesChanged3DEN": {};
        case "registeredToWorld3DEN": {};
        case "unregisteredFromWorld3DEN": {};
        case "connectionChanged3DEN": {};
        default {};
    };
    true
