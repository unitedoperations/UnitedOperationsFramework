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
			expression = "_this setVariable ['%s',_teamvalue,true];";
			//expression = "_this setVariable ['%s',_value,true];";
			condition = "objectControllable ";
			defaultValue = "'None'";
		};
	};
};
