class MGVAR(Slider): Slider {
    attributeLoad = "\
        params ['_ctrlGroup'];\
        private _slider = _ctrlGroup controlsGroupCtrl 100;\
        private _edit = _ctrlGroup controlsGroupCtrl 101;\
        _slider sliderSetPosition _value;\
        _edit ctrlSetText ([_value, 1, 0, true] call CBA_fnc_formatNumber);\
    ";
    attributeSave = "\
        params ['_ctrlGroup'];\
        parseNumber ctrlText (_ctrlGroup controlsGroupCtrl 101)\
    ";
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            idc=100;
        };
        class Edit: Edit {
            idc=101;
        };
    };
};

#define UO_FW_SLIDERCONFIG_DECIMAL(MINVAL,MAXVAL,STEPSIZE)\
class PREFIX##_##MINVAL##To##MAXVAL##Step0##STEPSIZE##_Slider: MGVAR(Slider) {\
    attributeLoad = "\
        params ['_ctrlGroup'];\
        private _slider = _ctrlGroup controlsGroupCtrl 100;\
        private _edit = _ctrlGroup controlsGroupCtrl 101;\
        _slider sliderSetPosition _value;\
        _edit ctrlSetText ([_value, 1, 1] call CBA_fnc_formatNumber);\
    ";\
    onLoad = "\
        params ['_ctrlGroup'];\
        private _slider = _ctrlGroup controlsGroupCtrl 100;\
        private _edit = _ctrlGroup controlsGroupCtrl 101;\
        _slider ctrlAddEventHandler ['SliderPosChanged', {\
            params ['_slider'];\
            private _edit = (ctrlParentControlsGroup _slider) controlsGroupCtrl 101;\
            private _value = sliderPosition _slider;\
            _edit ctrlSetText ([_value, 1, 1, true] call CBA_fnc_formatNumber);\
        }];\
        _edit ctrlAddEventHandler ['KillFocus', {\
            params ['_editctrl'];\
            private _slider = (ctrlParentControlsGroup _editctrl) controlsGroupCtrl 100;\
            private _value = (parseNumber ctrlText _editctrl);\
            _slider sliderSetPosition _value;\
            _editctrl ctrlSetText str _value;\
        }];\
    ";\
    class Controls: Controls {\
        class Title: Title {};\
        class Value: Value {\
            sliderRange[]={##MINVAL##,##MAXVAL##};\
            sliderStep=0.##STEPSIZE##;\
        };\
        class Edit: Edit {};\
    };\
}

#define UO_FW_SLIDERCONFIG(MINVAL,MAXVAL,STEPSIZE)\
class PREFIX##_##MINVAL##To##MAXVAL##Step##STEPSIZE##_Slider: MGVAR(Slider) {\
    attributeLoad = "\
        params ['_ctrlGroup'];\
        private _slider = _ctrlGroup controlsGroupCtrl 100;\
        private _edit = _ctrlGroup controlsGroupCtrl 101;\
        _slider sliderSetPosition _value;\
        _edit ctrlSetText ([_value, 1, 0, true] call CBA_fnc_formatNumber);\
    ";\
    onLoad = "\
        params ['_ctrlGroup'];\
        private _slider = _ctrlGroup controlsGroupCtrl 100;\
        private _edit = _ctrlGroup controlsGroupCtrl 101;\
        _slider ctrlAddEventHandler ['SliderPosChanged', {\
            params ['_slider'];\
            private _edit = (ctrlParentControlsGroup _slider) controlsGroupCtrl 101;\
            private _value = sliderPosition _slider;\
            _edit ctrlSetText ([_value, 1, 0, true] call CBA_fnc_formatNumber);\
        }];\
        _edit ctrlAddEventHandler ['KillFocus', {\
            params ['_editctrl'];\
            private _slider = (ctrlParentControlsGroup _editctrl) controlsGroupCtrl 100;\
            private _value = (parseNumber ctrlText _editctrl);\
            _slider sliderSetPosition _value;\
            _editctrl ctrlSetText str _value;\
        }];\
    ";\
    class Controls: Controls {\
        class Title: Title {};\
        class Value: Value {\
            sliderRange[]={##MINVAL##,##MAXVAL##};\
            sliderStep=##STEPSIZE##;\
        };\
        class Edit: Edit {};\
    };\
}

UO_FW_SLIDERCONFIG_DECIMAL(1,4,1);

UO_FW_SLIDERCONFIG(0,5,1);
UO_FW_SLIDERCONFIG(1,5,1);
UO_FW_SLIDERCONFIG(1,10,1);
UO_FW_SLIDERCONFIG(5,20,1);
UO_FW_SLIDERCONFIG(1,30,1);
UO_FW_SLIDERCONFIG(15,40,5);
UO_FW_SLIDERCONFIG(1,100,5);
UO_FW_SLIDERCONFIG(5,100,5);
UO_FW_SLIDERCONFIG(10,100,1);
UO_FW_SLIDERCONFIG(30,100,1);
UO_FW_SLIDERCONFIG(0,120,1);
UO_FW_SLIDERCONFIG(30,120,1);
UO_FW_SLIDERCONFIG(50,200,50);
UO_FW_SLIDERCONFIG(0,250,10);
UO_FW_SLIDERCONFIG(25,250,5);
UO_FW_SLIDERCONFIG(50,250,50);
UO_FW_SLIDERCONFIG(120,360,1);
UO_FW_SLIDERCONFIG(100,500,100);
UO_FW_SLIDERCONFIG(0,600,1);
UO_FW_SLIDERCONFIG(30,900,1);
UO_FW_SLIDERCONFIG(100,1000,100);
UO_FW_SLIDERCONFIG(200,1000,100);
UO_FW_SLIDERCONFIG(300,1000,100);
UO_FW_SLIDERCONFIG(500,2500,100);
