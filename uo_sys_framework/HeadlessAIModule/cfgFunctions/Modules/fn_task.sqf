/*    Description: Task Module initialisation creates the zone.
 *    Arguments:
 *         OBJECT    - Module (name, _logic)
 *        ARRAY    - Units (synced to module)
 *        BOOL    - Module Activated
 *     Return Value:
 *         BOOL    - True
 *    Author
 *        suits & PiZZADOX & Lecks
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
                if (count ([_logic ,["UO_FW_AI_ZoneModule","UO_FW_AI_ZoneModule_R"]] call EFUNC(AI,getSyncedModules)) > 0 ) then {
                    _logic setVariable["UO_FW_AI_taskZoneActivated",true];
                };
                [_logic] spawn UO_FW_AI_fnc_debugSyncedModules;
            };
        };
        case "attributesChanged3DEN": {
            private _logic = _input param [0,objNull,[objNull]];
            private _radius = (GETVAR(_logic,taskRadius,100));
            set3DENAttributes [[[_logic],"size2",[_radius,_radius]]];
        };
    };
    true
