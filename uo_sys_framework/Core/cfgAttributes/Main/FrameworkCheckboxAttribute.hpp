class UO_FW_FrameworkCheckbox: Checkbox {
    attributeLoad="\
        _checked = switch (true) do {\
            case (_value isequaltype 0): {\
                ([false,true] select (_value max 0 min 1))\
            };\
            case (_value isequaltype ''): {\
                ([false,true] select ((parsenumber _value) max 0 min 1))\
            };\
            default {\
                _value\
            };\
        };\
        (_this controlsGroupCtrl 100) cbsetchecked _checked;\
        if (_checked) then {[] call UO_FW_fnc_BasicSettings3Den;};\
    ";
	attributeSave = "\
        _value = cbchecked (_this controlsGroupCtrl 100);\
        if (((_value isequaltype 0) && {(_value isEqualTo 1)}) || (_value)) then {[] call UO_FW_fnc_BasicSettings3Den;};\
        _value\
    ";
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {};
    };
};
