#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

//params ["_Unit","_AttachObject","_GRENADETHROWN"];
params ["_Unit","_GRENADETHROWN"];

//private _NearestEnemy = _Unit call EFUNC(AI,ClosestEnemy);
//private _GuessLocation = _Unit getHideFrom _NearestEnemy;

//if (isNull _NearestEnemy) exitWith
if ((random 100) <= UO_FW_AI_GRENADECHANCE) exitWith {
    //Throw grenades and seek for any kind of cover
    [_Unit,_GRENADETHROWN] spawn UO_FW_AI_fnc_ThrowGrenade;
};

//private _coverObjectsClosest = [];
//
//for "_i" from 0 to 20 do
//    {
//        _coverObjectsClosest pushback (_coverObjects call BIS_fnc_selectRandom);
//    };
//
//    private _Closestobject = _coverObjectsClosest call BIS_fnc_selectRandom;
//
//    private _BoundingArray = boundingBoxReal _Closestobject;
//    private _p1 = _BoundingArray select 0;
//    private _p2 = _BoundingArray select 1;
//    private _maxWidth = abs ((_p2 select 0) - (_p1 select 0));
//
//    _coverObjectspos = [_GuessLocation, (_Closestobject distance _NearestEnemy) + 2, ([_GuessLocation, _Closestobject] call BIS_fnc_dirTo)] call BIS_fnc_relPos;
