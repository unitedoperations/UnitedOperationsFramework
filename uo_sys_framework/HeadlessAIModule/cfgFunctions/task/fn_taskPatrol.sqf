/*    Description: Task a group to patrol randomly in their patrol radius.
 *     Arguments:
 *         GROUP    - Group
 *         ARRAY    - Task Position
 *     Optional:
 *         NUMBER    - Task Radius
 *         NUMBER    - Wait Time at Waypoints
 *         STRING    - Behaviour
 *         STRING    - CombatMode
 *         STRING    - Speed
 *         STRING    - Formation
 *         STRING    - Waypoint Type
 *         STRING    - On Waypoint Complete Statement
 *         NUMBER    - Waypoint Complete Radius
 *        NUMBER    - Required Waypoint Amount
 *     Return Value:
 *         BOOL     - True
 *    Author:
 *        Rommel
 *    Modified
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);


params [
    "_grp",
    "_pos",
    ["_radius",30,[0]],
    ["_wait",3,[0]],
    ["_behaviour", "UNCHANGED", [""]],
      ["_combat", "NO CHANGE", [""]],
      ["_speed", "UNCHANGED", [""]],
    ["_formation", "NO CHANGE", [""]],
    ["_Type","MOVE",[""]],
    ["_oncomplete","this call EFUNC(AI,taskSearchNearby)",[""]],
    ["_compradius",0,[0]],
    ["_wpcount",10,[0]]
];

if (_radius < 30) then {
    ERROR_1("taskPatrol _grp: %1 radius too small! Setting to default 30m",_grp);
    _radius = 30;
};

LOG_1("taskPatrol started _this: %1",_this);
_grp = _grp call CBA_fnc_getGroup;
if !(local _grp) exitWith {}; // Don't create waypoints on each machine
{_x forcespeed -1; _x enableAI "Path";} foreach (units _grp);

//_grp call CBA_fnc_clearWaypoints;
//CBA backup
private _timeout = [(_wait*0.5),_wait,(_wait*1.5)];
//[_grp, _pos] call CBA_fnc_taskPatrol;
//[_grp, _pos, _radius, _wpcount, _Type, _behaviour, _combat, _speed, _formation, _oncomplete, _timeout] call CBA_fnc_taskPatrol;

//_pos = [_pos,_grp] select (_pos isEqualTo []);
//_pos = _pos call CBA_fnc_getPos;
//for [{_i=0},{(_i < _wpcount)},{_i = _i + 1}] do {
//    _wp = _this call EFUNC(AI,createWaypoint);
//};
//_this2 =+ _this;
//_this2 set [(count _this2), "CYCLE"];
//_this2 call EFUNC(AI,createWaypoint);
//deleteWaypoint ((waypoints _grp) select 0);

_pos = [_pos, _grp] select (_pos isEqualTo []);
_pos = _pos call CBA_fnc_getPos;

// Clear existing waypoints first
[_grp] call CBA_fnc_clearWaypoints;

// Using angles create better patrol patterns
// Also fixes weird editor bug where all WP are on same position
private _step = 360 / _wpcount;
private _offset = random _step;
for "_i" from 1 to _wpcount do {
    // Gaussian distribution avoids all waypoints ending up in the center
    private _rad = _radius * random [0.1, 0.75, 1];

    // Alternate sides of circle & modulate offset
    private _theta = (_i % 2) * 180 + sin (deg (_step * _i)) * _offset + _step * _i;

    private _wppos = _pos getPos [_rad, _theta];
    [_grp,_wppos,_radius,_Type,_behaviour, _combat, _speed, _formation, _oncomplete, _timeout] call CBA_fnc_addWaypoint;
};

// Close the patrol loop
[_grp,_pos,_radius,"CYCLE",_behaviour, _combat, _speed, _formation, _oncomplete, _timeout] call CBA_fnc_addWaypoint;

_grp setvariable ["InitialWPSet",true];
_grp setVariable ["UO_FW_AI_Mission","PATROLLING"];
true
