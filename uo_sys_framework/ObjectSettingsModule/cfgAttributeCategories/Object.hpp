class UO_FW_Object_Settings_Attributes {
    displayName = "Object Options";
    collapsed = 1;
    class Attributes {
        class UO_FW_Object_Settings_Carryable {
            displayName = "ACE Carryable";
            tooltip = "Restricts the ability to carry this object via ACE action.";
            property = "UO_FW_Object_Settings_Carryable";
            control = "Checkbox";
			expression = "if (_value) then {[_this,false] call ace_dragging_fnc_setCarryable};"
			condition = "(1 - objectBrain) * (1 - objectVehicle)";
            defaultValue = "false";
        };
		class UO_FW_Object_Settings_Dragable {
            displayName = "ACE Dragable";
            tooltip = "Restricts the ability to carry this object via ACE action.";
            property = "UO_FW_Object_Settings_Dragable";
            control = "Checkbox";
			expression = "if (_value) then {[_this,false] call ace_dragging_fnc_setDraggable};"
			condition = "(1 - objectBrain) * (1 - objectVehicle)";
            defaultValue = "false";
        };
    };
};
