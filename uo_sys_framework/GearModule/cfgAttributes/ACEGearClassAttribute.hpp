class UO_FW_Gear_ACE_Arsenal_LoadoutClassCombo: Combo {
    //save the lbData from the selected entry upon exit
    attributeSave = "\
        private _control = (_this controlsGroupCtrl 100);\
        private _config = _control getvariable ['UO_FW_parentcontrolcfg',''];\
        private _attProperty = getText (_config >> 'property');\
        private _value = (_control lbData lbCurSel _control);\
        missionNamespace setvariable [_attProperty,_value];\
        _value\
    ";
    //_this - config, _value - saved value
    attributeLoad="\
        private _control = (_this controlsGroupCtrl 100);\
        _control setvariable ['UO_FW_parentcontrolcfg',_config];\
        private _attProperty = getText (_config >> 'property');\
        diag_log format ['attributeLoad started, _value: %1',_value];\
        missionNamespace setvariable [_attProperty,_value];\
        lbClear _control;\
        private _indexNone = _control lbadd 'None';\
        _control lbsetdata [_indexNone,'NONE'];\
        _control lbsetValue [_indexNone,0];\
        if ((_value isEqualto 'NONE') || (_value isEqualTo '')) then {\
            _control lbSetCurSel _indexNone;\
            missionNamespace setvariable [_attProperty,'NONE'];\
        };\
        [_control,_attProperty,_value] call FUNC(ACEGearClassAttributeLoad);\
    ";
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            idc=100;
            onLBSelChanged="\
                private _control = _this select 0;\
                private _cursel = _this select 1;\
                private _lbValue = _control lbData _cursel;\
                private _config = _control getvariable ['UO_FW_parentcontrolcfg',''];\
                private _attProperty = getText (_config >> 'property');\
                missionNamespace setvariable [_attProperty,_lbValue];\
            ";
        };
    };
};
