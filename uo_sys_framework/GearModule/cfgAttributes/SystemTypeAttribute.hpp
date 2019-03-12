class EGVAR(Gear,AttributeSystemType): Combo {
    attributeSave = QUOTE(_this call EFUNC(Gear,SystemTypeAttribute_AttrSave));
    attributeLoad = QUOTE([ARR_2(_this,_value)] call EFUNC(Gear,SystemTypeAttribute_AttrLoad));
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            onLBSelChanged = QUOTE([ARR_2(_this,_selectedIndex)] call EFUNC(Gear,SystemTypeAttribute_onLBSelChanged));
        };
    };
};

class EGVAR(Gear,AttributeSystemTypeVehicle): EGVAR(Gear,AttributeSystemType) {
    attributeLoad = QUOTE([ARR_2(_this,_value)] call EFUNC(Gear,SystemTypeVehicleAttribute_AttrLoad));
};
