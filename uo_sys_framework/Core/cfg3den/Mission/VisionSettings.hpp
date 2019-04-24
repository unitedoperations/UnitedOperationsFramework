class EGVAR(Core,ViewDistanceSettings) {
    displayName = "View Distance Settings";
    collapsed = 0;
    class Attributes {
        class EGVAR(Core,VisionPlayerEnabled) {
            property = QEGVAR(Core,VisionPlayerEnabled);
            displayName = "Player View-distance";
            tooltip = "Enable Player View-distance";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(Core,PlayerViewDistance) {
            property = QEGVAR(Core,PlayerViewDistance);
            displayName = "Player View-distance";
            tooltip = "Set the Player View-distance in meters. Min = 200m enforced by Arma. Players might not see all the way to the limit due to fog but AI can.";
            control = QMGVAR(200To10000Step50_Slider);
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "2500";
            typeName = "NUMBER";
        };
        class EGVAR(Core,VisionAIEnabled) {
            property = QEGVAR(Core,VisionAIEnabled);
            displayName = "AI Viewdistance";
            tooltip = "Enable AI Viewdistance";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(Core,AIViewDistance) {
            property = QEGVAR(Core,AIViewDistance);
            displayName = "AI View-distance";
            tooltip = "Set the AI View-distance in meters.  Min = 200m enforced by Arma.";
            control = QMGVAR(200To10000Step50_Slider);
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "2500";
            typeName = "NUMBER";
        };
    };
};
