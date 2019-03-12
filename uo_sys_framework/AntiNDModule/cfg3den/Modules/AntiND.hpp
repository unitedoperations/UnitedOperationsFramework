class UO_FW_AntiND {
    displayName = "Anti ND Settings";
    collapsed = 1;
    class Attributes {
        class EGVAR(AntiND,Enabled) {
            property = QEGVAR(AntiND,Enabled);
            displayName = "Anti ND Enabled";
            tooltip = "Toggle activation";
            control = "CheckboxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class EGVAR(AntiND,Time) {
            property = QEGVAR(AntiND,Time);
            displayName = "Time";
            tooltip = "Time in seconds after spawn after which Anti ND functionality is disabled";
            control = QMGVAR(30To120Step1_Slider);
            validate = "number";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "30";
        };
        class EGVAR(AntiND,Distance) {
            property = QEGVAR(AntiND,Distance);
            displayName = "Distance";
            tooltip = "Distance in meters at which Anti ND functionality is disabled";
            control = QMGVAR(50To250Step50_Slider);
            validate = "number";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "200";
        };
    };
};
