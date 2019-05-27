class EGVAR(Core,MainSettings) {
    displayName = "Main Settings";
    collapsed = 0;
    class Attributes {
        class EGVAR(Core,Enabled) {
            property = QEGVAR(Core,Enabled);
            displayName = "Enable UO Framework";
            tooltip = "Enable UO Framework";
            control = QEGVAR(Core,FrameworkCheckbox);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(Core,MissionType) {
            property = QEGVAR(Core,MissionType);
            displayName = "Mission Type";
            tooltip = "Determines Mission Type";
            control = QEGVAR(Core,MissionTypeAttribute);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
		class EGVAR(Core,DisableHeadlessCheck) {
            property = QEGVAR(Core,DisableHeadlessCheck);
            displayName = "Disable Mission HC Check";
            tooltip = "When true, disables checks for the presence of a HeadlessClient_F object.";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
    };
};
