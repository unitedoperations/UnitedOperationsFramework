class EGVAR(MapAndCompassRemover,Category) {
    displayName = "Map and Compass Remover Settings";
    collapsed = 1;
    class Attributes {
        class EGVAR(MapAndCompassRemover,GivePlayersEquipment) {
            property = QEGVAR(MapAndCompassRemover,GivePlayersEquipment);
            displayName = "Give Players Equipment";
            tooltip = "Give Players Equipment during the briefing";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(MapAndCompassRemover,RemoveAllMaps) {
            property = QEGVAR(MapAndCompassRemover,RemoveAllMaps);
            displayName = "Remove Map from AI";
            tooltip = "Remove map from all AI after briefing";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(MapAndCompassRemover,RemoveAllCompass) {
            property = QEGVAR(MapAndCompassRemover,RemoveAllCompass);
            displayName = "Remove Compass from AI";
            tooltip = "Remove compass from all AI after briefing";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(MapAndCompassRemover,AI_LeadersKeepMap) {
            property = QEGVAR(MapAndCompassRemover,AI_LeadersKeepMap);
            displayName = "AI Group Leaders Keep Maps";
            tooltip = "AI Group Leaders Keep Maps";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(MapAndCompassRemover,AI_LeadersKeepCompass) {
            property = QEGVAR(MapAndCompassRemover,AI_LeadersKeepCompass);
            displayName = "AI Group Leaders Keep Compasses";
            tooltip = "AI Group Leaders Keep Compasses";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
    };
};
