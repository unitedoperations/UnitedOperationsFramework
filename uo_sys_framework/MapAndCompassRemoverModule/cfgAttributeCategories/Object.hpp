class EGVAR(MapAndCompassRemover,Options) {
    displayName = "Remove Compass and Map Options";
    collapsed = 1;
    class Attributes {
        class EGVAR(MapAndCompassRemover,RemoveMap) {
            displayName = "Remove map after briefing";
            tooltip = "If ticked the map for the unit will be removed after the briefing is done!";
            property = QEGVAR(MapAndCompassRemover,RemoveMap);
            control = "Checkbox";
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "false";
        };
        class EGVAR(MapAndCompassRemover,RemoveCompass) {
            displayName = "Remove compass after briefing";
            tooltip = "If ticked the compass for the unit will be removed after the briefing is done!";
            property = QEGVAR(MapAndCompassRemover,RemoveCompass);
            control = "Checkbox";
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "false";
        };
    };
};
