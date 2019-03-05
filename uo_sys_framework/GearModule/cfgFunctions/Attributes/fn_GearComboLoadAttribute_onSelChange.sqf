#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_3DEN_CHECK;

LOG("GearComboLoadAttribute_onSelChange started");

private _control = _this select 0;
private _cursel = _this select 1;
private _value = _control lbData _cursel;
private _unit = ((get3denselected "object") select 0);
SETVAR(_unit,UnitGearType,_value);
