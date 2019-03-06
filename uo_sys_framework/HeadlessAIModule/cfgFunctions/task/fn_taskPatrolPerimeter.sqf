/*    Description: Task a group to patrol a box around their patrol position.
*     Arguments:
*         GROUP    - Group
*     Optional:
*         ARRAY    - Task Position
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
    ["_behave","SAFE",[""]],
    ["_combat","RED",[""]],
    ["_speed","LIMITED",[""]],
    ["_formation","WEDGE",[""]],
    ["_Type","MOVE",[""]],
    ["_oncomplete","this call EFUNC(AI,taskSearchNearby)",[""]],
    ["_compradius",0,[0]],
    ["_wpcount",10,[0]],
    "_i"
];

{_x forcespeed -1; _x enableAI "Path";} foreach units _grp;
_grp call CBA_fnc_clearWaypoints;
_pos = [_pos,_grp] select (_pos isEqualTo []);
_pos = _pos call CBA_fnc_getPos;
_forwards = (vectorDir (leader _grp)) vectorMultiply _radius;
_sideways = [_forwards select 1, -(_forwards select 0), 0];
_poswp1 = _pos vectorAdd _sideways;
_poswp2 = _poswp1 vectorAdd _forwards;
_poswp4 = _pos vectorAdd (_sideways vectormultiply -1);
_poswp3 = _poswp4 vectorAdd _forwards;
{
    _this1 =+ _this;
    _this1 set [1,_x];
    _this1 set [2,0];
    _this1 call EFUNC(AI,createWaypoint);
} foreach [_poswp1,_poswp2,_poswp3,_poswp4];
_this2 =+ _this;
_this2 set [1,_poswp1];
_this2 set [2,0];
_this2 set [8, "CYCLE"];
_this2 call EFUNC(AI,createWaypoint);
deleteWaypoint ((waypoints _grp) select 0);
_grp setvariable ["InitialWPSet",true];
_grp setVariable ["UO_FW_AI_Mission","PATROLLING PERIMETER"];
true
