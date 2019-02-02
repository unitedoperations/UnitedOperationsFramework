class UO_FW_FrameworkCheckbox: Checkbox {
    attributeLoad="\
        (_this controlsGroupCtrl 100) cbsetchecked _value;\
        if (_value) then {[] call UO_FW_fnc_BasicSettings3Den;};\
    ";
	attributeSave = "\
        _value = cbchecked (_this controlsGroupCtrl 100);\
        if (_value) then {[] call UO_FW_fnc_BasicSettings3Den;};\
        _value\
    ";
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            onCheckedChanged ="\
                params ["_control", "_checked"];\
                if (_checked) then {[] call UO_FW_fnc_BasicSettings3Den;};\
            ";
        };
    };
};
