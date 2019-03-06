/*    Description: Zone Module initialisation creates the zone.
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
switch _mode do {
    case "init": {
        if !(is3DEN) then {
            if (isNil "UO_FW_AI_initialised") then {[] call EFUNC(AI,init);};
            _input params ["_logic",["_isActivated",true,[true]]];
            if !(_isActivated) exitWith {};
            {
                UO_FW_AI_respawns pushBack _x;
            } forEach ([_logic,["UO_FW_AI_RespawnModule"]] call EFUNC(AI,getSyncedModules));

            private _initial = GETVAR(_logic,zoneInitial,false);
            private _code = _logic getVariable ["UO_FW_AI_zoneCode",""];
            if (!(_code isEqualTo "") && {_code isEqualType "STRING"}) then {_code = compile _code;};
            private _cond = _logic getVariable ["UO_FW_AI_zoneCondition",""];
            if (!(_cond isEqualTo "") && {_cond isEqualType "STRING"}) then {_cond = compile _cond;};
            private _isRectangle = if ((typeof _logic) isEqualTo "UO_FW_AI_ZoneModule_R") then {true} else {false};
            private _entities = [_logic] call EFUNC(AI,getSyncedObjects);
            LOG_1("_entities: %1",_entities);

            if (_initial) then {
                [_logic,0,_code,_initial,_entities] call EFUNC(AI,setupZone);
                _logic setVariable ["UO_FW_AI_zone_activated",true];
                LOG_1("_zone: %1 initially activated",_logic);
            } else {
                UO_FW_AI_Zones pushBack [
                    _logic,
                    (getPosATL _logic),
                    (GETVAR(_logic,zoneRadiusX,100)),
                    false,
                    ([GETVAR(_logic,Zoneside,4)] call EFUNC(AI,getSide)),
                    (UO_FW_AI_zoneTypes select (GETVAR(_logic,zoneType,1))),
                    _cond,
                    (GETVAR(_logic,zoneDelay,0)),
                    _code,
                    (GETVAR(_logic,zoneRadiusY,100)),
                    _isRectangle,
                    (getDir _logic),
                    (GETVAR(_logic,ZoneHazard,false)),
                    (GETVAR(_logic,zoneSuspend,0))
                ];

                LOG_1("_zone added to Zones array: %1",_logic);
                LOG_2("_zone: %1 entities: %2",_logic,_entities);
                UO_FW_AI_entities pushBack [_logic,_entities];
                UO_FW_AI_zoneInit pushBack _logic;
                if ((count UO_FW_AI_zoneInit) >= (count (entities [["UO_FW_AI_ZoneModule_R","UO_FW_AI_ZoneModule"],[]])) && {!UO_FW_AI_templateCleanup}) then {
                    UO_FW_AI_templatesyncedObjects = UO_FW_AI_templatesyncedObjects arrayIntersect UO_FW_AI_templatesyncedObjects;
                    [UO_FW_AI_templatesyncedObjects] call EFUNC(AI,deleteVehicles);
                    UO_FW_AI_templateCleanup = true;
                };

                if (UO_FW_AI_DEBUG) then {
                    private _syncedModules = [_logic,[]] call EFUNC(AI,getSyncedModules);
                    _entities params [["_grps",[],[[]]],["_emptyvehs",[],[[]]],["_objs",[],[[]]]];
                    if ((_syncedModules isEqualto [])
                        && {({(count _x) > 0 } count _grps) == 0}
                        && {({(count _x) > 0 } count _emptyvehs) == 0}
                        && {({(count _x) > 0 } count _objs) == 0}
                    ) then {
                        LOG_2("%1 a %2 has nothing linked.\nYou can link Units, Groups, Objects or other modules to a Zone Module.",_logic,typeof _logic);
                    };
                    [_logic] spawn UO_FW_AI_fnc_debugSyncedModules;
                };
            };
        };
    };
    case "attributesChanged3DEN": {
        private _logic = _input param [0,objNull,[objNull]];
        private _radiusX = _logic getVariable ["UO_FW_AI_zoneRadiusX",_logic getVariable ["UO_FW_AI_zoneRadiusX", 100]];
        private _radiusY = _logic getVariable ["UO_FW_AI_zoneRadiusY",_logic getVariable ["UO_FW_AI_zoneRadiusY", 100]];
        set3DENAttributes [[[_logic],"size2",[_radiusX,_radiusY]]];
    };
    default {};
};
true
