class UO_FW_TeamColourOptions {
	displayName = "Team Colour Options";
	collapsed = 1;
	class Attributes {
		class UO_FW_TeamColour {
			displayName = "Team Colour";
			tooltip = "Set Player Colour";
			property = "UO_FW_TeamColour";
			control = "UO_FW_TeamColourAttribute";
			typeName = "STRING";
			expression = "if !(is3DEN) then {_propertyName = '%s'; [_this, _propertyName, _value, false] call UO_FW_fnc_setInitVar;};";
			condition = "objectControllable ";
			defaultValue = "'None'";
		};
	};
};
