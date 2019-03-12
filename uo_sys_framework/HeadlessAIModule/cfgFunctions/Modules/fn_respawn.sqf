/*    Description: Respawn Module moves the respawn point when linked zone is active.
 *    Arguments:
 *         OBJECT    - Module (name, _logic)
 *        ARRAY    - Units (synced to module)
 *        BOOL    - Module Activated
 *     Return Value:
 *         BOOL    - True
 *    Author
 *        suits & PiZZADOX
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
