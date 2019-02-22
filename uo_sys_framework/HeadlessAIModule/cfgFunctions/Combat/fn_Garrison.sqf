params ["_Unit","_Group","",""];

_Group setVariable ["UO_FW_AI_Mission","GARRISON"];
_Group setvariable ["InitialWPSet",true];

private _UnitLeader = _Unit;
private _nBuildingLst = nearestObjects [_UnitLeader, ["House", "Building"], 50];
private _nBuilding = [0,0,0];
private _BuildingPositions = [];
{
    _BuildingPositions = [_x] call BIS_fnc_buildingPositions;
    if ((count _BuildingPositions) > 2) exitWith {_nBuilding = _x;};
    true;
} count _nBuildingLst;


//If the closest building is greate than 50 meters, exit
if ((_nBuilding distance2D _UnitLeader) > 50) exitWith {};

//If the array is not more than 0 - then exit.

//Find the units in the group!
private _GroupUnits = units _Group;
_Unit setVariable ["UO_FW_AI_GARRISONED",true];
_Group setVariable ["UO_FW_AI_GARRISONED",true];
private _WaypointIs = "HOLD";
while {_WaypointIs isEqualTo "HOLD"} do {
    private _index = currentWaypoint _Group;
    private _WaypointIs = waypointType [_Group,_index];
    private _TempA = _BuildingPositions;
    if (count _TempA > 0) then {
        {
            private _Foot = isNull objectParent _x;
            if (_Foot) then {
            private _BuildingLocation = selectRandom _TempA;
            if !(isNil "_BuildingLocation") then {
                _x doMove _BuildingLocation;
                _x setUnitPos "UP";
                [_x,_BuildingLocation] spawn {
                    params ["_unit","_BuildingLocation"];
                    if (isNil "_BuildingLocation") exitWith {};
                    waitUntil {!alive _unit || {_unit distance _BuildingLocation < 1.3}};
                    _unit disableAI "Path";
                };
                private _RMV = _TempA findIf {BuildingLocation isEqualTo _x};
                _TempA deleteAt _RMV;
                };
            };
            true;
        } count _GroupUnits;


    };
    sleep (30 + (random 60));
};
