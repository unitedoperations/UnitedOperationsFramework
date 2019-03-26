#define COMPONENT Respawn
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EDEN_CHECK;

LOG_1("_this: %1",_this);
params ["_args","_config","_configVar","_valueVar"];
_args params ["_ctrl"];

private _ctrlCombo = (_ctrl controlsGroupCtrl 100);
private _value = (_ctrlCombo lbValue lbCurSel _ctrlCombo);
missionNamespace setvariable [_configVar,_value];
missionNamespace setvariable [_valueVar,_config];
_value
