class UO_FW_MapCompassRemoverOptions_AI {
	displayName = "Remove Compass and Map Options";
	collapsed = 1;
	class Attributes {
		class UO_FW_KeepMapAI {
			displayName = "Keep map after briefing";
			tooltip = "If ticked the map for the unit will be kept even if the module setting to remove all AI maps is enabled";
			property = "UO_FW_KeepMapAI";
			control = "UO_FW_CheckBoxAIOnlyCategory";
			expression = UO_FW_ENTITY_EXPRESSION;
			condition = "objectControllable";
			defaultValue = "false";
		};
		class UO_FW_KeepCompassAI {
			displayName = "Keep compass after briefing";
			tooltip = "If ticked the compass for the unit will be kept even if the module setting to remove all AI compasses is enabled";
			property = "UO_FW_KeepCompassAI";
			control = "Checkbox";
			expression = UO_FW_ENTITY_EXPRESSION;
			condition = "objectControllable";
			defaultValue = "false";
		};
		class UO_FW_RemoveMapAI {
			displayName = "Remove map after briefing";
			tooltip = "If ticked the map for the unit will be removed after the briefing is done!";
			property = "UO_FW_RemoveMapAI";
			control = "UO_FW_CheckBoxPlayerOnlyCategory";
			expression = UO_FW_ENTITY_EXPRESSION;
			condition = "objectControllable";
			defaultValue = "false";
		};
		class UO_FW_RemoveCompassAI {
			displayName = "Remove compass after briefing";
			tooltip = "If ticked the compass for the unit will be removed after the briefing is done!";
			property = "UO_FW_RemoveCompassAI";
			control = "Checkbox";
			expression = UO_FW_ENTITY_EXPRESSION;
			condition = "objectControllable";
			defaultValue = "false";
		};
	};
};


class UO_FW_MapCompassRemoverOptions_Player {
	displayName = "Remove Compass and Map Options";
	collapsed = 1;
	class Attributes {
		class UO_FW_RemoveMap {
			displayName = "Remove map after briefing";
			tooltip = "If ticked the map for the unit will be removed after the briefing is done!";
			property = "UO_FW_RemoveMap";
			control = "UO_FW_CheckBoxPlayerOnlyCategory";
			expression = UO_FW_ENTITY_EXPRESSION;
			condition = "objectControllable";
			defaultValue = "false";
		};
		class UO_FW_RemoveCompass {
			displayName = "Remove compass after briefing";
			tooltip = "If ticked the compass for the unit will be removed after the briefing is done!";
			property = "UO_FW_RemoveCompass";
			control = "Checkbox";
			expression = UO_FW_ENTITY_EXPRESSION;
			condition = "objectControllable";
			defaultValue = "false";
		};
	};
};
