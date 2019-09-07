class EGVAR(Briefing,PIDCardSelectionAttribute): Combo {
    //save the lbData from the selected entry upon exit
    attributeSave = "\
        private _value = ((_this controlsGroupCtrl 100) lbData lbCurSel (_this controlsGroupCtrl 100));\
        private _unit = ((get3denselected 'object') select 0);\
        private _name = gettext (_config >> 'property');\
        _unit setvariable [_name,_value];\
        _value\
    ";
    //_this - config, _value - saved value
    attributeLoad="\
        private _control = (_this controlsGroupCtrl 100);\
        private _name = gettext (_config >> 'property');\
        private _unit = ((get3denselected 'object') select 0);\
        private _nameArray = [] call UO_FW_fnc_Briefing_getAllPIDCards;\
        {\
            private _identifier = _x select 0;\
            private _description = _x select 1;\
            private _picturepath = _x select 2;\
            private _index = _control lbadd _identifier;\
            _control lbsetdata [_index,_identifier];\
            _control lbsetValue [_index,_foreachIndex];\
            _control lbSetTooltip [_index,_description];\
            if (_value isEqualto (_control lbData _index)) then {\
                _control lbSetCurSel _index;\
                _unit setvariable [_name,_value];\
            };\
        } foreach _nameArray;\
    ";
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {};
    };
};
