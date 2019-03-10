class EGVAR(ACRE,Settings_Category) {
    displayName = "Main ACRE Settings";
    collapsed = 0;
    class Attributes {
        class EGVAR(ACRE,Enabled) {
            property = QEGVAR(ACRE,Enabled);
            displayName = "Enable ACRE Framework";
            tooltip = "Toggle activation";
            control = "CheckBoxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,Scramble_Enabled) {
            property = QEGVAR(ACRE,Scramble_Enabled);
            displayName = "Enable Frequency Scramble";
            tooltip = "Toggle frequency scrambling";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,Babel_Enabled) {
            property = QEGVAR(ACRE,Babel_Enabled);
            displayName = "Enable Babel";
            tooltip = "Toggle Babel activation";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
    };
};
