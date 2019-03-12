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
params ["_unit",["_pos",[],[[]]]];
private _group = (group _unit);
private _groupInit = _group getVariable ["UO_FW_AI_groupInit",""];
private _occupy = _group getVariable ['UO_FW_AI_occupyOption',0];
if (_occupy isEqualTo 1) then {_occupy = floor(random [2,5,7])};
if (typename _groupInit isEqualTo "STRING") then {_groupInit = compile _groupInit;};
private _vehAssigned = if ((assignedVehicleRole _unit) isEqualTo []) then {false} else {true};
[side _unit,
_pos,
_group getVariable ['UO_FW_AI_behaviour','safe'],
_group getVariable ['UO_FW_AI_combatMode','red'],
_group getVariable ['UO_FW_AI_speed','limited'],
_group getVariable ['UO_FW_AI_formation','wedge'],
_group getVariable ['UO_FW_AI_groupStance','auto'],
_groupInit,
_group getVariable ['UO_FW_AI_createRadius',0],
_group getVariable ['UO_FW_AI_patrolRadius',30],
_group getVariable ['UO_FW_AI_waypointWait',3],
_group getVariable ['UO_FW_AI_startBuilding',false],
_group getVariable ['UO_FW_AI_task',4],
_group getVariable ['UO_FW_AI_TaskTimer',0],
_group getVariable ['UO_FW_AI_multiplier',1],
_occupy,
_vehAssigned,
([(waypoints _unit)] call EFUNC(AI,getWaypointDetails)),
(surfaceIsWater (getposATL _unit)),
([_group,["UO_FW_AI_TaskModule"]] call EFUNC(AI,getTasks)),
_group getVariable ['UO_FW_AI_forceLights',false],
_group getVariable ['UO_FW_AI_surrender',false],
_group getVariable ['UO_FW_AI_Tracker',false]
]
