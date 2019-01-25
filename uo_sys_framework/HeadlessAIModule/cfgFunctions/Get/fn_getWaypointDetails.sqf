params [["_entityWaypoints",[],[[]]],["_waypointDetails",[],[[]]]];
{
    private _waypointID = _x;
    _waypointDetails pushBack [
        _waypointID,
        waypointName _waypointID,
        waypointPosition _waypointID,
        waypointType _waypointID,
        waypointBehaviour _waypointID,
        waypointCombatMode _waypointID,
        waypointSpeed _waypointID,
        waypointFormation _waypointID,
        waypointTimeout _waypointID,
        waypointCompletionRadius _waypointID,
        waypointAttachedObject _waypointID,
        waypointAttachedVehicle _waypointID,
        waypointHousePosition _waypointID,
        waypointLoiterRadius _waypointID,
        waypointScript _waypointID,
        waypointStatements _waypointID
    ];
} foreach _entityWaypoints;
_waypointDetails
