class UO_FW_StartText
{
    displayName = "Start Text Settings";
    collapsed = 1;
    class Attributes
    {
        class UO_FW_StartText_Enabled
        {
            property = "UO_FW_StartText_Enabled";
            displayName = "Start Text";
            tooltip = "Enables Start Text";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value];";
            defaultValue = "true";
            typeName = "BOOL";

        };
        class UO_FW_StartText_TimeSelect
		{
			displayName = "Time display";
			tooltip = "What kind of Time should be displayed. Default Date and Time";
			control = "Combo";
			typeName = "NUMBER";
			property = "UO_FW_StartText_TimeSelect";
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";
			class values
			{
				class Date    {name = "Date"; value = 0;};
				class Time    {name = "Time"; value = 1;};
				class DateTime    {name = "Date and Time"; value = 2; default = 2;};

			};
			defaultValue = "2";
		};

		class UO_FW_StartText_BluforTitleQuote
		{
			// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			displayName = "Blufor Title Quote"; // Attribute label
			tooltip = "Title Quote of the Blufor Start Text. Empty for none";
			control = "Edit";
			property = "UO_FW_StartText_BluforTitleQuote";
			defaultValue = "''"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
			typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";

		};
		class UO_FW_StartText_BluforText
		{
			// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			displayName = "Blufor Text"; // Attribute label
			tooltip = "Text of the Blufor Start Text. Empty for none";
			control = "Edit";
			property = "UO_FW_StartText_BluforText";
			defaultValue = "''"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
			typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";

		};
		class UO_FW_StartText_OpforTitleQuote
		{
			// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			displayName = "Opfor Title Quote"; // Attribute label
			tooltip = "Title Quote of the Opfor Start Text. Empty for none";
			control = "Edit";
			property = "UO_FW_StartText_OpforTitleQuote";
			defaultValue = "''"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
			typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";

		};
		class UO_FW_StartText_OpforText
		{
			// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			displayName = "Opfor Text"; // Attribute label
			tooltip = "Text of the Opfor Start Text. Empty for none";
			control = "Edit";
			property = "UO_FW_StartText_OpforText";
			defaultValue = "''"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
			typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";

		};
		class UO_FW_StartText_IndependentTitleQuote
		{
			// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			displayName = "Independent Title Quote"; // Attribute label
			tooltip = "Title Quote of the Independent Start Text. Empty for none";
			control = "Edit";
			property = "UO_FW_StartText_IndependentTitleQuote";
			defaultValue = "''"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
			typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";

		};
		class UO_FW_StartText_IndependentText
		{
			// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			displayName = "Independent Text"; // At	tribute label
			tooltip = "Text of the Independent Start Text. Empty for none";
			control = "Edit";
			property = "UO_FW_StartText_IndependentText";
			defaultValue = "''"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
			typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";

		};
		class UO_FW_StartText_CivilianTitleQuote
		{
			// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			displayName = "Civilian Title Quote"; // Attribute label
			tooltip = "Title Quote of the Civilian Start Text. Empty for none";
			control = "Edit";
			property = "UO_FW_StartText_CivilianTitleQuote";
			defaultValue = "''"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
			typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";

		};
		class UO_FW_StartText_CivilianText
		{
			// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			displayName = "Civilian Text"; // At	tribute label
			tooltip = "Text of the Civilian Start Text. Empty for none";
			control = "Edit";
			property = "UO_FW_StartText_CivilianText";
			defaultValue = "''"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
			typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";

		};
    };
};
