class EGVAR(Core,ViewDistanceSettings) {
    displayName = "View Distance Settings";
    collapsed = 0;
    class Attributes {
        class EGVAR(Core,PlayerViewDistance) {
            property = QEGVAR(Core,PlayerViewDistance);
            displayName = "Player View Distance";
            tooltip = "Set the Player View Distance in meters.";
            control = QMGVAR(200To10000Step50_Slider);
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "2500";
            typeName = "NUMBER";
        };
        class EGVAR(Core,AIViewDistance) {
            property = QEGVAR(Core,AIViewDistance);
            displayName = "AI View Distance";
            tooltip = "Set the AI View Distance in meters. AI tends to see further than their limit due to fog at limit end";
            control = QMGVAR(200To10000Step50_Slider);
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "2500";
            typeName = "NUMBER";
        };
    };
};
