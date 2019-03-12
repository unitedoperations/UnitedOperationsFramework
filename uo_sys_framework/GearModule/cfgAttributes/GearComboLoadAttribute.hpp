class EGVAR(Gear,AttributeComboGearLoad): ComboPreview {
    //save the lbData from the selected entry upon exit
    attributeSave = QUOTE(_this call EFUNC(Gear,GearComboLoadAttribute_AttrSave));
    //_this - config, _value - saved value
    attributeLoad= QUOTE(_this call EFUNC(Gear,GearComboLoadAttribute_AttrLoad));
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            onLBSelChanged= QUOTE(_this call EFUNC(Gear,GearComboLoadAttribute_onSelChange));
        };
        class Preview: Preview {
            idc=101;
            onMouseButtonClick= QUOTE(_this call EFUNC(Gear,GearComboLoadAttribute_onMouseClick));
        };
    };
};
