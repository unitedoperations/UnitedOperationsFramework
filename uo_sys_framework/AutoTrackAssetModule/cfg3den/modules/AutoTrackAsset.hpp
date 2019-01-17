class UO_FW_AutoTrackAsset {
    displayName = "Auto Track Asset Settings";
    collapsed = 1;
    class Attributes {
        class UO_FW_AutoTrackAsset_Enabled {
            property = "UO_FW_AutoTrackAsset_Enabled";
            displayName = "Auto Track Asset";
            tooltip = "Enables Auto Track Asset";
            control = "CheckboxState";
            expression = "missionNamespace setVariable ['%s', _value];";
            defaultValue = "true";
            typeName = "BOOL";
        };
    };
};
