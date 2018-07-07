class Custom_File
{
    displayName = "Custom File";
    collapsed = 0;
    class Attributes
    {
		class UO_FW_ENDCONDITIONS_FILE
        {
            property = "UO_FW_ENDCONDITIONS_FILE";
            displayName = "Custom End Condition File";
            tooltip = "Loads file on server as end conditions instead of framework category settings.";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "false";
        };
		class UO_FW_ENDCONDITIONS_FILE_PATH
        {
            property = "UO_FW_ENDCONDITIONS_FILE_PATH";
            displayName = "Path to End Condition File";
            tooltip = "Path to End Condition File";
			control = "Edit";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
	};
};