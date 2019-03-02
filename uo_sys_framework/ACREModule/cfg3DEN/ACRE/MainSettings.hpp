class EGVAR(ACRE,SETTINGS_CAT_Main) {
    displayName = "Main ACRE Settings";
    collapsed = 0;
    class Attributes {
        class EGVAR(ACRE,SETTINGS_Enabled) {
            property = QEGVAR(ACRE,SETTINGS_Enabled);
            displayName = "Enable ACRE Framework";
            tooltip = "Toggle activation";
            control = "CheckBoxState";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,SCRAMBLE_Enabled) {
            property = QEGVAR(ACRE,SCRAMBLE_Enabled);
            displayName = "Enable Frequency Scramble";
            tooltip = "Toggle frequency scrambling";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,BABEL_Enabled) {
            property = QEGVAR(ACRE,BABEL_Enabled);
            displayName = "Enable Babel";
            tooltip = "Toggle Babel activation";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
    };
};
