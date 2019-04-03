#define COMPONENT 3DEN
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(ALL);
EDEN_CHECK;

//IGNORE_PRIVATE_WARNING ["_x"];

params ["_ctrl"];

private _control = _ctrl controlsgroupctrl 100;
private _profileArray = profileNamespace getvariable [QEGVAR(Core,ProfileLoadoutSettingsArray),[]];
if (_profileArray isEqualto []) then {
    lbClear _control;
    private _placeholderIndex = _control lbadd 'No Loadout Profiles Saved';
    _control lbsetdata [_placeholderIndex,'No Loadout Profiles Saved'];
    _control lbSetCurSel _placeholderIndex;
} else {
    lbClear _control;
    private _placeholderIndex = _control lbadd 'None';
    _control lbsetdata [_placeholderIndex,'None'];
    {
        _x params ['_name'];
        private _index = _control lbadd _name;
        _control lbsetdata [_index,_name];
    } foreach _profileArray;
    _control lbSetCurSel _placeholderIndex;
};
