#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

params ["_list","_object"];
//[_list,_object] call EFUNC(AI,ClosestObject);
////systemchat format ["%1",_object];
private _position = [0,0,0];
if (isNil "_object") exitWith {};
if (isNil "_list") exitWith {};
if (TypeName _object isEqualTo "OBJECT") then {_position = getPosWorld _object;};
if (TypeName _object isEqualTo "STRING") then {_position = getMarkerPos _object;};
if (TypeName _object isEqualTo "ARRAY") then {_position = _object;};
private _DistanceArray = [];
{
    if !(isNil "_x") then {
        private _CompareObjectPos = [0,0,0];
        if (TypeName _x isEqualTo "OBJECT") then {_CompareObjectPos = getPosWorld _x;};
        if (TypeName _x isEqualTo "STRING") then {_CompareObjectPos = getMarkerPos _x;};
        if (TypeName _x isEqualTo "ARRAY") then {_CompareObjectPos = _x;};
        private _NewObjectDistance = _CompareObjectPos distance _position;
        _DistanceArray pushback [_NewObjectDistance,_x];
    };
} foreach _list;
_DistanceArray sort true;
private _ClosestObject = ((_DistanceArray select 0) select 1);
if (isNil "_ClosestObject") exitWith {};
_ClosestObject
