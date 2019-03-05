class UO_FW_FrameworkCheckbox: Checkbox {
    attributeLoad = QUOTE(\
        (_this controlsGroupCtrl 100) cbsetchecked _value;\
        if (_value) then {[] call EFUNC(3DEN,BasicSettings3Den);};\
    );
	attributeSave = QUOTE(\
        _value = cbchecked (_this controlsGroupCtrl 100);\
        if (_value) then {[] call EFUNC(3DEN,BasicSettings3Den);};\
        _value\
    );
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            onCheckedChanged = QUOTE(\
                private _ctrlCheckbox = (_this select 0);\
                private _state = [ARR_2(false,true)] select (_this select 1);\
                if (_state) then {[] call EFUNC(3DEN,BasicSettings3Den);};\
            );
        };
    };
};
