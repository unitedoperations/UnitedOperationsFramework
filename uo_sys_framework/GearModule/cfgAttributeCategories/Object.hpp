class UO_FW_Gear {
    displayName = "Gear Options";
    collapsed = 1;
    class Attributes {
        class UO_FW_Gear_UnitSystemType {
            displayName = "Gear System Type";
            tooltip = "Set the gear system type for the unit.";
            control = "UO_FW_Gear_SystemType";
            typeName = "STRING";
            property = "UO_FW_Gear_UnitSystemType";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "ObjectControllable";
            validate = "none";
            defaultValue = "'NONE'";
        };
        class UO_FW_Gear_UnitGearType {
            displayName = "Gear Type";
            tooltip = "Set the gear type for the unit that sets the class for respawn and other functions. If set to ACE or Olsen gear mode, this corresponds to the types defined in the gear team settings.";
            control = "UO_FW_Gear_ComboGearLoad";
            GearSystems[] = {"ACEAR","OLSEN","NONE"};
            property = "UO_FW_Gear_UnitGearType";
            typeName = "STRING";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "ObjectControllable";
            validate = "none";
            defaultValue = "'NONE'";
        };
        class UO_FW_Gear_UnitGearManualType {
            property = "UO_FW_Gear_UnitGearManualType";
            displayName = "Custom Gear Type";
            GearSystems[] = {"ACEAR","OLSEN"};
            tooltip = "Defines a custom gear class for respawn and other functions. If set to ACE gear system, this corresponds to the name of an ACE mission loadout. If set to Olsen gear system, this corresponds to the name of gear type in the team olsen gear script. Leave blank to disable.";
            control = "UO_FW_Gear_ManualGearEditShort";
            typeName = "STRING";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "ObjectControllable";
            defaultValue = "''";
        };
        class UO_FW_Gear_VehicleSystemType {
            displayName = "Gear System Type";
            tooltip = "Set the gear system type for the vehicle.";
            control = "UO_FW_Gear_SystemTypeVehicle";
            typeName = "STRING";
            property = "UO_FW_Gear_VehicleSystemType";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "objectVehicle";
            validate = "none";
            defaultValue = "'NONE'";
        };
        class UO_FW_Gear_VehicleGearManualType {
            property = "UO_FW_Gear_VehicleGearManualType";
            displayName = "Custom Gear Type";
            GearSystems[] = {"OLSEN"};
            tooltip = "Defines a custom gear class for respawn and other functions. If set to ACE gear system, this corresponds to the name of an ACE mission loadout. If set to Olsen gear system, this corresponds to the name of gear type in the team olsen gear script. Leave blank to disable.";
            control = "UO_FW_Gear_ManualGearEditShort";
            typeName = "STRING";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "objectVehicle";
            defaultValue = "''";
        };
    };
};
