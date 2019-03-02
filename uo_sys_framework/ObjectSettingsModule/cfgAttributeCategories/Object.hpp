class EGVAR(ObjectSettings,Attributes) {
    displayName = "Object Options";
    collapsed = 1;
    class Attributes {
        class EGVAR(ObjectSettings,Carryable) {
            displayName = "ACE Carryable";
            tooltip = "Restricts the ability to carry this object via ACE action.";
            property = QEGVAR(ObjectSettings,Carryable);
            control = "Checkbox";
            expression = "if (_value) then {[_this,false] call ace_dragging_fnc_setCarryable};";
            condition = "(1 - objectBrain) * (1 - objectVehicle)";
            defaultValue = "false";
        };
        class EGVAR(ObjectSettings,Draggable) {
            displayName = "ACE Draggable";
            tooltip = "Restricts the ability to carry this object via ACE action.";
            property = QEGVAR(ObjectSettings,Draggable);
            control = "Checkbox";
            expression = "if (_value) then {[_this,false] call ace_dragging_fnc_setDraggable};";
            condition = "(1 - objectBrain) * (1 - objectVehicle)";
            defaultValue = "false";
        };
    };
};
