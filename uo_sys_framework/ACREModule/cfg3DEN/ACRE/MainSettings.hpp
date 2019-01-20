class UO_FW_Main_ACRE_SETTINGS_CAT {
    displayName = "Main ACRE Settings";
    collapsed = 0;
    class Attributes {
		class UO_FW_ACRE_SETTINGS_Enabled {
            property = "UO_FW_ACRE_SETTINGS_Enabled";
            displayName = "Enable ACRE Framework";
            tooltip = "Toggle activation";
            control = "CheckBoxState";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class UO_FW_ACRE_SCRAMBLE_Enabled {
            property = "UO_FW_ACRE_SCRAMBLE_Enabled";
            displayName = "Enable Frequency Scramble";
            tooltip = "Toggle frequency scrambling";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
		class UO_FW_ACRE_BABEL_Enabled {
            property = "UO_FW_ACRE_BABEL_Enabled";
            displayName = "Enable Babel";
            tooltip = "Toggle Babel activation";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
    };
};
