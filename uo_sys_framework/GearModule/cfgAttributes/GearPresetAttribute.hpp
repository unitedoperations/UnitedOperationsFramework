class UO_FW_Gear_PresetsCombo_BLUFOR: ComboPreview {
    //save the lbData from the selected entry upon exit
    attributeSave = "\
        private _control = (_this controlsGroupCtrl 100);\
        private _value = ((_this controlsGroupCtrl 100) lbData lbCurSel (_this controlsGroupCtrl 100));\
        _value\
    ";
    //_this - config, _value - saved value
    attributeLoad="\
        private _control = (_this controlsGroupCtrl 100);\
        private _cfgEntries = [configFile >> 'UO_FW_Gear_Presets',0] call BIS_fnc_returnChildren;\
        if (_cfgEntries isEqualto []) then {\
            lbClear _control;\
            private _indexEmpty = _control lbadd 'No Presets Defined';\
            _control lbsetdata [_indexEmpty,'No Presets Defined'];\
            _control lbsetValue [_indexEmpty,99];\
            _control lbSetCurSel _indexEmpty;\
        } else {\
            lbClear _control;\
            private _indexNone = _control lbadd 'None';\
            _control lbsetdata [_indexNone,'NONE'];\
            _control lbsetValue [_indexNone,99];\
            _control lbSetCurSel _indexNone;\
            {\
                private _cfg = _x;\
                private _displayName = getText(_cfg >> 'displayName');\
                private _displayDesc = getText(_cfg >> 'displayDesc');\
                private _author = '';\
                if (isArray (_entry >> 'authors')) then {\
                    private _authors = getArray (_entry >> 'authors');\
                    {\
                        if (_x isEqualType '') then {\
                            _author = format ['%1, %2', _author, _x];\
                        };\
                    } forEach _authors;\
                };\
                private _displayTooltip = format ['%1, Authors: %2', _displayDesc, _author];\
                private _index = _control lbadd _displayName;\
                _control lbsetdata [_index,_displayName];\
                _control lbsetValue [_index,_forEachIndex];\
                _control lbSetTooltip [_index,_displayTooltip];\
            } foreach _cfgEntries;\
        };\
    ";
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            idc=100;
        };
        class Preview: Preview {
            idc=101;
            onMouseButtonClick="\
                private _ctrlButton = _this select 0;\
                private _ctrlGroup = ctrlParentControlsGroup _ctrlButton;\
                private _ctrlCombo = _ctrlGroup controlsgroupctrl 100;\
                private _value = (_ctrlCombo lbData lbCurSel _ctrlCombo);\
                diag_log format ['GearLoadPreset started, _value: %1',_value];\
                if !(_value isEqualto 'NONE') then {\
                    [_value,'BLUFOR',_ctrlButton] call FUNC(GearLoadPreset);\
                };\
            ";
        };
    };
};

class UO_FW_Gear_PresetsCombo_OPFOR: UO_FW_Gear_PresetsCombo_BLUFOR {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            idc=100;
        };
        class Preview: Preview {
            idc=101;
            onMouseButtonClick="\
                private _ctrlButton = _this select 0;\
                private _ctrlGroup = ctrlParentControlsGroup _ctrlButton;\
                private _ctrlCombo = _ctrlGroup controlsgroupctrl 100;\
                private _value = (_ctrlCombo lbData lbCurSel _ctrlCombo);\
                diag_log format ['GearLoadPreset started, _value: %1',_value];\
                if !(_value isEqualto 'NONE') then {\
                    [_value,'OPFOR',_ctrlButton] call FUNC(GearLoadPreset);\
                };\
            ";
        };
    };
};

class UO_FW_Gear_PresetsCombo_Indfor: UO_FW_Gear_PresetsCombo_BLUFOR {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            idc=100;
        };
        class Preview: Preview {
            idc=101;
            onMouseButtonClick="\
                private _ctrlButton = _this select 0;\
                private _ctrlGroup = ctrlParentControlsGroup _ctrlButton;\
                private _ctrlCombo = _ctrlGroup controlsgroupctrl 100;\
                private _value = (_ctrlCombo lbData lbCurSel _ctrlCombo);\
                diag_log format ['GearLoadPreset started, _value: %1',_value];\
                if !(_value isEqualto 'NONE') then {\
                    [_value,'Indfor',_ctrlButton] call FUNC(GearLoadPreset);\
                };\
            ";
        };
    };
};

class UO_FW_Gear_PresetsCombo_CIVILIAN: UO_FW_Gear_PresetsCombo_BLUFOR {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            idc=100;
        };
        class Preview: Preview {
            idc=101;
            onMouseButtonClick="\
                private _ctrlButton = _this select 0;\
                private _ctrlGroup = ctrlParentControlsGroup _ctrlButton;\
                private _ctrlCombo = _ctrlGroup controlsgroupctrl 100;\
                private _value = (_ctrlCombo lbData lbCurSel _ctrlCombo);\
                diag_log format ['GearLoadPreset started, _value: %1',_value];\
                if !(_value isEqualto 'NONE') then {\
                    [_value,'CIVILIAN',_ctrlButton] call FUNC(GearLoadPreset);\
                };\
            ";
        };
    };
};
