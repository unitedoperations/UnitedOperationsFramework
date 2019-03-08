class UO_FW_TeamColourOptions {
    displayName = "Team Colour Options";
    collapsed = 1;
    class Attributes {
        class EGVAR(TeamColour,Colour) {
            displayName = "Team Colour";
            tooltip = "Set Player Colour";
            property = QEGVAR(TeamColour,Colour);
            control = QEGVAR(TeamColour,ColourAttribute);
            typeName = "STRING";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "'None'";
        };
    };
};
