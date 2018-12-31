/* ----------------------------------------------------------------------------
Function: CBA_fnc_searchNearby

Description:
    A function for a group to search a nearby building.

Parameters:
    - Group (Group or Object)

Example:
    (begin example)
    [group player] call CBA_fnc_searchNearby
    (end)

Returns:
    Nil

Author:
    Rommel, SilentSpike and PiZZADOX

Modified:
	suits (removed _group setBehaviour "Combat"; under Prepare group to search)
---------------------------------------------------------------------------- */

#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC)

params ["_group"];

private _buildings = nearestObjects [_leader, ["House", "Building"], 50, true];
if (_buildings isEqualto []) exitWith {};
private _screenedBuildings = _buildings select {(count ([_x] call BIS_fnc_buildingPositions)) >= 2};
if (_screenedBuildings isEqualto []) exitWith {};
private _building = selectRandom _screenedBuildings;
if !(local _group) exitWith {};
_group = _group call CBA_fnc_getGroup;
if !(local _group) exitWith {}; // Don't create waypoints on each machine

_otask = _group getvariable ["UO_FW_AI_Mission","NONE"];

[_group,_building,_otask] spawn {
    params ["_group","_building","_otask"];
    private _leader = leader _group;

			{_x forcespeed -1; _x enableAI "PATH";} foreach units _group;
			_group setvariable ["InitialWPSet",true];
			_group setVariable ["UO_FW_AI_Mission","BLD SEARCH"];

	    // Add a waypoint to regroup after the search
	    _group lockWP true;
	    private _wp = _group addWaypoint [getPos _leader, 0, currentWaypoint _group];
	    private _cond = "({unitReady _x || !(alive _x)} count thisList) isEqualto count thisList";
	    private _comp = format ["this setFormation '%1'; this setBehaviour '%2'; deleteWaypoint [group this, currentWaypoint (group this)];",(formation _group),(behaviour _leader)];
	    _wp setWaypointStatements [_cond,_comp];

	    // Prepare group to search
	    _group setFormDir ([_leader, _building] call BIS_fnc_dirTo);

	    // Search while there are still available positions
	    private _positions = ([_building] call BIS_fnc_buildingPositions);
			while {!(_positions isEqualTo [])} do {
				if (count (units _group) <= 2) then {
						private _units = (units _group) - [_leader];
				} else {
						private _units = (units _group);
				};
				if (_units isEqualTo []) exitWith {};
				{
						if (_positions isEqualTo []) exitWith {};
						if (unitReady _x) then {
								private _pos = _positions deleteAt 0;
								_x commandMove _pos;
								sleep 2;
						};
				} forEach _units;
			};

	    //while {!(_positions isEqualTo [])} do {
	    //    // Update units in case of death
	    //    private _units = (units _group) - [_leader];
	    //    // Abort search if the group has no units left
	    //    if (_units isEqualTo []) exitWith {};
	    //    // Send all available units to the next available position
	    //    {
	    //        if (_positions isEqualTo []) exitWith {};
	    //        if (unitReady _x) then {
	    //            private _pos = _positions deleteAt 0;
	    //            _x commandMove _pos;
	    //            sleep 2;
	    //        };
	    //    } forEach _units;
	    //};

	    _group lockWP false;
			_group setVariable ["UO_FW_AI_Mission",_otask];
};
