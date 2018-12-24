/*	Description: Returns an array of details for an occupied vehicle.
 *	Arguments:
 * 		OBJECT	- Object Name
 *	Return Value:
 * 		ARRAY
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC)
	params ["_u","_pos","_veh"];
	private _grp = (group _u);
	private _grpInit = _grp getVariable ["UO_FW_groupInit","true"];
	private _occupy = _grp getVariable ['UO_FW_occupyOption',0];
	if(_occupy isEqualTo 1) then {_occupy = floor(random [2,5,7])};
	if(typename _grpInit isEqualTo "STRING") then {_grpInit = compile _grpInit;};
	private _vehAssigned = if((assignedVehicleRole _u) isEqualTo [])then{false}else{true};
	_return = [
		side _u,
		_pos,
		_grp getVariable ['UO_FW_behaviour','safe'],
		_grp getVariable ['UO_FW_combatMode','red'],
		_grp getVariable ['UO_FW_speed','limited'],
		_grp getVariable ['UO_FW_formation','wedge'],
		_grp getVariable ['UO_FW_groupStance','auto'],
		_grpInit,
		_grp getVariable ['UO_FW_createRadius',0],
		_grp getVariable ['UO_FW_patrolRadius',0],
		_grp getVariable ['UO_FW_waypointWait',3],
		_grp getVariable ['UO_FW_startBuilding',false],
		_grp getVariable ['UO_FW_task',4],
		_grp getVariable ['UO_FW_TaskTimer',0],
		_grp getVariable ['UO_FW_multiplier',1],
		_occupy,
		_vehAssigned,
		([(waypoints _u)] call UO_FW_AI_fnc_getWaypointDetails),
		(surfaceIsWater (getposATL _u)),
		([_grp,["UO_FW_AI_TaskModule"]] call UO_FW_AI_fnc_getTasks),
		_grp getVariable ['UO_FW_forceLights',false],
		_grp getVariable ['UO_FW_surrender',false],
		_grp getVariable ['UO_FW_Tracker',false],
		_grp getVariable ['UO_FW_paraEnable',false],
		_grp getVariable ['UO_FW_paraHeight',3000],
		_grp getVariable ['UO_FW_paraDirection',-1],
		_grp getVariable ['UO_FW_paraColMaxLength',100],
		_grp getVariable ['UO_FW_paraSpacing',25],
		_grp getVariable ['UO_FW_paraSpread',25],
		_grp getVariable ['UO_FW_paraSmoke',false],
		_grp getVariable ['UO_FW_paraRealism',true]
	];
	_return
