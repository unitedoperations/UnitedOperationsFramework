class EGVAR(AIDrivers,Settings) {
    displayName = "AI Drivers Settings";
    collapsed = 1;
    class Attributes {
        class EGVAR(AIDrivers,VehClasses) {
            property = QEGVAR(AIDrivers,VehClasses);
            displayName = "Vehicle Classes";
            tooltip = "Classes to give AI Drivers to at mission start. Leave blank to disable.";
            control = "EditArray";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "[]";
        };
        class EGVAR(AIDrivers,AllVehs) {
            property = QEGVAR(AIDrivers,AllVehs);
            displayName = "All Vehicles";
            tooltip = "Give AI Driver actions to all vehicles at mission start";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(AIDrivers,NVEnabled) {
            property = QEGVAR(AIDrivers,NVEnabled);
            displayName = "Night Vision";
            tooltip = "Whether the player can use NVGs in AI Driver view";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(AIDrivers,FlipEnabled) {
            property = QEGVAR(AIDrivers,FlipEnabled);
            displayName = "Flip Vehicle";
            tooltip = "Whether the player can flip the vehicle via ACE action";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
    };
};
