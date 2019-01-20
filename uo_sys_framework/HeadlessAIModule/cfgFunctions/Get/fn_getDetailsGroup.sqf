/*    Description: Returns an array of details for an occupied vehicle.
 *    Arguments:
 *         OBJECT    - Object Name
 *    Return Value:
 *         ARRAY
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
    params ["_u","_pos","_veh"];
    private _grp = (group _u);
    private _grpInit = _grp getVariable ["UO_FW_AI_groupInit","true"];
    private _occupy = _grp getVariable ['UO_FW_AI_occupyOption',0];
    if (_occupy isEqualTo 1) then {_occupy = floor(random [2,5,7])};
    if (typename _grpInit isEqualTo "STRING") then {_grpInit = compile _grpInit;};
    private _vehAssigned = if ((assignedVehicleRole _u) isEqualTo [])then{false}else{true};
    _return = [
        side _u,
        _pos,
        _grp getVariable ['UO_FW_AI_behaviour','safe'],
        _grp getVariable ['UO_FW_AI_combatMode','red'],
        _grp getVariable ['UO_FW_AI_speed','limited'],
        _grp getVariable ['UO_FW_AI_formation','wedge'],
        _grp getVariable ['UO_FW_AI_groupStance','auto'],
        _grpInit,
        _grp getVariable ['UO_FW_AI_createRadius',0],
        _grp getVariable ['UO_FW_AI_patrolRadius',30],
        _grp getVariable ['UO_FW_AI_waypointWait',3],
        _grp getVariable ['UO_FW_AI_startBuilding',false],
        _grp getVariable ['UO_FW_AI_task',4],
        _grp getVariable ['UO_FW_AI_TaskTimer',0],
        _grp getVariable ['UO_FW_AI_multiplier',1],
        _occupy,
        _vehAssigned,
        ([(waypoints _u)] call UO_FW_AI_fnc_getWaypointDetails),
        (surfaceIsWater (getposATL _u)),
        ([_grp,["UO_FW_AI_TaskModule"]] call UO_FW_AI_fnc_getTasks),
        _grp getVariable ['UO_FW_AI_forceLights',false],
        _grp getVariable ['UO_FW_AI_surrender',false],
        _grp getVariable ['UO_FW_AI_Tracker',false]
    ];
    _return
