
	class UO_StartTextModule: UO_Module
	{

		displayName = "Start Text Module"; // Name displayed in the menu

		// Name of function triggered once conditions are met
		function = "UO_fnc_LoadStartText";
		// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		functionPriority = 3;
 		scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.

		// Categories collapsible in "Edit Attributes" window
			// Category class, can be anything
			// Categories collapsible in "Edit Attributes" window
				class Arguments
				{
					class TimeSelectArgument
					 {
						 displayName = "Time display";
						 description = "What kind of Time should be displayed";
						 typeName = "NUMBER";
						 class values
						  {
							 class Date    {name = "Date"; value = 0; default = 0;};
							 class Time    {name = "Time"; value = 1;};
							 class DateTime    {name = "Date and Time"; value = 2;};
						 };
					 };

  					  class BluforTitleQuoteArgument
  					  {
  						  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
  						  displayName = "Blufor Title Qote"; // Argument label
  						  description = "Title Quote of the Start Text";
  						  typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
  						  defaultValue = ""; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
  					  };
					  class BluforTextArgument
					 {
						 // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						 displayName = "Blufor Text"; // Argument label
						 description = "Text of the Start Text";
						 typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						 defaultValue = ""; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					 };
					 class OpforTitleQuoteArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						displayName = "Opfor Title Qote"; // Argument label
						description = "Title Quote of the Start Text";
						typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = ""; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class OpforTextArgument
				   {
					   // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					   displayName = "Opfor Text"; // Argument label
					   description = "Text of the Start Text";
					   typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					   defaultValue = ""; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
				   };
				   class IndforTitleQuoteArgument
				   {
					   // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					   displayName = "Indfor Title Qote"; // Argument label
					   description = "Title Quote of the Start Text";
					   typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					   defaultValue = ""; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
				   };
				   class IndforTextArgument
				  {
					  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					  displayName = "Indfor Text"; // Argument label
					  description = "Text of the Start Text";
					  typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					  defaultValue = ""; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
				  };
				  class CivilianTitleQuoteArgument
				  {
					  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					  displayName = "Civilian Title Qote"; // Argument label
					  description = "Title Quote of the Start Text";
					  typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					  defaultValue = ""; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
				  };
				  class CivilianTextArgument
				 {
					 // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					 displayName = "Civilian Text"; // Argument label
					 description = "Text of the Start Text";
					 typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					 defaultValue = ""; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
				 };


				};
		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "United Operations Framework Start Text Module"; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
		};
	};
