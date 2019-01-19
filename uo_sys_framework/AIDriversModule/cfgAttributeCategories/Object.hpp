class UO_FW_AIDrivers_Options {
	displayName = "AI Driver Options";
	collapsed = 1;
	class Attributes {
		class UO_FW_AIDriverVeh_Enabled {
			displayName = "AI Driver";
			tooltip = "Enable AI driver for this vehicle";
			property = "UO_FW_AIDriverVeh_Enabled";
			control = "CheckBox";
			expression = UO_FW_ENTITY_DELAYED_FNC_EXPRESSION(aiDriversVehInit);
			condition = "objectVehicle";
			defaultValue = "false";
		};
		class UO_FW_AIDriversVeh_NVEnabled {
			property = "UO_FW_AIDriversVeh_NVEnabled";
			displayName = "Night Vision";
			tooltip = "Whether the player can use NVGs in AI Driver view";
			control = "CheckBox";
			condition = "objectVehicle";
			expression = UO_FW_ENTITY_EXPRESSION;
			defaultValue = "false";
    	};
		class UO_FW_AIDriversVeh_FlipEnabled {
			property = "UO_FW_AIDriversVeh_FlipEnabled";
			displayName = "Flip Vehicle";
			tooltip = "Whether the player can flip the vehicle via ACE action";
			control = "CheckBox";
			condition = "objectVehicle";
			expression = UO_FW_ENTITY_EXPRESSION;
			defaultValue = "true";
    	};
	};
};
