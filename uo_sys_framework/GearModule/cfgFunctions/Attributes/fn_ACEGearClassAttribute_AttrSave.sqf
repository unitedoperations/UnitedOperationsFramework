#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_3DEN_CHECK;

LOG("ACEGearClassAttributeSave started");

private _control = (_this controlsGroupCtrl 100);
private _config = MGETVAR(_control,parentcontrolcfg,"");
private _attProperty = getText (_config >> "property");
private _value = (_control lbData lbCurSel _control);
MSETMVAR(_attProperty,_value);
_value
