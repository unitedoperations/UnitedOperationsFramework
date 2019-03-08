#define COMPONENT Gear
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EDEN_CHECK;

LOG("ACEGearClassAttributeLoad started");

_this params ["_this", "_config"];

private _control = (_this controlsGroupCtrl 100);
_control setvariable [QMGVAR(parentcontrolcfg),_config];
private _attProperty = getText (_config >> "property");
missionNamespace setvariable [_attProperty,_value];
lbClear _control;
private _indexNone = _control lbadd "None";
_control lbsetdata [_indexNone,"NONE"];
_control lbsetValue [_indexNone,0];
if ((_value isEqualto "NONE") || (_value isEqualTo "")) then {
    _control lbSetCurSel _indexNone;
    missionNamespace setvariable [_attProperty,"NONE"];
};

private _defaultloadoutsArray = missionNamespace getvariable ["ace_arsenal_defaultLoadoutsList",[]];
if !(_defaultloadoutsArray isEqualto []) then {
    {
        _x params ["_loadoutName", "_loadoutData"];
        private _index = _control lbadd _loadoutName;
        _control lbsetdata [_index,_loadoutName];
        _control lbsetValue [_index,(_forEachIndex + 1)];
        private _uniformArray = (_loadoutData select 3);
        if !(_uniformArray isEqualto []) then {
            private _uniform = _uniformArray select 0;
            private _uniformPicturePath = getText (configFile >> "cfgWeapons" >> _uniform >> "picture");
            _control lbsetpictureRight [_index,_uniformPicturePath];
            _control lbsetpictureRightcolor [_index,[1,1,1,0.75]];
            _control lbsetpictureRightcolorselected [_index,[1,1,1,1]];
        };
        private _launcherArray = (_loadoutData select 1);
        if !(_launcherArray isEqualto []) then {
            private _launcherWeapon = _launcherArray select 0;
            private _launcherPicturePath = getText (configFile >> "cfgWeapons" >> _launcherWeapon >> "picture");
            _control lbsetpicture [_index,_launcherPicturePath];
            _control lbsetpicturecolor [_index,[1,1,1,0.75]];
            _control lbsetpicturecolorselected [_index,[1,1,1,1]];
        } else {
            private _primaryWeaponArray = (_loadoutData select 0);
            if !(_primaryWeaponArray isEqualto []) then {
                private _primaryWeapon = _primaryWeaponArray select 0;
                private _primaryweaponPicturePath = getText (configFile >> "cfgWeapons" >> _primaryWeapon >> "picture");
                _control lbsetpicture [_index,_primaryweaponPicturePath];
                _control lbsetpicturecolor [_index,[1,1,1,0.75]];
                _control lbsetpicturecolorselected [_index,[1,1,1,1]];
            } else {
                private _secondaryWeaponArray = (_loadoutData select 2);
                if !(_secondaryWeaponArray isEqualto []) then {
                    private _secondaryWeapon = _secondaryWeaponArray select 0;
                    private _secondaryweaponPicturePath = getText (configFile >> "cfgWeapons" >> _secondaryWeapon >> "picture");
                    _control lbsetpicture [_index,_secondaryweaponPicturePath];
                    _control lbsetpicturecolor [_index,[1,1,1,0.75]];
                    _control lbsetpicturecolorselected [_index,[1,1,1,1]];
                };
            };
        };
        if (_value == _loadoutName) then {
            _control lbSetCurSel _index;
            missionNamespace setvariable [_attProperty,_value];
        };
    } foreach _defaultloadoutsArray;
};
