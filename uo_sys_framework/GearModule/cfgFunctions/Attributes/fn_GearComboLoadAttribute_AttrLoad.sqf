#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_3DEN_CHECK;

LOG("GearComboLoadAttribute_AttrLoad started");

private _control = (_this controlsGroupCtrl 100);
MSETVAR(_control,parentcontrolcfg,_config);
private _classArray = getArray(configFile >> "UO_FW_Gear_Types" >> "typesArray");
{
    private _className = _x;
    private _name = localize (QGVAR(DisplayName) + (str _className));
    private _index = (_control lbadd _name);
    _control lbsetdata [_index,_className];
    _control lbsetValue [_index,_foreachIndex];
    if (_value isEqualto _className) then {
        _control lbSetCurSel _index;
        private _unit = ((get3denselected "object") select 0);
        SETVAR(_unit,UnitGearType,_value);
    };
} foreach _classArray;
