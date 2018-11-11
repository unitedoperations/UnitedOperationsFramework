class UO_FW_AIDriversOptions {
	displayName = "AI Driver Options"; 
	collapsed = 1;
	class Attributes {
		class UO_FW_AIDriverVeh_Enabled {
			displayName = "AI Driver";
			tooltip = "Enable AI driver for this vehicle";
			property = "UO_FW_AIDriverVeh_Enabled";
			control = "CheckBox";
			expression = "_this setVariable ['%s',_value,true];";
			condition = "objectVehicle";
			defaultValue = "false";
		};
	};
};
