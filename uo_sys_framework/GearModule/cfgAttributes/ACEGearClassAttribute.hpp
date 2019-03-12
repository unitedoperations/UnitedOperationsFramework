class EGVAR(Gear,ACE_Arsenal_LoadoutClassCombo): Combo {
    //save the lbData from the selected entry upon exit
    attributeSave = QUOTE(_this call EFUNC(Gear,ACEGearClassAttribute_AttrSave););
    //_this - config, _value - saved value
    attributeLoad= QUOTE([ARR_2(_this,_config)] call EFUNC(Gear,ACEGearClassAttribute_AttrLoad););
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            idc=100;
            onLBSelChanged= QUOTE(_this call EFUNC(Gear,ACEGearClassAttribute_onSelChange););
        };
    };
};
