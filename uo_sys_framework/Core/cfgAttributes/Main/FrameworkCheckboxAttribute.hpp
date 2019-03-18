class EGVAR(Core,FrameworkCheckbox): Checkbox {
    attributeLoad = QUOTE(\
        (_this controlsGroupCtrl 100) cbsetchecked _value;\
        if (_value) then {[] call EFUNC(3DEN,BasicSettings3Den);};\
    );
	attributeSave = QUOTE(\
        _checked = cbchecked (_this controlsGroupCtrl 100);\
        if (_checked) then {[] call EFUNC(3DEN,BasicSettings3Den);};\
        _checked\
    );
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            onCheckedChanged = QUOTE(\
                private _ctrlCheckbox = (_this select 0);\
                private _checked = cbChecked _ctrlCheckbox;\
                if (_checked) then {[] call EFUNC(3DEN,BasicSettings3Den);};\
            );
        };
    };
};
