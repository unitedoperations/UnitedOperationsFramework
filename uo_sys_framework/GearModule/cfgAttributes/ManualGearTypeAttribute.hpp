class EGVAR(Gear,AttributeManualGearEditShort): EditShort {
    //save the lbData from the selected entry upon exit
    attributeSave = "\
        private _value = ctrlText (_this controlsGroupCtrl 100);\
        private _unit = ((get3denselected 'object') select 0);\
        _unit setvariable ['##PREFIX##_Gear_ManualUnitClass',_value];\
        _value\
    ";
    //_this - config, _value - saved value
    attributeLoad="\
        if !(typename _value isEqualTo typename '') then {\
            _value = str _value;\
        };\
        private _unit = ((get3denselected 'object') select 0);\
        (_this controlsGroupCtrl 100) ctrlSetText _value;\
        _unit setvariable ['##PREFIX##_Gear_ManualUnitClass',_value];\
    ";

    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            onKillFocus="\
                private _ctrlEdit = _this select 0;\
                private _value = ctrlText _ctrlEdit;\
                private _unit = ((get3denselected 'object') select 0);\
                _unit setvariable ['##PREFIX##_Gear_ManualUnitClass',_value];\
            ";
        };
    };
};
