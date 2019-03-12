class EGVAR(SafeStart,Category) {
    displayName = "Safe Start Settings";
    collapsed = 1;
    class Attributes {
        class EGVAR(SafeStart,Enable) {
            property = QEGVAR(SafeStart,Enable);
            displayName = "Safe Start";
            tooltip = "Enable Safe Start";
            control = "CheckboxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class EGVAR(SafeStart,Lowered) {
            property = QEGVAR(SafeStart,Lowered);
            displayName = "Start Lowered";
            tooltip = "Enable Lowered Weapon on Mission Start";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class EGVAR(SafeStart,Unloaded) {
            property = QEGVAR(SafeStart,Unloaded);
            displayName = "Start Unloaded";
            tooltip = "Enable Unloaded Weapon on Mission Start";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
    };
};
