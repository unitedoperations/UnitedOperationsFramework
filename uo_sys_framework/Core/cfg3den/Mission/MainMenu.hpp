class UO_FW_MainSettings {
    displayName = "Main Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_Enabled {
            property = "UO_FW_Enabled";
            displayName = "Enable UO Framework";
            tooltip = "Enable UO Framework";
            control = "UO_FW_FrameworkCheckbox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class UO_FW_Type {
            property = "UO_FW_Type";
            displayName = "Mission Type";
            tooltip = "Determines Mission Type";
            control = "MissionType";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
    };
};
