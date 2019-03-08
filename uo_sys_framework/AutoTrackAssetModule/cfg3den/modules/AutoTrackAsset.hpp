class UO_FW_AutoTrackAsset {
    displayName = "Auto Track Asset Settings";
    collapsed = 1;
    class Attributes {
        class EGVAR(AutoTrackAsset,Enabled) {
            property = QEGVAR(AutoTrackAsset,Enabled);
            displayName = "Auto Track Asset";
            tooltip = "Enables Auto Track Asset";
            control = "CheckboxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
            typeName = "BOOL";
        };
    };
};
