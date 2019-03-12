class EGVAR(StartText,Category) {
    displayName = "Start Text Settings";
    collapsed = 1;
    class Attributes {
        class EGVAR(StartText,Enabled) {
            property = QEGVAR(StartText,Enabled);
            displayName = "Start Text";
            tooltip = "Enables Start Text";
            control = "CheckboxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
            typeName = "BOOL";
        };
        class EGVAR(StartText,TimeSelect) {
            displayName = "Time display";
            tooltip = "What kind of Time should be displayed. Default Date and Time";
            control = "Combo";
            typeName = "NUMBER";
            property = QEGVAR(StartText,TimeSelect);
            expression = SCENARIO_EXPRESSION;
            validate = "none";
            class values {
                class Date    {name = "Date"; value = 0;};
                class Time    {name = "Time"; value = 1;};
                class DateTime    {name = "Date and Time"; value = 2; default = 2;};
            };
            defaultValue = "2";
        };
        class EGVAR(StartText,TitleQuote_Blufor) {
            // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
            displayName = "Blufor Title Quote"; // Attribute label
            tooltip = "Title Quote of the Blufor Start Text. Empty for none";
            control = "Edit";
            property = QEGVAR(StartText,TitleQuote_Blufor);
            defaultValue = "''"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
            typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
            expression = SCENARIO_EXPRESSION;
            validate = "none";
        };
        class EGVAR(StartText,Text_Blufor) {
            // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
            displayName = "Blufor Text"; // Attribute label
            tooltip = "Text of the Blufor Start Text. Empty for none";
            control = "Edit";
            property = QEGVAR(StartText,Text_Blufor);
            defaultValue = "''"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
            typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
            expression = SCENARIO_EXPRESSION;
            validate = "none";
        };
        class EGVAR(StartText,TitleQuote_Opfor) {
            // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
            displayName = "Opfor Title Quote"; // Attribute label
            tooltip = "Title Quote of the Opfor Start Text. Empty for none";
            control = "Edit";
            property = QEGVAR(StartText,TitleQuote_Opfor);
            defaultValue = "''"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
            typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
            expression = SCENARIO_EXPRESSION;
            validate = "none";
        };
        class EGVAR(StartText,Text_Opfor) {
            // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
            displayName = "Opfor Text"; // Attribute label
            tooltip = "Text of the Opfor Start Text. Empty for none";
            control = "Edit";
            property = QEGVAR(StartText,Text_Opfor);
            defaultValue = "''"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
            typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
            expression = SCENARIO_EXPRESSION;
            validate = "none";
        };
        class EGVAR(StartText,TitleQuote_Indfor) {
            // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
            displayName = "Independent Title Quote"; // Attribute label
            tooltip = "Title Quote of the Independent Start Text. Empty for none";
            control = "Edit";
            property = QEGVAR(StartText,TitleQuote_Indfor);
            defaultValue = "''"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
            typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
            expression = SCENARIO_EXPRESSION;
            validate = "none";
        };
        class EGVAR(StartText,Text_Indfor) {
            // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
            displayName = "Independent Text"; // At    tribute label
            tooltip = "Text of the Independent Start Text. Empty for none";
            control = "Edit";
            property = QEGVAR(StartText,Text_Indfor);
            defaultValue = "''"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
            typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
            expression = SCENARIO_EXPRESSION;
            validate = "none";
        };
        class EGVAR(StartText,TitleQuote_Civilian) {
            // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
            displayName = "Civilian Title Quote"; // Attribute label
            tooltip = "Title Quote of the Civilian Start Text. Empty for none";
            control = "Edit";
            property = QEGVAR(StartText,TitleQuote_Civilian);
            defaultValue = "''"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
            typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
            expression = SCENARIO_EXPRESSION;
            validate = "none";
        };
        class EGVAR(StartText,Text_Civilian) {
            // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
            displayName = "Civilian Text"; // At    tribute label
            tooltip = "Text of the Civilian Start Text. Empty for none";
            control = "Edit";
            property = QEGVAR(StartText,Text_Civilian);
            defaultValue = "''"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
            typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
            expression = SCENARIO_EXPRESSION;
            validate = "none";
        };
    };
};
