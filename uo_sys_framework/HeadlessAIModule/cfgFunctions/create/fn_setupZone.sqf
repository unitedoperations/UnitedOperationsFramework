/*    Description: Sets up a zone and any units, objects or modules linked to the zone once activated.
 *    Arguments:
 *         OBJECT    - Zone Module (name, _logic)
 *        NUMBER    - Zone Activation Delay
 *        STRING    - Code as String to Execute on Activation
 *        BOOL    - Initial/PreInit Spawn
 *     Return Value:
 *         BOOL    - True
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);


params ["_logic",["_delay",0,[0]],["_code",{},[{}]],["_initial",false],["_entitiesArray",[],[[]]]];
private ["_entities"];
LOG_1("setupZone started _logic: %1",_logic);
if !(_initial) then {
    if ((tolower(typeOf _logic)) in ["uo_fw_ai_controlmodule", "uo_fw_ai_controlmodule_r"]) then {
        [_logic] spawn {
            params ["_logic"];
            switch (GETVAR(_logic,ControlAction,0)) do {
                case 0 : {
                    // Enable Linked Zones
                    [([_logic,["UO_FW_AI_ZoneModule","UO_FW_AI_ZoneModule_R"]] call EFUNC(AI,getSyncedModules)),0] call EFUNC(AI,setZone);
                };
                case 1 : {
                    // Disable Linked Zones
                    [([_logic,["UO_FW_AI_ZoneModule","UO_FW_AI_ZoneModule_R"]] call EFUNC(AI,getSyncedModules)),1] call EFUNC(AI,setZone);
                };
                case 2 : {
                    // Toggle Linked Zones
                    [([_logic,["UO_FW_AI_ZoneModule","UO_FW_AI_ZoneModule_R"]] call EFUNC(AI,getSyncedModules)),2] call EFUNC(AI,setZone);
                };
            };
        };
    };
};
//TODO
//private _syncedFunctions = [_logic,UO_FW_AI_functions] call EFUNC(AI,getSyncedModules);
//if (count _syncedFunctions > 0) then {
//    [_syncedFunctions,_delay] spawn UO_FW_AI_fnc_createFunctions;
//};
LOG_2("_logic: %1 _initial: %2",_logic,_initial);
if (_initial) then {
    _entities = _entitiesArray;
} else {
    _entities = (([_logic,UO_FW_AI_entities] call EFUNC(AI,getDetails)) select 1);
};
LOG_2("_logic: %1 _entities: %2",_logic,_entities);
if !(_entities isEqualto []) then {
    if (!isMultiplayer) then {
        LOG("!isMultiplayer, createZone function executed");
        [[_logic,_entities,_delay,_code],_initial] call EFUNC(AI,createZone);
    } else {
        params ["_logic","_entities","_delay","_code","_initial"];
        LOG_1("sending createZone function to clientid %1",UO_FW_var_HC_ID);
        [[[_logic,_entities,_delay,_code],_initial], {if (UO_FW_var_isHC) then {_this call EFUNC(AI,createZone);};}] remoteExec ["bis_fnc_call", UO_FW_var_HC_ID];
    };
};

//private _entities = (([_logic,UO_FW_AI_entities] call EFUNC(AI,getDetails)) select 1);
//if (count _entities > 0) then {
//    if (_initial) then {
//        [_logic,_entities,_code] call EFUNC(AI,createZoneInit);
//        _logic setvariable ["initiallyspawned",true];
//    } else {
//        [_logic,_entities,_delay,_code] call EFUNC(AI,createZone);
//    };
//};

{
    {
        [[_x,(_x getVariable "UO_FW_AI_Template"),_delay,_code]] spawn UO_FW_AI_fnc_createZone;
    } foreach ([_x,["UO_FW_AI_TemplateModule"]] call EFUNC(AI,getSyncedModules));
} foreach ([_logic,["UO_FW_AI_PositionModule"]] call EFUNC(AI,getSyncedModules));
//for "_p" from 0 to (count _posModules) step 1 do {
//    private _tempModules = [(_posModules select _p),["UO_FW_AI_TemplateModule"]] call EFUNC(AI,getSyncedModules);
//    for "_t" from 0 to (count _tempModules) step 1 do {
//        [(_tempModules select _t),((_tempModules select _t) getVariable "UO_FW_AI_Template"),_delay,{}] spawn UO_FW_AI_fnc_createZone;
//    };
//};
{
    _x spawn UO_FW_AI_fnc_setRespawn;
} forEach ([_logic,["UO_FW_AI_RespawnModule"]] call EFUNC(AI,getSyncedModules));
true
