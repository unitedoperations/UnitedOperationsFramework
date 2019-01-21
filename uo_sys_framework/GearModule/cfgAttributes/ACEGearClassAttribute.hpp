class UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo: Combo {
    //save the lbData from the selected entry upon exit
    attributeSave = "\
        private _attProperty = getText (_config >> 'property');\
        _value = ((_this controlsGroupCtrl 100) lbData lbCurSel (_this controlsGroupCtrl 100));\
        missionNamespace setvariable [_attProperty,_value];\
        _value\
    ";
    //_this - config, _value - saved value
    attributeLoad="\
        private _control = (_this controlsGroupCtrl 100);\
        _control setvariable ['UO_FW_parentcontrolcfg',_config];\
        private _attProperty = getText (_config >> 'property');\
        private _defaultloadoutsArray = missionNamespace getvariable ['ace_arsenal_defaultLoadoutsList',[]];\
        if (_defaultloadoutsArray isEqualto []) then {\
            lbClear _control;\
            private _indexEmpty = _control lbadd 'No Loadouts Defined';\
            _control lbsetdata [_indexEmpty,'No Loadouts Defined'];\
            _control lbsetValue [_indexEmpty,99];\
            _control lbSetCurSel _indexEmpty;\
            missionNamespace setvariable [_attProperty,'NONE'];\
        } else {\
            lbClear _control;\
            private _indexNone = _control lbadd 'None';\
            _control lbsetdata [_indexNone,'NONE'];\
            _control lbsetValue [_indexNone,99];\
            if (_value isEqualto (_control lbData _indexNone)) then {\
                _control lbSetCurSel _indexNone;\
                missionNamespace setvariable [_attProperty,'NONE'];\
            };\
            {\
                _x params ['_loadoutName', '_loadoutData'];\
                private _index = _control lbadd _loadoutName;\
                _control lbsetdata [_index,_loadoutName];\
                _control lbsetValue [_index,_forEachIndex];\
                _uniformArray = (_loadoutData select 3);\
                if !(_uniformArray isEqualto []) then {\
                    _uniform = _uniformArray select 0;\
                    _uniformPicturePath = getText (configFile >> 'cfgWeapons' >> _uniform >> 'picture');\
                    _control lbsetpictureRight [_index,_uniformPicturePath];\
                    _control lbsetpictureRightcolor [_index,[1,1,1,0.75]];\
                    _control lbsetpictureRightcolorselected [_index,[1,1,1,1]];\
                };\
                _launcherArray = (_loadoutData select 1);\
                if !(_launcherArray isEqualto []) then {\
                    _launcherWeapon = _launcherArray select 0;\
                    _launcherPicturePath = getText (configFile >> 'cfgWeapons' >> _launcherWeapon >> 'picture');\
                    _control lbsetpicture [_index,_launcherPicturePath];\
                    _control lbsetpicturecolor [_index,[1,1,1,0.75]];\
                    _control lbsetpicturecolorselected [_index,[1,1,1,1]];\
                } else {\
                    _primaryWeaponArray = (_loadoutData select 0);\
                    if !(_primaryWeaponArray isEqualto []) then {\
                        _primaryWeapon = _primaryWeaponArray select 0;\
                        _primaryweaponPicturePath = getText (configFile >> 'cfgWeapons' >> _primaryWeapon >> 'picture');\
                        _control lbsetpicture [_index,_primaryweaponPicturePath];\
                        _control lbsetpicturecolor [_index,[1,1,1,0.75]];\
                        _control lbsetpicturecolorselected [_index,[1,1,1,1]];\
                    } else {\
                        _secondaryWeaponArray = (_loadoutData select 2);\
                        if !(_secondaryWeaponArray isEqualto []) then {\
                            _secondaryWeapon = _secondaryWeaponArray select 0;\
                            _secondaryweaponPicturePath = getText (configFile >> 'cfgWeapons' >> _secondaryWeapon >> 'picture');\
                            _control lbsetpicture [_index,_secondaryweaponPicturePath];\
                            _control lbsetpicturecolor [_index,[1,1,1,0.75]];\
                            _control lbsetpicturecolorselected [_index,[1,1,1,1]];\
                        };\
                    };\
                };\
                if (_value isEqualto (_control lbData _index)) then {\
                    _control lbSetCurSel _index;\
                    missionNamespace setvariable [_attProperty,_value];\
                };\
            } foreach _defaultloadoutsArray;\
        };\
    ";
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            idc=100;
            onLBSelChanged="\
                _ctrlCombo = _this select 0;\
                _cursel = _this select 1;\
                _value = _control lbData _cursel;\
                private _config = _ctrlCombo getvariable ['UO_FW_parentcontrolcfg',''];\
                private _attProperty = getText (_config >> 'property');\
                missionNamespace setvariable [_attProperty,_value];\
            ";
        };
    };
};
