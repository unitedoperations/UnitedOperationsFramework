class UO_FW_AIDriversOptions {
	displayName = "AI Driver Options";
	collapsed = 1;
	class Attributes {
		class UO_FW_AIDriverVeh_Enabled
		{
			displayName = "AI Driver";
			tooltip = "Enable AI driver for this vehicle";
			property = "UO_FW_AIDriverVeh_Enabled";
			control = "CheckBox";
			expression = "_this setVariable ['%s',_value,true]; if (_value) then {[{time > 1},{[_this] call UO_FW_fnc_aiDriversVehInit;},_this] call CBA_fnc_WaitUntilAndExecute;};";
			condition = "objectVehicle";
			defaultValue = "false";
		};
		class UO_FW_AIDriversVeh_NVEnabled
    {
        property = "UO_FW_AIDriversVeh_NVEnabled";
        displayName = "Night Vision";
        tooltip = "Whether the player can use NVGs in AI Driver view";
        control = "CheckBox";
				condition = "objectVehicle";
        expression="_this setVariable ['%s',_value,true];";
        defaultValue = "false";
    };
		class UO_FW_AIDriversVeh_FlipEnabled
    {
        property = "UO_FW_AIDriversVeh_FlipEnabled";
        displayName = "Flip Vehicle";
        tooltip = "Whether the player can flip the vehicle via ACE action";
        control = "CheckBox";
				condition = "objectVehicle";
        expression = "_this setVariable ['%s',_value,true];";
        defaultValue = "true";
    };
	};
};
