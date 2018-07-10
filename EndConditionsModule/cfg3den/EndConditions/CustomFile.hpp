class Custom_File
{
    displayName = "Custom File";
<<<<<<< HEAD
    collapsed = 1;
=======
    collapsed = 0;
>>>>>>> f75aeeae1c4f987e0e243f43ae618bbedbe3dec7
    class Attributes
    {
		class UO_FW_ENDCONDITIONS_FILE
        {
            property = "UO_FW_ENDCONDITIONS_FILE";
            displayName = "Custom End Condition File";
<<<<<<< HEAD
            tooltip = "Loads file on server as end conditions";
=======
            tooltip = "Loads file on server as end conditions instead of framework category settings.";
>>>>>>> f75aeeae1c4f987e0e243f43ae618bbedbe3dec7
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