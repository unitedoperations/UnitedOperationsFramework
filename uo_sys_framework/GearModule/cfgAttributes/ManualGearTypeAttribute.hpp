class UO_FW_Gear_ManualGearEditShort: EditShort {
    //save the lbData from the selected entry upon exit
    attributeSave = "\
        _value = ctrlText (_this controlsGroupCtrl 100);\
        private _unit = ((get3denselected 'object') select 0);\
        _unit set3DENAttribute ['UO_FW_Gear_ManualUnitClass',_value];\
        _value\
    ";
    //_this - config, _value - saved value
    attributeLoad="\
        if !(typename _value isEqualTo typename '') then {\
            _value = str _value;\
        };\
        private _unit = ((get3denselected 'object') select 0);\
        _unit set3DENAttribute ['UO_FW_Gear_ManualUnitClass',_value];\
        (_this controlsGroupCtrl 100) ctrlSetText _value;\
    ";

    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            onKillFocus="\
                _ctrlEdit = _this select 0;\
                _value = ctrlText _ctrlEdit;\
                private _unit = ((get3denselected 'object') select 0);\
                _unit set3DENAttribute ['UO_FW_Gear_ManualUnitClass',_value];\
            ";
        };
    };
};
