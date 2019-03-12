#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EDEN_CHECK;

LOG("GearComboLoadAttribute_onMouseClick started");

private _ctrlButton = _this select 0;
private _ctrlGroup = ctrlParentControlsGroup _ctrlButton;
private _ctrlCombo = _ctrlGroup controlsgroupctrl 100;
private _value = _ctrlCombo lbData _cursel;
private _unit = ((get3denselected "object") select 0);
private _GearSystem = _unit getvariable ["UO_FW_Gear_UnitGearType","NONE"];
private _UnitClass = _unit getvariable ["UO_FW_Gear_UnitSystemType","NONE"];
if (!(_GearSystem isEqualto "NONE") || !(_UnitClass isEqualto "NONE")) then {
    [_unit,_GearSystem,_UnitClass] call FUNC(GearTypeLoad3DEN);
};
