class EGVAR(MapCompassRemover,Options_AI) {
    displayName = "Remove Compass and Map Options";
    collapsed = 1;
    class Attributes {
        class EGVAR(MapCompassRemover,KeepMapAI) {
            displayName = "Keep map after briefing";
            tooltip = "If ticked the map for the unit will be kept even if the module setting to remove all AI maps is enabled";
            property = QEGVAR(MapCompassRemover,KeepMapAI);
            control = "UO_FW_CheckBoxAIOnlyCategory";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "false";
        };
        class EGVAR(MapCompassRemover,KeepCompassAI) {
            displayName = "Keep compass after briefing";
            tooltip = "If ticked the compass for the unit will be kept even if the module setting to remove all AI compasses is enabled";
            property = QEGVAR(MapCompassRemover,KeepCompassAI);
            control = "Checkbox";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "false";
        };
        class EGVAR(MapCompassRemover,RemoveMapAI) {
            displayName = "Remove map after briefing";
            tooltip = "If ticked the map for the unit will be removed after the briefing is done!";
            property = QEGVAR(MapCompassRemover,RemoveMapAI);
            control = "Checkbox";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "false";
        };
        class EGVAR(MapCompassRemover,RemoveCompassAI) {
            displayName = "Remove compass after briefing";
            tooltip = "If ticked the compass for the unit will be removed after the briefing is done!";
            property = QEGVAR(MapCompassRemover,RemoveCompassAI);
            control = "Checkbox";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "false";
        };
    };
};


class EGVAR(MapCompassRemover,Options_Player) {
    displayName = "Remove Compass and Map Options";
    collapsed = 1;
    class Attributes {
        class EGVAR(MapCompassRemover,RemoveMap) {
            displayName = "Remove map after briefing";
            tooltip = "If ticked the map for the unit will be removed after the briefing is done!";
            property = QEGVAR(MapCompassRemover,RemoveMap);
            control = "UO_FW_CheckBoxPlayerOnlyCategory";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "false";
        };
        class EGVAR(MapCompassRemover,RemoveCompass) {
            displayName = "Remove compass after briefing";
            tooltip = "If ticked the compass for the unit will be removed after the briefing is done!";
            property = QEGVAR(MapCompassRemover,RemoveCompass);
            control = "Checkbox";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "false";
        };
    };
};
