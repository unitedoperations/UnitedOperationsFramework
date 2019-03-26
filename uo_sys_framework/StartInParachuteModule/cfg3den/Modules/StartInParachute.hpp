class EGVAR(StartInParachute,Category) {
    displayName = "Start In Parachute Options";
    collapsed = 1;
    class Attributes {
        class EGVAR(StartInParachute,Enabled) {
            property = QEGVAR(StartInParachute,Enabled);
            displayName = "Start In Parachute";
            tooltip = "Enables Parachute Unit Option";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
            typeName = "BOOL";
        };
    };
};
