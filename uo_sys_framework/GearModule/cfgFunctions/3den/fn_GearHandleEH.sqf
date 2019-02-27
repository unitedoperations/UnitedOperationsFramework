#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);
UO_FW_3DEN_CHECK;

params ["_object"];
LOG_1("_object: %1",_object);
LOG_1("_object UnitSystemType: %1",GETVAR(_object,Gear_UnitSystemType,"NONE"));
LOG_1("_object UnitGearType: %1",GETVAR(_object,Gear_UnitGearType,"NONE"));

if (GETVAR(_object,Gear_UnitSystemType,"NONE") isEqualto "NONE") exitwith {};
if (GETVAR(_object,Gear_UnitGearType,"NONE") isEqualto "NONE") exitwith {};

[_object] call UO_FW_fnc_GearTypeLoad3DEN;
