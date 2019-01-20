/*    Description: Set a group to surrender when they take casualties.
 *     Arguments:
 *        GROUP    - Group to Surrender
 *     Return Value:
 *         BOOL     - True
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params [["_grp",grpNull,[grpNull]],["_target",objNull,[objNull]]];
diag_log format["RETURN tracker | %1",_this];
diag_log format["RETURN group alive | %1",count ((units _grp) select {alive _x}) > 0];
    if ( count ((units _grp) select {alive _x}) > 0) then {
        sleep (_grp getVariable ['UO_FW_AI_waypointWait',10]);
        private _leader = leader _grp;
        private _playerDistances = allPlayers apply { [_x distance _leader, _x]};
        _playerDistances sort true;
        diag_log format["RETURN _playerDistances | %1",_playerDistances];
        if (count _playerDistances >= 0) then {
            _target = _playerDistances select 0 select 1;
            _grp setVariable["UO_FW_AI_SavedWaypoints",([waypoints _leader] call UO_FW_AI_fnc_getWaypointDetails)];
            diag_log format["RETURN distance target | %1",_target distanceSqr _leader];
            if (_target distance _leader < 600) exitWith {
                [_grp] call CBA_fnc_clearWaypoints;
                [_grp,getPos _target,0,0,"AWARE","RED","FULL","WEDGE","MOVE","[group this] spawn UO_FW_AI_fnc_setTracker;",5] call UO_FW_AI_fnc_createWaypoint;
                diag_log format["RETURN newWaypoints | %1",([waypoints _leader] call UO_FW_AI_fnc_getWaypointDetails)];
            };
        };
        [_grp] call CBA_fnc_clearWaypoints;
        /*if (count (_grp getVariable ['UO_FW_AI_SavedWaypoints',[]]) > 2) then {
            [_grp,(_grp getVariable ['UO_FW_AI_SavedWaypoints',[]])] call UO_FW_AI_fnc_createWaypoints;
        } else {
            if (count (_grp getVariable ['UO_FW_AI_tasks',[]]) > 0 && (_grp getVariable ['UO_FW_AI_TaskTimer',0]) isEqualTo 0) then {
                [_grp,(_grp getVariable ['UO_FW_AI_tasks',[]])] call UO_FW_AI_fnc_taskInit;
            } else {
                _grp setVariable["UO_FW_AI_CurrentTaskEndTime",(time + (_grp getVariable ['UO_FW_AI_TaskTimer',0]))];
                [(_grp getVariable ['UO_FW_AI_task',0]),_grp,(_grp getVariable ['UO_FW_AI_GroupPos',getPos _leader]),(_grp getVariable ['UO_FW_AI_patrolRadius',100]),(_grp getVariable ['UO_FW_AI_waypointWait',3]),(_grp getVariable ['UO_FW_AI_behaviour',"AWARE"]),(_grp getVariable ['UO_FW_AI_combatMode',"RED"]),(_grp getVariable ['UO_FW_AI_speed',"FULL"]),(_grp getVariable ['UO_FW_AI_formation',"WEDGE"]),(_grp getVariable ['UO_FW_AI_occupyOption',0])] call UO_FW_AI_fnc_taskAssign;
            };
        };*/
        [_grp,getPos _grp,100,3,"SAFE","RED","NORMAL","WEDGE","MOVE","[group this] spawn UO_FW_AI_fnc_setTracker;",5,2] spawn UO_FW_AI_fnc_taskPatrol;
    };
    true
