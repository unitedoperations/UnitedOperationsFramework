#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_3DEN_CHECK;

LOG("GearPresetAttribute_onMouseClick started");

params ["_originalThis","_args"];

private _ctrlButton = _originalThis select 0;
private _ctrlGroup = ctrlParentControlsGroup _ctrlButton;
private _ctrlCombo = _ctrlGroup controlsgroupctrl 100;
private _value = (_ctrlCombo lbData lbCurSel _ctrlCombo);
diag_log format ["GearLoadPreset started, _value: %1",_value];
if !(_value isEqualto "NONE") then {
    [_value,_args,_ctrlButton] call FUNC(GearLoadPreset);
};
