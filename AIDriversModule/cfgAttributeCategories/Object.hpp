class UO_FW_AIDriversOptions {
	displayName = "AI Driver Options"; 
	collapsed = 1;
	class Attributes {
		class UO_FW_AIDriverVeh_Enabled {
			displayName = "AI Driver";
			tooltip = "Enable AI driver for this vehicle";
			property = "UO_FW_AIDriverVeh_Enabled";
			control = "CheckBox";
			expression = "_this setVariable ['%s',_value,true]; if ((_value) && (!getMissionConfigValue [""UO_FW_AIDrivers_AllVehs"",false])) then {[_this] call UO_FW_fnc_aiDriversEnableAIDriver};";
			condition = "objectVehicle";
			defaultValue = "false";
		};
	};
};
