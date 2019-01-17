class UO_FW_MACR {
    displayName = "Map and Compass Remover Settings";
    collapsed = 1;
    class Attributes {
        class UO_FW_MACR_MAP_ALL {
			property = "UO_FW_MACR_MAP_ALL";
			displayName = "Remove Map";
			tooltip = "Remove map from all AI after briefing";
			control = "Checkbox";
			expression = "missionNamespace setVariable ['%s', _value];";
			defaultValue = "false";
        };
		class UO_FW_MACR_COMPASS_ALL {
			property = "UO_FW_MACR_COMPASS_ALL";
			displayName = "Remove Compass";
			tooltip = "Remove compass from all AI after briefing";
			control = "Checkbox";
			expression = "missionNamespace setVariable ['%s', _value];";
			defaultValue = "false";
        };
    };
};
