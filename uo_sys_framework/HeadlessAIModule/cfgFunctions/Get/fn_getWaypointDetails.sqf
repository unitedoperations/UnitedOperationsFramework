params [["_entityWaypoints",[],[[]]],["_waypointDetails",[],[[]]]];                
    for [{_w=0}, {(_w < count _entityWaypoints)}, {_w = _w + 1}] do {                         
        _waypointID = _entityWaypoints select _w;
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
    };
    _waypointDetails