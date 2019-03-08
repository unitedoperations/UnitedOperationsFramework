class EGVAR(StartInParachute,Category)  {
    displayName = "Start in Parachute Options";
    collapsed = 1;
    class Attributes  {
        class EGVAR(StartInParachute,Type) {
            displayName = "Start in Parachute";
            tooltip = "Set Parachute Type of a unit";
            property = QEGVAR(StartInParachute,Type);
            control = QEGVAR(StartInParachute,TypeAttribute);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "0";
        };
        class EGVAR(StartInParachute,Altitude) {
            displayName = "Parachute Altitude";
            tooltip = "Altitude at which unit is parachuted";
            property = QEGVAR(StartInParachute,Altitude);
            control = QMGVAR(100To1000Step100_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            defaultValue = "300";
        };
        class EGVAR(StartInParachute,RandomAltitude) {
            displayName = "Parachute Randomized Altitude";
            tooltip = "Adds a random height to the normal parachute altitude";
            property = QEGVAR(StartInParachute,RandomAltitude);
            control = QMGVAR(100To500Step100_Slider);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            defaultValue = "100";
        };
    };
};
