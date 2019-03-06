/*    Description: Unit Patrols Building, nearest building if no building given.
 *     Arguments:
 *        OBJECT     - Unit
 *    Optional:
 *        NUMBER     - Wait time at building position
 *        OBJECT     - Building
 *        ARRAY     - Building Positions
 *        NUMBER    - Waypoint Wait Time
 *        ARRAY    - Unit Behaviours
 *        ARRAY    - Group Secondary Task If Occupy Building Ends [TASKID,POSITION]
 *     Return Value:
 *         BOOL    - True
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);



params ["_unit",["_bld",objNull,[objNull]],["_bldPos",[],[[]]],["_wpWait",5,[0]],["_uSet",[],[[]]],["_sec",[],[[]]],["_error",false,[false]],["_m",0,[0]],"_i"];
_uSet params [["_behave","safe",[""]],["_combat","red",[""]],["_speed","limited",[""]],["_formation","wedge",[""]]];
if (isNull _bld || _bldPos isEqualto []) then {
    if (isNull _bld) then {
        _bld = [(getposATL _unit),100,false] call EFUNC(AI,getNearestBuilding);
    };
    _bldPos = _bld buildingPos -1;
};
if (isNull _bld) then {_error = true};
_unit enableAI "Path";
_unit forcespeed -1;
_unit setBehaviour _behave;
_unit setCombatMode _combat;
_unit setSpeedMode _speed;
_unit setFormation _formation;
_unit setvariable["UO_FW_AI_OccupiedBuilding",_bld];
while {alive _unit && !_error && (_unit getvariable["UO_FW_AI_Occupy",true]) && (_unit getvariable["UO_FW_AI_OccupiedBuilding",objNull]) isEqualTo _bld} do {
    private _pos = _bldPos select (floor (random (count _bldPos)));
    private _timer = 60;
    _unit doMove _pos;
    sleep 5;
    while {alive _unit && _timer > 0 && ((getPosATL _unit) distance _pos) > 2 && (_unit getvariable["UO_FW_AI_Occupy",true]) && (_unit getvariable["UO_FW_AI_OccupiedBuilding",objNull]) isEqualTo _bld} do {

        _timer = _timer - 1;
    };
    if (_unit getvariable["UO_FW_AI_Occupy",true] && (_unit getvariable["UO_FW_AI_OccupiedBuilding",objNull]) isEqualTo _bld) then {
        doStop _unit;
        private _wait = floor random [(_wpWait*0.5), _wpWait, (_wpWait*1.2)];
        sleep _wait;
    };
};
(group _unit) setvariable ["InitialWPSet",true];
(group _unit) setVariable ["UO_FW_AI_Mission","BLD PATROL"];
true
