class UO_FW_EndConditions_Custom_File {
    displayName = "Custom File";
    collapsed = 0;
    class Attributes {
		class UO_FW_EndConditions_File {
            property = "UO_FW_EndConditions_File";
            displayName = "Custom End Condition File";
            tooltip = "Loads file on server as end conditions instead of framework category settings.";
            control = "CheckboxState";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
		class UO_FW_EndConditions_File_Path {
            property = "UO_FW_EndConditions_File_Path";
            displayName = "Path to End Condition File";
            tooltip = "Path to End Condition File";
			control = "Edit";
            validate = "STRING";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
	};
};
