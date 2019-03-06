/*    Description: Create a unit of a group and apply required settings.
 *     Arguments:
 *         GROUP    - Group Unit will be added to
 *         ARRAY    - Position to create the unit at
 *        ARRAY    - Required Unit Settings
 *        STRING    - Group Stance Setting
 *     Return Value:
 *         OBJECT     - Unit with settings
 *    Author
 *        suits & PiZZADOX
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

params ["_occupy","_grp","_gpos","_startBld","_i","_unitArgs","_taskRadius",["_currentVeh",objNull,[objNull]],["_initmode",false,[false]]];
_unitArgs params ["_uv","_unitClass","_unitPos","_unitVectorDir","_unitVectorUp","_damage","_editorGear","_vehicle","_vr","_vehicleAssigned","_handcuffed","_unitOnWater","_unitIsPersistent","_unitStance","_unitInit","_name","_identity"];
if (_occupy) then {
    _unitPos = _gpos;
} else {
    if (_startBld && {!_vehicleAssigned}) then {
        _unitPos = [_gpos,_taskRadius,_i] call EFUNC(AI,getStartBuilding);
    };
};
private _unit = _grp createUnit [_unitClass,_unitPos,[],0,"NONE"];
[_unit] join _grp;
_unit disableAI "Path";
_unit setPosATL _unitPos;
_unit setVectorDirAndUp [_unitVectorDir,_unitVectorUp];
_unit setDamage _damage;
if (_handcuffed) then {[_unit,_handcuffed] call ACE_captives_fnc_setHandcuffed;};
if !(_name isEqualTo "") then {
    missionNamespace setVariable[_name, _unit];
};
_unit setVariable["UO_FW_AI_unitIdentity",_identity,true];
[_unit,_unitIsPersistent] call EFUNC(AI,setPersistent);
if (_initmode) then {
    _unit call _unitInit;
} else {
    _unit spawn _unitInit;
};
if (isNil "UO_FW_AI_ActiveList") then {
    UO_FW_AI_ActiveList = [_unit];
} else {
    UO_FW_AI_ActiveList append [_unit];
};
_unit setUnitPos _unitStance;
[_unit, "Hit", {
    _this call EFUNC(AI,onAIHit);
}] call CBA_fnc_addBISEventHandler;
if (_vehicleAssigned && {!isNull _currentVeh}) then {
    [_unit,_vr,_currentVeh] call EFUNC(AI,setAssignedVehicle);
};

if (UO_FW_MACR_MAP_ALL) then {
    _unit unlinkItem "ItemMap";
} else {
    if (_unit getVariable ["UO_FW_RemoveMap",false]) then {
        _unit unlinkItem "ItemMap";
    };
};
if (UO_FW_MACR_COMPASS_ALL) then {
    _unit unlinkItem "ItemCompass";
} else {
    if (_unit getVariable ["UO_FW_RemoveCompass",false]) then {
        _unit unlinkItem "ItemCompass";
    };
};

_unit
