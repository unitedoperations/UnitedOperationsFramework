class UO_FW_RespawnDelay_Slider: Slider {
    attributeLoad = "\
        params ['_ctrlGroup'];\
        private _slider = _ctrlGroup controlsGroupCtrl 100;\
        private _edit = _ctrlGroup controlsGroupCtrl 101;\
        _slider sliderSetPosition _value;\
        _edit ctrlSetText ([_value, 1, 1] call CBA_fnc_formatNumber);\
    ";
    attributeSave = "\
        params ['_ctrlGroup'];\
        sliderPosition (_ctrlGroup controlsGroupCtrl 100);\
    ";
    onLoad = "\
        params ['_ctrlGroup'];\
        private _slider = _ctrlGroup controlsGroupCtrl 100;\
        private _edit = _ctrlGroup controlsGroupCtrl 101;\
        _slider sliderSetRange [5, 20];\
        _slider ctrlAddEventHandler ['SliderPosChanged', {\
            params ['_slider'];\
            private _edit = (ctrlParentControlsGroup _slider) controlsGroupCtrl 101;\
            private _value = sliderPosition _slider;\
            _edit ctrlSetText ([_value, 1, 1] call CBA_fnc_formatNumber);\
        }];\
        _edit ctrlAddEventHandler ['KillFocus', {\
            params ['_edit'];\
            private _slider = (ctrlParentControlsGroup _edit) controlsGroupCtrl 100;\
            private _value = ((parseNumber ctrlText _edit) min 20) max 5;\
            _slider sliderSetPosition _value;\
            _edit ctrlSetText str _value;\
        }];\
    ";
};
