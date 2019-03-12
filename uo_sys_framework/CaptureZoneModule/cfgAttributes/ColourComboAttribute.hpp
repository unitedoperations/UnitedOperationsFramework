class EGVAR(CaptureZone,ColourCombo): Combo {
    //save the lbData from the selected entry upon exit
    attributeSave = QUOTE(_this call EFUNC(CaptureZone,ColourComboAttribute_AttrSave););
    //_this - config, _value - saved value
    attributeLoad= QUOTE([ARR_2(_this,_config)] call EFUNC(CaptureZone,ColourComboAttribute_AttrLoad););
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            idc=100;
            onLBSelChanged= QUOTE(_this call EFUNC(CaptureZone,ColourComboAttribute_onSelChange););
        };
    };
};
