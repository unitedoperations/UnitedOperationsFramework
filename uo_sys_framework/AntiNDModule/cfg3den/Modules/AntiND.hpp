class UO_FW_Anti_ND {
    displayName = "Anti ND Settings";
    collapsed = 1;
    class Attributes {
        class UO_FW_Anti_ND_Enabled {
            property = "UO_FW_Anti_ND_Enabled";
            displayName = "Anti ND Enabled";
            tooltip = "Toggle activation";
            control = "CheckboxState";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class UO_FW_Anti_ND_Time {
            property = "UO_FW_Anti_ND_Time";
            displayName = "Time";
            tooltip = "Time in seconds after spawn after which Anti ND functionality is disabled";
            control = "UO_FW_30To120Step1_Slider";
            validate = "number";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "30";
        };
        class UO_FW_Anti_ND_Distance {
            property = "UO_FW_Anti_ND_Distance";
            displayName = "Distance";
            tooltip = "Distance in meters at which Anti ND functionality is disabled";
            control = "UO_FW_50To250Step50_Slider";
            validate = "number";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "200";
        };
    };
};
