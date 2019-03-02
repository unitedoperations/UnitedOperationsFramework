class UO_FW_MACR {
    displayName = "Map and Compass Remover Settings";
    collapsed = 1;
    class Attributes {
        class EGVAR(MACR,MAP_ALL) {
            property = QEGVAR(MACR,MAP_ALL);
            displayName = "Remove Map";
            tooltip = "Remove map from all AI after briefing";
            control = "Checkbox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(MACR,COMPASS_ALL) {
            property = QEGVAR(MACR,COMPASS_ALL);
            displayName = "Remove Compass";
            tooltip = "Remove compass from all AI after briefing";
            control = "Checkbox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
    };
};
