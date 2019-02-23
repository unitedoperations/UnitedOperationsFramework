#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);
UO_FW_3DEN_CHECK;

params ["_object"];
LOG_1("_object: %1",_object);
LOG_1("_object UnitSystemType: %1",((_object get3DENAttribute "UO_FW_Gear_UnitSystemType") select 0));
LOG_1("_object UnitGearType: %1",((_object get3DENAttribute "UO_FW_Gear_UnitGearType") select 0));

if (_object isKindOf "CAManBase") then {
    if (!((_object get3DENAttribute "UO_FW_Gear_UnitSystemType") isEqualto []) && {!((_object get3DENAttribute "UO_FW_Gear_UnitGearType") isEqualto [])}) then {
        [_object] call UO_FW_fnc_GearTypeLoadFromAttribute;
    };
} else {
    if (!((_object get3DENAttribute "UO_FW_Gear_VehicleSystemType") isEqualto []) && {!((_object get3DENAttribute "UO_FW_Gear_VehicleGearManualType") isEqualto [])}) then {
        [_object] call UO_FW_fnc_GearTypeLoadFromAttribute;
    };
};
