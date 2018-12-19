class Timelimit
{
    displayName = "Timelimit Settings";
    collapsed = 0;
    class Attributes
    {
        class UO_FW_Timelimit_Enabled
        {
            property = "UO_FW_Timelimit_Enabled";
            displayName = "Mission Time Limit";
            tooltip = "Enables mission time limit";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "false";
        };
        class UO_FW_Timelimit
        {
            property = "UO_FW_Timelimit";
            displayName = "Time Limit";
            tooltip = "Ends mission after this time has been reached. Time in minutes";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
			validate = "number";
            defaultValue = "30";
        };
		class UO_FW_Timelimit_Message
        {
            property = "UO_FW_Timelimit_Message";
            displayName = "Time Limit Message";
            tooltip = "Message displayed on time limit reached";
            control = "Edit";
			validate = "string";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "'Time Limit Reached!'";
        };
    };
};