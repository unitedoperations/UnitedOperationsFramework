/*    Description: Enable Zone Module initialisation disables attached zones and creates a zone out of zone enable module that when activated enables the connected zones modules.
 *    Arguments:
 *         OBJECT    - Module (name, _logic)
 *        ARRAY    - Units (synced to module)
 *        BOOL    - Module Activated
 *     Return Value:
 *         BOOL    - True
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(ALL);

params [["_mode","",[""]],["_input",[],[[]]]];
    if (isNil "UO_FW_AI_initialised") then {call UO_FW_AI_fnc_init;};
    switch _mode do {
        case "init": {
            if !is3DEN then {
                _input params ["_logic",["_isActivated",true,[true]]];
                if !(_isActivated) exitWith {};
                sleep 1;
                UO_FW_AI_EXEC_CHECK(SERVERHC);
                // Disable Linked Zones
                private _syncedZoneModules = [_logic,["UO_FW_AI_ZoneModule","UO_FW_AI_ZoneModule_R"]] call UO_FW_AI_fnc_getSyncedModules;
                if (count _syncedZoneModules > 0) then {
                    for "_z" from 0 to (count _syncedZoneModules) step 1 do {
                        private _syncedZoneModule = _syncedZoneModules select _z;
                        ([_syncedZoneModule,UO_FW_AI_Zones] call UO_FW_AI_fnc_getDetails) set [3, 1];
                    };
                };
                //Setup Suspend Module as Zone
                private _cond = _logic getVariable ["UO_FW_AI_EnableZoneCondition","false"];
                if (typename _cond isEqualTo "STRING") then {_cond = compile _cond;};
                private _code = _logic getVariable ["UO_FW_AI_EnableZoneCode","true"];
                if (typename _code isEqualTo "STRING") then {_code = compile _code;};
                private _isRectangle = if ((typeof _logic) isEqualTo "UO_FW_AI_ZoneModule_R") then {true} else {false};
                UO_FW_AI_Zones pushBack [
                    _logic,
                    (getPosATL _logic),
                    (_logic getVariable ["UO_FW_AI_EnableZoneRadiusX",200]),
                    0,
                    ([_logic getVariable ["UO_FW_AI_EnableZoneSide",0]] call UO_FW_AI_fnc_getSide),
                    (UO_FW_AI_zoneTypes select (_logic getVariable ["UO_FW_AI_EnableZoneType",1])),
                    _cond,
                    (_logic getVariable ["UO_FW_AI_EnableZoneDelay",0]),
                    _code,
                    (_logic getVariable ["UO_FW_AI_EnableZoneRadiusY",200]),
                    _isRectangle,
                    (getDir _logic),
                    (_logic getVariable ["UO_FW_AI_ZoneHazard",false])
                ];
                private _entities = [_logic] call UO_FW_AI_fnc_getSyncedObjects;
                UO_FW_AI_entities pushBack [_logic,_entities];
                if (UO_FW_AI_DEBUG) then {
                    private _syncedZoneModule = [_logic,["UO_FW_AI_ZoneModule","UO_FW_AI_ZoneModule_R"]] call UO_FW_AI_fnc_getSyncedModules;
                    if (_syncedZoneModule isEqualto []) then {
                        (format["%1 a %2 has no Zone Modules linked.\nLink a Zone Module to the Enable Zone Module to suspend and enable Zones when the Enable Zone Module is activated.",_logic,typeof _logic]) call UO_FW_fnc_DebugMessage;
                    };
                    [_logic] spawn UO_FW_AI_fnc_debugSyncedModules;
                };

            };
        };
        case "attributesChanged3DEN": {
            private _logic = _input param [0,objNull,[objNull]];
            private _radiusX = _logic getVariable ["UO_FW_AI_EnableZoneRadiusX",_logic getVariable ["UO_FW_AI_EnableZoneRadius", 100]];
            private _radiusY = _logic getVariable ["UO_FW_AI_EnableZoneRadiusY",_logic getVariable ["UO_FW_AI_EnableZoneRadius", 100]];
            set3DENAttributes [[[_logic],"size2",[_radiusX,_radiusY]]];
        };
        case "registeredToWorld3DEN": {
            private _logic = _input param [0,objNull,[objNull]];
            // ... code here...
        };
        case "unregisteredFromWorld3DEN": {
            private _logic = _input param [0,objNull,[objNull]];
            // ... code here...
        };
        case "connectionChanged3DEN": {
            private _logic = _input param [0,objNull,[objNull]];
            // ... code here...
        };
        default {};
    };
    true
