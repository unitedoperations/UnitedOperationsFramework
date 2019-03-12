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
LOG_1("RETURN tracker | %1",_this);
LOG_1("RETURN group alive | %1",count ((units _grp) select {alive _x}) > 0);
if (count ((units _grp) select {alive _x}) > 0) then {
    sleep (_grp getVariable ['UO_FW_AI_waypointWait',10]);
    private _leader = leader _grp;
    private _playerDistances = allPlayers apply { [_x distance _leader, _x]};
    _playerDistances sort true;
    LOG_1("RETURN _playerDistances | %1",_playerDistances);
    if !(_playerDistances isEqualto []) then {
        _target = _playerDistances select 0 select 1;
        _grp setVariable["UO_FW_AI_SavedWaypoints",([waypoints _leader] call EFUNC(AI,getWaypointDetails))];
        LOG_1("RETURN distance target | %1",_target distanceSqr _leader);
        if (_target distance _leader < 600) exitWith {
            [_grp] call CBA_fnc_clearWaypoints;
            [_grp,getPos _target,0,0,"AWARE","RED","FULL","WEDGE","MOVE","[group this] spawn UO_FW_AI_fnc_setTracker;",5] call EFUNC(AI,createWaypoint);
            LOG_1("RETURN newWaypoints | %1",([waypoints _leader] call EFUNC(AI,getWaypointDetails)));
        };
    };
    [_grp] call CBA_fnc_clearWaypoints;
    [_grp,getPos _grp,100,3,"SAFE","RED","NORMAL","WEDGE","MOVE","[group this] spawn UO_FW_AI_fnc_setTracker;",5,2] spawn UO_FW_AI_fnc_taskPatrol;
};
true
