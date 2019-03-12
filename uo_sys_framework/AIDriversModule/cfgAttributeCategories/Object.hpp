class EGVAR(AIDrivers,Options) {
    displayName = "AI Driver Options";
    collapsed = 1;
    class Attributes {
        class EGVAR(AIDrivers,VehEnabled) {
            displayName = "AI Driver";
            tooltip = "Enable AI driver for this vehicle";
            property = QEGVAR(AIDrivers,VehEnabled);
            control = "CheckBox";
            expression = ENTITY_EXPRESSION;
            condition = "objectVehicle";
            defaultValue = "false";
        };
        class EGVAR(AIDrivers,VehNVEnabled) {
            property = QEGVAR(AIDrivers,VehNVEnabled);
            displayName = "Night Vision";
            tooltip = "Whether the player can use NVGs in AI Driver view";
            control = "CheckBox";
            condition = "objectVehicle";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(AIDrivers,VehFlipEnabled) {
            property = QEGVAR(AIDrivers,VehFlipEnabled);
            displayName = "Flip Vehicle";
            tooltip = "Whether the player can flip the vehicle via ACE action";
            control = "CheckBox";
            condition = "objectVehicle";
            expression = ENTITY_EXPRESSION;
            defaultValue = "true";
        };
    };
};
