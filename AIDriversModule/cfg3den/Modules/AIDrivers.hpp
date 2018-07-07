class UO_FW_AIDrivers_Settings
{
    displayName = "AI Drivers Settings";
    collapsed = 1;
    class Attributes
    {
        class UO_FW_AIDrivers_AllVehs
        {
            property = "UO_FW_AIDrivers_AllVehs";
            displayName = "All Vehicles";
            tooltip = "Give AI Driver actions to all vehicles at mission start";
            control = "CheckBox";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "false";
        };
		class UO_FW_AIDrivers_NVEnabled
        {
            property = "UO_FW_AIDrivers_NVEnabled";
            displayName = "Night Vision";
            tooltip = "Whether the player can use NVGs in AI Driver view";
            control = "CheckBox";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "false";
        };
		class UO_FW_AIDrivers_FlipEnabled
        {
            property = "UO_FW_AIDrivers_FlipEnabled";
            displayName = "Flip Vehicle";
            tooltip = "Whether the player can flip the vehicle via ACE action";
            control = "CheckBox";
            expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "true";
        };
    };
};