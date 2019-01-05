class UO_FW_ACREOptions {
	displayName = "ACRE Options";
	collapsed = 1;
	class Attributes
	{
		class UO_FW_ACRE_UNITSETTINGS_ENABLE
		{
			property = "UO_FW_ACRE_UNITSETTINGS_ENABLE";
			displayName = "Enable ACRE Unit Settings";
			tooltip = "Enables Framework ACRE Settings on this unit";
			control = "UO_FW_CheckBoxStatePlayerOnlyCategory";
			expression = "_this setVariable ['%s',_value,true];";
			condition = "objectControllable";
			defaultValue = "false";
		};
		class UO_FW_ACRE_SR_RADIO_ENABLED {
			property = "UO_FW_ACRE_SR_RADIO_ENABLED";
			displayName = "Give Short Range Radio";
			tooltip = "Gives this unit a short range radio defined in ACRE settings";
			control = "CheckBox";
			expression = "_this setVariable ['%s',_value,true];";
			condition = "objectControllable";
			defaultValue = "false";
		};
		class UO_FW_ACRE_SR_RADIO_CHANNEL {
			property = "UO_FW_ACRE_SR_RADIO_CHANNEL";
			displayName = "Short Range Radio Channel";
			tooltip = "Sets the short range radio channel of this unit";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value,true];";
			condition = "objectControllable";
			defaultValue = "1";
		};
		class UO_FW_ACRE_SR_RADIO_EAR {
			property = "UO_FW_ACRE_SR_RADIO_EAR";
			displayName = "Short Range Radio Ear";
			tooltip = "Sets the short range radio earpiece setting";
			control = "UO_FW_ACRE_EarSetting_SR";
			expression = "_this setVariable ['%s',_value,true];";
			condition = "objectControllable";
			defaultValue = "0";
		};
		class UO_FW_ACRE_LR_RADIO_ENABLED {
			property = "UO_FW_ACRE_LR_RADIO_ENABLED";
			displayName = "Give Long Range Radio";
			tooltip = "Gives this unit a long range radio defined in ACRE settings";
			control = "CheckBox";
			expression = "_this setVariable ['%s',_value,true];";
			condition = "objectControllable";
			defaultValue = "false";
		};
		class UO_FW_ACRE_LR_RADIO_CHANNEL {
			property = "UO_FW_ACRE_LR_RADIO_CHANNEL";
			displayName = "Long Range Radio Channel";
			tooltip = "Sets the long range radio channel of this unit";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value,true];";
			condition = "objectControllable";
			defaultValue = "1";
		};
		class UO_FW_ACRE_LR_RADIO_EAR {
			property = "UO_FW_ACRE_LR_RADIO_EAR";
			displayName = "Long Range Radio Ear";
			tooltip = "Sets the long range radio earpiece setting";
			control = "UO_FW_ACRE_EarSetting_LR";
			expression = "_this setVariable ['%s',_value,true];";
			condition = "objectControllable";
			defaultValue = "0";
		};
		class UO_FW_ACRE_PK_RADIO_ENABLED {
			property = "UO_FW_ACRE_PK_RADIO_ENABLED";
			displayName = "Give Pack Radio";
			tooltip = "Gives this unit a long range pack radio defined in ACRE settings";
			control = "CheckBox";
			expression = "_this setVariable ['%s',_value,true];";
			condition = "objectControllable";
			defaultValue = "false";
		};
		class UO_FW_ACRE_PK_RADIO_CHANNEL {
			property = "UO_FW_ACRE_PK_RADIO_CHANNEL";
			displayName = "Pack Radio Channel";
			tooltip = "Sets the long range pack radio channel of this unit";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value,true];";
			condition = "objectControllable";
			defaultValue = "1";
		};
		class UO_FW_ACRE_PK_RADIO_EAR {
			property = "UO_FW_ACRE_PK_RADIO_EAR";
			displayName = "Pack Radio Ear";
			tooltip = "Sets the long range pack radio earpiece setting";
			control = "UO_FW_ACRE_EarSetting_PK";
			expression = "_this setVariable ['%s',_value,true];";
			condition = "objectControllable";
			defaultValue = "0";
		};
	};
};
