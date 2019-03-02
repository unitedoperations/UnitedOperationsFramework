class EGVAR(Core,MainSettings) {
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
        class EGVAR(Core,MissionType) {
            property = "UO_FW_MissionType";
            displayName = "Mission Type";
            tooltip = "Determines Mission Type";
            control = "MissionType";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
    };
};
