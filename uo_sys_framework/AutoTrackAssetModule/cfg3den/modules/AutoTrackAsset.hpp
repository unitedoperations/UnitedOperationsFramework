class UO_FW_AutoTrackAsset {
    displayName = "Auto Track Asset Settings";
    collapsed = 1;
    class Attributes {
        class UO_FW_AutoTrackAsset_Enabled {
            property = "UO_FW_AutoTrackAsset_Enabled";
            displayName = "Auto Track Asset";
            tooltip = "Enables Auto Track Asset";
            control = "CheckboxState";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
            typeName = "BOOL";
        };
    };
};
