class UO_FW_Gear_ACE_Arsenal_PresetsCombo: ComboPreview {
    //save the lbData from the selected entry upon exit
    attributeSave = "\
        _value = ((_this controlsGroupCtrl 100) lbData lbCurSel (_this controlsGroupCtrl 100));\
        private _unit = ((get3denselected 'object') select 0);\
        _unit setvariable ['UO_FW_Gear_UnitClass',_value,true];\
        _value\
    ";
    //_this - config, _value - saved value
    attributeLoad="\
        private _control = (_this controlsGroupCtrl 100);\
        _control setvariable ['UO_FW_parentcontrolcfg',_config];\
        _GearPresetConfigs = [];\
        {\
            _x params ['_name','_className'];\
            private _index = _control lbadd _name;\
            _control lbsetdata [_index,_className];\
            _control lbsetValue [_index,_foreachIndex];\
            if (_value isEqualto (_control lbData _index)) then {\
                _control lbSetCurSel _index;\
            };\
        } foreach _GearPresetConfigs;\
    ";
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            onLBSelChanged="\
                _ctrlCombo = _this select 0;\
                _cursel = _this select 1;\
                _value = _control lbData _cursel;\
            ";
        };
        class Preview: Preview {
            idc=101;
            onMouseButtonClick="\
                _ctrlButton = _this select 0;\
                _ctrlGroup = ctrlParentControlsGroup _ctrlButton;\
                _ctrlCombo = _ctrlGroup controlsgroupctrl 100;\
                _unit = ((get3denselected 'object') select 0);\
                _GearSystem = _unit getvariable ['UO_FW_3DENATTR_GearSystem','NONE'];\
                if ((_GearSystem isEqualto 'ACEAR') || (_GearSystem isEqualto 'OLSEN')) then {\
                    [(_ctrlCombo lbData lbcursel _ctrlCombo),_unit,_GearSystem] call UO_FW_fnc_GearTypeLoadfromAttribute;\
                };\
            ";
        };
    };
};
