class EGVAR(Gear,UnitCategory) {
    displayName = "Gear Options";
    collapsed = 1;
    class Attributes {
        class EGVAR(Gear,UnitSystemType) {
            displayName = "Gear System Type";
            tooltip = "Set the gear system type for the unit.";
            control = QEGVAR(Gear,AttributeSystemType);
            typeName = "STRING";
            property = QEGVAR(Gear,UnitSystemType);
            expression = ENTITY_EXPRESSION;
            condition = "ObjectControllable";
            validate = "none";
            defaultValue = "'NONE'";
        };
        class EGVAR(Gear,UnitGearType) {
            displayName = "Gear Type";
            tooltip = "Set the gear type for the unit that sets the class for respawn and other functions. If set to ACE or Olsen gear mode, this corresponds to the types defined in the gear team settings.";
            control = QEGVAR(Gear,AttributeComboGearLoad);
            GearSystems[] = {"ACEAR","OLSEN","NONE"};
            property = QEGVAR(Gear,UnitGearType);
            typeName = "STRING";
            expression = ENTITY_EXPRESSION;
            condition = "ObjectControllable";
            validate = "none";
            defaultValue = "'NONE'";
        };
        class EGVAR(Gear,UnitGearManualType) {
            property = QEGVAR(Gear,UnitGearManualType);
            displayName = "Custom Gear Type";
            GearSystems[] = {"ACEAR","OLSEN"};
            tooltip = "Defines a custom gear class for respawn and other functions. If set to ACE gear system, this corresponds to the name of an ACE mission loadout. If set to Olsen gear system, this corresponds to the name of gear type in the team olsen gear script. Leave blank to disable.";
            control = QEGVAR(Gear,AttributeManualGearEditShort);
            typeName = "STRING";
            expression = ENTITY_EXPRESSION;
            condition = "ObjectControllable";
            defaultValue = "''";
        };
        class EGVAR(Gear,VehicleSystemType) {
            displayName = "Gear System Type";
            tooltip = "Set the gear system type for the vehicle.";
            control = QEGVAR(Gear,AttributeSystemTypeVehicle);
            typeName = "STRING";
            property = QEGVAR(Gear,VehicleSystemType);
            expression = ENTITY_EXPRESSION;
            condition = "objectVehicle";
            validate = "none";
            defaultValue = "'NONE'";
        };
        class EGVAR(Gear,VehicleGearManualType) {
            property = QEGVAR(Gear,VehicleGearManualType);
            displayName = "Custom Gear Type";
            GearSystems[] = {"OLSEN"};
            tooltip = "Defines a custom gear class for respawn and other functions. If set to ACE gear system, this corresponds to the name of an ACE mission loadout. If set to Olsen gear system, this corresponds to the name of gear type in the team olsen gear script. Leave blank to disable.";
            control = QEGVAR(Gear,AttributeManualGearEditShort);
            typeName = "STRING";
            expression = ENTITY_EXPRESSION;
            condition = "objectVehicle";
            defaultValue = "''";
        };
    };
};
