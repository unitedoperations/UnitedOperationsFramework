/*	Description: Returns an array of details for an occupied vehicle.
 *	Arguments:
 * 		OBJECT	- Object Name
 *	Return Value:
 * 		ARRAY 	
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
	params ["_u","_pos","_veh"];
	private _grp = (group _u);
	private _grpInit = _grp getVariable ["aeGroupInit","true"];
	private _occupy = _grp getVariable ['aeOccupyOption',0];
	if(_occupy isEqualTo 1) then {_occupy = floor(random [2,5,7])};
	if(typename _grpInit isEqualTo "STRING") then {_grpInit = compile _grpInit;};
	private _vehAssigned = if((assignedVehicleRole _u) isEqualTo [])then{false}else{true};
	_return = [
		side _u, 
		_pos, 
		_grp getVariable ['aeBehaviour','safe'],
		_grp getVariable ['aeCombatMode','red'],
		_grp getVariable ['aeSpeed','limited'],
		_grp getVariable ['aeFormation','wedge'],
		_grp getVariable ['aeGroupStance','auto'],
		_grpInit,
		_grp getVariable ['aeCreateRadius',0],
		_grp getVariable ['aePatrolRadius',0],
		_grp getVariable ['aeWaypointWait',3],
		_grp getVariable ['aeStartBuilding',false],
		_grp getVariable ['aeTask',4],
		_grp getVariable ['aeTaskTimer',0],
		_grp getVariable ['aeMultiplier',1],
		_occupy, 
		_vehAssigned, 
		([(waypoints _u)] call UO_AI_fnc_getWaypointDetails),
		(surfaceIsWater (getposATL _u)),
		([_grp,["UO_FW_TaskModule"]] call UO_AI_fnc_getTasks),
		_grp getVariable ['aeHeadless',true],
		_grp getVariable ['aeForceLights',false],
		_grp getVariable ['aeSurrender',false],
		_grp getVariable ['aeTracker',false],
		_grp getVariable ['aeParaEnable',false],
		_grp getVariable ['aeParaHeight',3000],
		_grp getVariable ['aeParaDirection',-1],
		_grp getVariable ['aeParaColMaxLength',100],
		_grp getVariable ['aeParaSpacing',25],
		_grp getVariable ['aeParaSpread',25],
		_grp getVariable ['aeParaSmoke',false],
		_grp getVariable ['aeParaRealism',true]								
	];	
	_return