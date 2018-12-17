/*	Description: Set a group to surrender when they take casualties.
 * 	Arguments:
 *		GROUP	- Group to Surrender
 * 	Return Value:
 * 		BOOL 	- True
 *	Author
 *		suits & PiZZADOX
 */
#include "\x\UO_FW\addons\main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC)
params [["_grp",grpNull,[grpNull]],["_target",objNull,[objNull]]]; 
diag_log format["RETURN tracker | %1",_this];
diag_log format["RETURN group alive | %1",count ((units _grp) select {alive _x}) > 0]; 
	if( count ((units _grp) select {alive _x}) > 0) then {
		sleep (_grp getVariable ['aeWaypointWait',10]);
		private _leader = leader _grp;
		private _playerDistances = allPlayers apply { [_x distance _leader, _x]};
		_playerDistances sort true;
	diag_log format["RETURN _playerDistances | %1",_playerDistances];
		if(count _playerDistances >= 0) then { 
			_target = _playerDistances select 0 select 1;
			_grp setVariable["aeSavedWaypoints",([waypoints _leader] call UO_FW_AI_fnc_getWaypointDetails)];
	diag_log format["RETURN distance target | %1",_target distanceSqr _leader];
			if(_target distance _leader < 600) exitWith {
				[_grp] call CBA_fnc_clearWaypoints;
				[_grp,getPos _target,0,0,"AWARE","RED","FULL","WEDGE","MOVE","[group this] spawn UO_FW_AI_fnc_setTracker;",5] call UO_FW_AI_fnc_createWaypoint; 
				diag_log format["RETURN newWaypoints | %1",([waypoints _leader] call UO_FW_AI_fnc_getWaypointDetails)];
			};
		};
		[_grp] call CBA_fnc_clearWaypoints;
		/*if(count (_grp getVariable ['aeSavedWaypoints',[]]) > 2) then {				
			[_grp,(_grp getVariable ['aeSavedWaypoints',[]])] call UO_FW_AI_fnc_createWaypoints;
		} else {
			if(count (_grp getVariable ['aeTasks',[]]) > 0 && (_grp getVariable ['aeTaskTimer',0]) isEqualTo 0) then {
				[_grp,(_grp getVariable ['aeTasks',[]])] call UO_FW_AI_fnc_taskInit;
			} else {
				_grp setVariable["aeCurrentTaskEndTime",(time + (_grp getVariable ['aeTaskTimer',0]))];
				[(_grp getVariable ['aeTask',0]),_grp,(_grp getVariable ['aeGroupPos',getPos _leader]),(_grp getVariable ['aePatrolRadius',100]),(_grp getVariable ['aeWaypointWait',3]),(_grp getVariable ['aeBehaviour',"AWARE"]),(_grp getVariable ['aeCombatMode',"RED"]),(_grp getVariable ['aeSpeed',"FULL"]),(_grp getVariable ['aeFormation',"WEDGE"]),(_grp getVariable ['aeOccupyOption',0])] call UO_FW_AI_fnc_taskAssign;
			};
		};*/
		[_grp,getPos _grp,100,3,"SAFE","RED","NORMAL","WEDGE","MOVE","[group this] spawn UO_FW_AI_fnc_setTracker;",5,2] spawn UO_FW_AI_fnc_taskPatrol;
	};
	true