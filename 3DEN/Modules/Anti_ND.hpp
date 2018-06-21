class UO_FW_Anti_ND
{
    displayName = "Anti ND";
    collapsed = 1;
    class Attributes
    {
        class UO_FW_Anti_ND_Enabled
        {
            property = "UO_FW_Anti_ND_Enabled";
            displayName = "Anti ND Enabled";
            tooltip = "Toggle activation";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "true";
            
        };
		class UO_FW_Anti_ND_Time
        {
            property = "UO_FW_Anti_ND_Time";
            displayName = "Time";
            tooltip = "Time in seconds after spawn after which Anti ND functionality is disabled";
            control = "EditShort";
            validate = "number";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "30";
            
        };
		class UO_FW_Anti_ND_Distance
        {
            property = "UO_FW_Anti_ND_Distance";
            displayName = "Distance";
            tooltip = "Distance in meters at which Anti ND functionality is disabled";
            control = "EditShort";
            validate = "number";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "200";
            
        };
    };
};