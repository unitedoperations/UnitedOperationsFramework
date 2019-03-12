/*    Description: Set group variables on GROUP.
 *     Arguments:
        SIDE    - 0 - Side,
        ARRAY    - 1 - Position,
        STRING    - 2 - Behavior,
        STRING    - 3 - CombatMode,
        STRING    - 4 - Speed,
        STRING    - 5 - Formation,
        STRING    - 6 - GroupStance,
        STRING    - 7 - GroupInit,
        NUMBER     - 8 - CreateRadius,
        NUMBER     - 9 - TaskRadius,
        NUMBER     - 10 - WayppointWait,
        BOOL    - 11 - StartBuilding,
        NUMBER     - 12 - Task,
        NUMBER     - 13 - TaskTimer,
        NUMBER     - 14 - Multiplier,
        NUMBER     - 15 - OccupyOption
        BOOL    - 16 - VehAssigned
        ARRAY    - 17 - Waypoints
        BOOL    - 18 - OnWater
        ARRAY    - 19 - Task Modules
        BOOL    - 20 - UO_FW_AI_forceLights
        BOOL    - 21 - UO_FW_AI_surrender
        BOOL    - 22 - UO_FW_AI_Tracker

 *     Return Value:
 *         BOOL     - True
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params ["_grp","_gpos",["_grpSet",[],[[]]]];
_grpSet params [
    /*0*/    "_side",
    /*1*/    "_pos",
    /*2*/    "_behave",
    /*3*/    "_combat",
    /*4*/    "_speed",
    /*5*/    "_formation",
    /*6*/    "_grpStance",
    /*7*/    "_grpInit",
    /*8*/    "_createRadius",
    /*9*/    "_taskRadius",
    /*10*/    "_wait",
    /*11*/    "_startBld",
    /*12*/    "_task",
    /*13*/    "_taskTimer",
    /*14*/    "_multi",
    /*15*/    "_occupyOption",
    /*16*/    "_vehAssigned",
    /*17*/    "_waypoints",
    /*18*/    "_onWater",
    /*19*/    "_tasks",
    /*20*/    "_fl",
    /*21*/    "_surrender",
    /*22*/    "_tracker"
    ];
_grp setVariable ['UO_FW_AI_GroupPos',_gpos];
_grp setVariable ['UO_FW_AI_behaviour',_behave];
_grp setVariable ['UO_FW_AI_combatMode',_combat];
_grp setVariable ['UO_FW_AI_speed',_speed];
_grp setVariable ['UO_FW_AI_formation',_formation];
_grp setVariable ['UO_FW_AI_patrolRadius',_taskRadius];
_grp setVariable ['UO_FW_AI_waypointWait',_wait];
_grp setVariable ['UO_FW_AI_task',_task];
_grp setVariable ['UO_FW_AI_TaskTimer',_taskTimer];
_grp setVariable ['UO_FW_AI_occupyOption',_occupyOption];
_grp setVariable ['UO_FW_AI_Waypoints',_waypoints];
_grp setVariable ['UO_FW_AI_tasks',_tasks];
_grp setVariable ['UO_FW_AI_forceLights',_fl];
_grp setVariable ['UO_FW_AI_surrender',_surrender];
_grp setVariable ['UO_FW_AI_Tracker',_tracker];
//_grp call CBA_fnc_clearWaypoints;
[_grp,_behave,_combat,_speed,_formation] call EFUNC(AI,setGroupBehaviour);
{
    _x setUnitPos _grpStance;
    if (!isNull(assignedVehicle _x)) then {[_x] orderGetIn true;};
} forEach (units _grp);
if (_fl) then {[_grp] call EFUNC(AI,setFlashlights);};
if (_surrender) then {[_grp] call EFUNC(AI,setSurrender);};
_grp spawn _grpinit;
true
