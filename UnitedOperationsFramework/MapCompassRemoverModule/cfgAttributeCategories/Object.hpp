class UO_FW_MapCompassRemoverOptions 
{
	displayName = "Remove Compass and Map Options"; 
	collapsed = 1;
	class Attributes 
	{
		class UO_FW_RemoveMap
		{
			displayName = "Remove map after briefing";
			tooltip = "If ticked the map for the unit will be removed after the briefing is done!";
			property = "UO_FW_RemoveMap";
			control = "Checkbox";
			expression = "_this setVariable ['%s',_value,true];";
			condition = "objectControllable";
			defaultValue = "false";
		};
		class UO_FW_RemoveCompass
		{
			displayName = "Remove compass after briefing";
			tooltip = "If ticked the compass for the unit will be removed after the briefing is done!";
			property = "UO_FW_RemoveCompass";
			control = "Checkbox";
			expression = "_this setVariable ['%s',_value,true];";
			condition = "objectControllable";
			defaultValue = "false";
		};
	};
};
