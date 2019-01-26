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
_unitArgs params ["_uv","_unitClass","_unitPos","_unitVectorDir","_unitVectorUp","_damage","_editorGear","_vehicle","_vr","_vehicleAssigned","_handcuffed","_unitOnWater","_unitIsPersistent","_unitStance","_unitGearSystem","_unitGearType","_unitInit","_name","_identity"];
if (_occupy) then {
    _unitPos = _gpos;
} else {
    if (_startBld && {!_vehicleAssigned}) then {
        _unitPos = [_gpos,_taskRadius,_i] call UO_FW_AI_fnc_getStartBuilding;
    };
};
private _unit = _grp createUnit [_unitClass,_unitPos,[],0,"NONE"];
[_unit] join _grp;
_unit disableAI "Path";
_unit setPosATL _unitPos;
_unit setVectorDirAndUp [_unitVectorDir,_unitVectorUp];
//set unit gear based on either gear system or editor arsenal gear
switch (_unitGearSystem) do {
    case "ACEAR": {
        private _found = false;
        private _defaultloadoutsArray = missionNamespace getvariable ['ace_arsenal_defaultLoadoutsList',[]];
        {
            _x params ["_name","_loadoutData"];
            if (_unitGearType isEqualto _name) exitwith {
                _unit setUnitLoadout _loadoutData;
                LOG_2("Setting ace loadout: %1 for unit %2",_unitGearType,_unit);
                _found = true;
            };
        } foreach _defaultloadoutsArray;
        if !(_found) exitwith {
            ERROR_1("Could not find %1 in Default Loadouts!",_unitGearType);
        };
    };
    case "OLSEN": {
        LOG_2("Executing gear of file: %1 for unit %2",_unitGearType,_unit);
        [_unit,_unitGearType] call UO_FW_fnc_OlsenGearScript;
    };
    default {
        _unit setUnitLoadout _editorGear;
    };
};
_unit setDamage _damage;
if (_handcuffed) then {[_unit,_handcuffed] call ACE_captives_fnc_setHandcuffed;};
if !(_name isEqualTo "") then {
    missionNamespace setVariable[_name, _unit];
};
_unit setVariable["UO_FW_AI_unitIdentity",_identity,true];
[_unit,_unitIsPersistent] call UO_FW_AI_fnc_setPersistent;
if (_initmode) then {
    _unit call _unitInit;
} else {
    _unit spawn _unitInit;
};
if (isNil "UO_FW_AI_ActiveList") then {
    UO_FW_AI_ActiveList = [_unit];
} else {
    UO_FW_AI_ActiveList append _unit;
};
_unit setUnitPos _unitStance;
[_unit, "Hit", {
    _this call UO_FW_AI_fnc_onAIHit;
}] call CBA_fnc_addBISEventHandler;
if (_vehicleAssigned && {!isNull _currentVeh}) then {
    [_unit,_vr,_currentVeh] call UO_FW_AI_fnc_setAssignedVehicle;
};
["UO_FW_ShotCount_EH_Event", _unit] call CBA_fnc_serverEvent;
["UO_FW_Track_Event", _unit] call CBA_fnc_serverEvent;

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
