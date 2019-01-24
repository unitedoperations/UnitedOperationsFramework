/*    Description: Populates the zone with all linked units, vehicles and objects.
 *     Arguments:
 *         ARRAY    - Entities
 *         NUMBER    - Spawn Delay
 *     Return Value:
 *         BOOL     - True
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

params ["_args",["_initmode",false,[false]]];
_args params [["_zone",objNull,[objNull]],["_entities",[],[[]]],["_delay",0,[0]],["_code",{},[{}]]];
if !(_initmode) then {
    sleep _delay;
};
_entities params [["_grps",[],[[]]],["_emptyvehs",[],[[]]],["_objs",[],[[]]]];
{
    private _veh = _x;
    private _v = createVehicle [(_veh select 0),(_veh select 1),[],0,"CAN_COLLIDE"];
    _v setPosATL (_veh select 1);
    _v setVectorDirAndUp [_veh select 2,_veh select 3];
    _v setDamage (_veh select 4);
    _v setFuel (_veh select 5);
    {
        _x params [["_class","",[""]],["_path",[],[[]]],["_ammo",0,[0]]];
        _v setMagazineTurretAmmo [_class,_ammo,_path];
    } forEach (_veh select 6);
    _v lock (_veh select 7);
    if ((count (_veh select 9)) > 1) then {
        missionNamespace setVariable[(_veh select 9), _v];
    };
    [_v,(_veh select 10)] call UO_FW_AI_fnc_setPersistent;
    _v spawn (_veh select 11);
    if !(_initmode) then {
        sleep 0.25;
    };
} forEach _emptyvehs;
{
    private _obj = _x;
    private _o = createVehicle [(_obj select 0),(_obj select 1),[],0,"CAN_COLLIDE"];
    _o setVectorDirAndUp [_obj select 2,_obj select 3];
    _o setPosATL (_obj select 1);
    _o setVariable["persistent",true,true];
    _o setDamage (_obj select 4);
    if ((count (_obj select 6)) > 1) then {
        missionNamespace setVariable[(_obj select 6), _o];
    };
    [_o,(_obj select 7)] call UO_FW_AI_fnc_setPersistent;
    _o spawn (_obj select 8);
    if !(_initmode) then {
        sleep 0.25;
    };
} forEach _objs;
{
    private _grpSet = _x select 1;
    if (((_grpSet select 15) > 0) && {!(_grpSet select 16)}) then {
        if (_initmode) then {
            [_x,true] call UO_FW_AI_fnc_createOccupyGroup;
        } else {
            [_x,false] spawn UO_FW_AI_fnc_createOccupyGroup;
        };
    } else {
        if (_initmode) then {
            [_x,true] call UO_FW_AI_fnc_createGroup;
        } else {
            [_x,false] spawn UO_FW_AI_fnc_createGroup;
        };
    };
    if !(_initmode) then {
        sleep 0.25;
    };
} forEach _grps;
if (_initmode) then {
    [_zone] call _code;
    ([_zone,["UO_FW_AI_TaskModule"]] call UO_FW_AI_fnc_getSyncedModules) call UO_FW_AI_fnc_taskActivate;
} else {
    [_zone] spawn _code;
    ([_zone,["UO_FW_AI_TaskModule"]] call UO_FW_AI_fnc_getSyncedModules) spawn UO_FW_AI_fnc_taskActivate;
};
true
