class UO_FW_CIVILIAN_ACRE_RadioTypes_CAT {
    displayName = "Radio Configuration";
    collapsed = 0;
    class Attributes {
        class UO_FW_ACRE_CIVILIAN_SR_Type {
            property = "UO_FW_ACRE_CIVILIAN_SR_Type";
            displayName = "Short Range Radio Type";
            tooltip = "Sets the short range radio type for the side";
            control = "UO_FW_ACRE_SR_Select";
            expression = "missionNamespace setVariable ['%s', _value];";
            defaultValue = "0";
        };
		class UO_FW_ACRE_CIVILIAN_LR_Type {
            property = "UO_FW_ACRE_CIVILIAN_LR_Type";
            displayName = "Long Range Radio Type";
            tooltip = "Sets the long range radio type for the side";
            control = "UO_FW_ACRE_LR_Select";
            expression = "missionNamespace setVariable ['%s', _value];";
            defaultValue = "0";
        };
		class UO_FW_ACRE_CIVILIAN_PK_Type {
            property = "UO_FW_ACRE_CIVILIAN_PK_Type";
            displayName = "Long Range Pack Radio Type";
            tooltip = "Sets the long range pack radio type for the side";
            control = "UO_FW_ACRE_PK_Select";
            expression = "missionNamespace setVariable ['%s', _value];";
            defaultValue = "0";
        };
	};
};

class UO_FW_CIVILIAN_ACRE_SETTINGS_RADIONET_CAT {
    displayName = "Radio Net Configuration";
    collapsed = 0;
    class Attributes {
		class UO_FW_ACRE_CIVILIAN_RADIONET_Enabled {
            property = "UO_FW_ACRE_CIVILIAN_RADIONET_Enabled";
            displayName = "Enable Radio Net Channel Names";
			control = "CheckBoxState";
            expression = "missionNamespace setVariable ['%s', _value];";
            defaultValue = "false";
        };
        class UO_FW_ACRE_CIVILIAN_RADIONET_NAME1 {
            property = "UO_FW_ACRE_CIVILIAN_RADIONET_NAME1";
            displayName = "Channel 1 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = "missionNamespace setVariable ['%s', _value];";
            defaultValue = "'PLTNET 1'";
        };
		class UO_FW_ACRE_CIVILIAN_RADIONET_NAME2 {
            property = "UO_FW_ACRE_CIVILIAN_RADIONET_NAME2";
            displayName = "Channel 2 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = "missionNamespace setVariable ['%s', _value];";
            defaultValue = "'PLTNET 2'";
        };
		class UO_FW_ACRE_CIVILIAN_RADIONET_NAME3 {
            property = "UO_FW_ACRE_CIVILIAN_RADIONET_NAME3";
            displayName = "Channel 3 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = "missionNamespace setVariable ['%s', _value];";
            defaultValue = "'PLTNET 3'";
        };
		class UO_FW_ACRE_CIVILIAN_RADIONET_NAME4 {
            property = "UO_FW_ACRE_CIVILIAN_RADIONET_NAME4";
            displayName = "Channel 4 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = "missionNamespace setVariable ['%s', _value];";
            defaultValue = "'PLTNET 4'";
        };
		class UO_FW_ACRE_CIVILIAN_RADIONET_NAME5 {
            property = "UO_FW_ACRE_CIVILIAN_RADIONET_NAME5";
            displayName = "Channel 5 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = "missionNamespace setVariable ['%s', _value];";
            defaultValue = "'COY'";
        };
		class UO_FW_ACRE_CIVILIAN_RADIONET_NAME6 {
            property = "UO_FW_ACRE_CIVILIAN_RADIONET_NAME6";
            displayName = "Channel 6 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = "missionNamespace setVariable ['%s', _value];";
            defaultValue = "'CAS'";
        };
		class UO_FW_ACRE_CIVILIAN_RADIONET_NAME7 {
            property = "UO_FW_ACRE_CIVILIAN_RADIONET_NAME7";
            displayName = "Channel 7 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = "missionNamespace setVariable ['%s', _value];";
            defaultValue = "'FIRES'";
        };
	};
};

class UO_FW_CIVILIAN_ACRE_SETTINGS_BABEL_CAT {
    displayName = "Babel Configuration";
    collapsed = 1;
    class Attributes {
        class UO_FW_ACRE_CIVILIAN_BABEL_Enabled {
            property = "UO_FW_ACRE_CIVILIAN_BABEL_Enabled";
            displayName = "Enable Babel Languages";
			control = "CheckBoxState";
            expression = "missionNamespace setVariable ['%s', _value];";
            defaultValue = "false";
        };
		class UO_FW_ACRE_CIVILIAN_BABEL_EN {
            property = "UO_FW_ACRE_CIVILIAN_BABEL_EN";
            displayName = "English";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = "missionNamespace setVariable ['%s', _value];";
            defaultValue = "true";
        };
		class UO_FW_ACRE_CIVILIAN_BABEL_RU {
            property = "UO_FW_ACRE_CIVILIAN_BABEL_RU";
            displayName = "Russian";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = "missionNamespace setVariable ['%s', _value];";
            defaultValue = "false";
        };
		class UO_FW_ACRE_CIVILIAN_BABEL_FR {
            property = "UO_FW_ACRE_CIVILIAN_BABEL_FR";
            displayName = "French";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = "missionNamespace setVariable ['%s', _value];";
            defaultValue = "false";
        };
		class UO_FW_ACRE_CIVILIAN_BABEL_AR {
            property = "UO_FW_ACRE_CIVILIAN_BABEL_AR";
            displayName = "Arabic";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = "missionNamespace setVariable ['%s', _value];";
            defaultValue = "false";
        };
		class UO_FW_ACRE_CIVILIAN_BABEL_GK {
            property = "UO_FW_ACRE_CIVILIAN_BABEL_GK";
            displayName = "Greek";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = "missionNamespace setVariable ['%s', _value];";
            defaultValue = "false";
        };
		class UO_FW_ACRE_CIVILIAN_BABEL_Custom {
            property = "UO_FW_ACRE_CIVILIAN_BABEL_Custom";
            displayName = "Custom Language";
            tooltip = "Define a custom language for this side";
            control = "EditShort";
            expression = "missionNamespace setVariable ['%s', _value];";
            defaultValue = "''";
        };
		class UO_FW_ACRE_CIVILIAN_BABEL_Custom2 {
            property = "UO_FW_ACRE_CIVILIAN_BABEL_Custom2";
            displayName = "Custom Language 2";
            tooltip = "Define a custom language for this side";
            control = "EditShort";
            expression = "missionNamespace setVariable ['%s', _value];";
            defaultValue = "''";
        };
    };
};
