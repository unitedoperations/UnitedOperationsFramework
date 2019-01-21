class UO_FW_SafeStart {
    displayName = "Safe Start Settings";
    collapsed = 1;
    class Attributes {
        class UO_FW_SafeStart_Enable {
            property = "UO_FW_SafeStart_Enable";
            displayName = "Safe Start";
            tooltip = "Enable Safe Start";
            control = "CheckboxState";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class UO_FW_SafeStart_Lowered {
            property = "UO_FW_SafeStart_Lowered";
            displayName = "Start Lowered";
            tooltip = "Enable Lowered Weapon on Mission Start";
            control = "Checkbox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class UO_FW_SafeStart_Unloaded {
            property = "UO_FW_SafeStart_Unloaded";
            displayName = "Start Unloaded";
            tooltip = "Enable Unloaded Weapon on Mission Start";
            control = "Checkbox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
    };
};
