class UO_FW_StartInParachute  {
    displayName = "Start in Parachute Options";
    collapsed = 1;
    class Attributes  {
        class EGVAR(StartInParachute,Type) {
            displayName = "Start in Parachute";
            tooltip = "Set Parachute Type of a unit";
            property = QEGVAR(StartInParachute,Type);
            control = "UO_FW_StartInParachuteAttribute";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "0";
        };
        class EGVAR(StartInParachute,Altitude) {
            displayName = "Parachute Altitude";
            tooltip = "Altitude at which unit is parachuted";
            property = QEGVAR(StartInParachute,Altitude);
            control = "UO_FW_100To1000Step100_Slider";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            defaultValue = "300";
        };
        class EGVAR(StartInParachute,RandomAltitude) {
            displayName = "Parachute Randomized Altitude";
            tooltip = "Adds a random height to the normal parachute altitude";
            property = QEGVAR(StartInParachute,RandomAltitude);
            control = "UO_FW_100To500Step100_Slider";
            expression = UO_FW_ENTITY_EXPRESSION;
            condition = "objectControllable";
            validate = "number";
            defaultValue = "100";
        };
    };
};
