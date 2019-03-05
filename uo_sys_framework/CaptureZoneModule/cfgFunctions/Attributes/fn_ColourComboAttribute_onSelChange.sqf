#define COMPONENT CaptureZone
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_3DEN_CHECK;

LOG("CaptueZoneAttribute onSel started");

private _control = _this select 0;
private _cursel = _this select 1;
private _lbValue = _control lbData _cursel;
private _config = MGETVAR(_control,parentcontrolcfg,"");
private _attProperty = getText (_config >> "property");
SETMVAR(_attProperty,_lbValue);
