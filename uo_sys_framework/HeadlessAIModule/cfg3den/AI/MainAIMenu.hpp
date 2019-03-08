class EGVAR(AI,MainCategory) {
    displayName = "AI Settings";
    collapsed = 0;
    class Attributes {
        class EGVAR(AI,Enabled) {
            property = QEGVAR(AI,Enabled);
            displayName = "Enable AI System";
            tooltip = "Enable AI System";
            control = "CheckboxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(AI,DEBUG) {
            property = QEGVAR(AI,DEBUG);
            displayName = "Debug Mode";
            tooltip = "Enables Debug Mode";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(AI,MARKERS_Enabled) {
            property = QEGVAR(AI,MARKERS_Enabled);
            displayName = "Debug Markers";
            tooltip = "Enables Debug Markers for AI";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
    };
};
