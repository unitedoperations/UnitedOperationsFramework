class EGVAR(ShotCount,Category) {
    displayName = "Shot Count Settings";
    collapsed = 1;
    class Attributes {
        class EGVAR(ShotCount,Enabled) {
            property = QEGVAR(ShotCount,Enabled);
            displayName = "Shot Count";
            tooltip = "Enable Shot Count";
            control = "CheckboxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
    };
};
