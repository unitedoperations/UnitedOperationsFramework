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
 *        ARRAY    - Required Waypoint Amount
 *     Return Value:
 *         BOOL     - True
 *    Modified
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);
params[["_blds",[],[[]]],"_grp","_pos",["_radius",0,[0]],["_wait",3,[0]],["_behave","SAFE",[""]],["_combat","RED",[""]],["_speed","LIMITED",[""]],["_formation","WEDGE",[""]],["_Type","MOVE",[""]],["_oncomplete","",[""]],["_compradius",0,[0]],["_bldPos",[],[[]]],["_bpos",[],[[]]],["_bld1",objNull,[objNull]],["_bld2",[],[[]]],["_patrol",false,[false]]];
_grp call CBA_fnc_clearWaypoints;
{_x forcespeed -1; _x enableAI "Path";} foreach units _grp;
private _bpos = _pos;
if (count _blds < 1) then {
    _bld1 = [_pos,_radius] call EFUNC(AI,getRandomBuilding);
    if (!isNull _bld1) then {
        _bpos = getPosATL _bld1;
        _blds pushBack _bld1;
        _bld2 = [_bpos,_radius,3] call EFUNC(AI,getNearestGroupBuildings);
        {_blds pushBack _x;} forEach (_bld2 select {_bld1 != _x});
    };
    if (count _blds < 1) then {
        _bpos = _pos;
        _patrol = true;
    };
};
if (_patrol) then {
    if (_radius < 1) then {_radius = 30;};
    [_grp,_bpos,_radius,_wait,_behave,_combat,_speed,_formation] spawn UO_FW_AI_fnc_taskPatrol;
} else {
    [0,"ARRAY",1,_bpos,_this] call EFUNC(AI,createWaypointModified);
    deleteWaypoint ((waypoints _grp) select 0);
    while {{alive _x} count (units _grp) <= ((count (units _grp)) * 0.5) || (((getPosATL leader _grp) distance _bpos) > 50)} do { sleep 5; };
    {
        _x setvariable["UO_FW_AI_Occupy",true];
        private _uBld = _blds select (_forEachIndex % (count _blds));
        _bldPos = _uBld buildingPos -1;
        [_x,_uBld,_bldPos,_wait,[_behave,_combat,_speed,_formation]] spawn UO_FW_AI_fnc_taskBuildingDefend;
    } forEach (units _grp);
};
if (UO_FW_AI_DEBUG) then {
    if (_patrol) then {
        [_grp,_bpos,"BLD ERROR PATROL","ColorOPFOR"] call EFUNC(AI,debugCreateMarker);
    } else {
        {
            [_grp,(getPosATL _x),format["gBldD%1",_forEachIndex]] call EFUNC(AI,debugCreateMarker);
        } forEach _blds;
    };
};
_grp setvariable ["InitialWPSet",true];
true
