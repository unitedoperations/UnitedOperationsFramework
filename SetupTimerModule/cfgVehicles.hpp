
	class UO_SetupTimerModule: OlsenModule
	{
		displayName = "Setup Timer Module"; // Name displayed in the menu
		scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
		// Name of function triggered once conditions are met
		function = "UO_FW_fnc_EdenSetupTimer";
		// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		functionPriority = 3;
		is3DEN = 1;
		// Categories collapsible in "Edit Attributes" window
			// Category class, can be anything
			class Attributes 
			{
				class UO_FW_SetupTimer_SideSelect
				{
					displayName = "Side";
					tooltip = "Side on which to run the setup timer on";
					control = "Combo";
					typeName = "NUMBER";
					property = "UO_FW_SetupTimer_SideSelect";
					expression = "_this setVariable ['%s',_value];";
					validate = "none";
					class values
					{
						 class West    {name = "West"; value = 0; default = 0;};
						 class East    {name = "East"; value = 1;};
						 class Ind    {name = "Independent"; value = 2;};
						 class Civ    {name = "Civilian"; value = 3;};
						
					};
					defaultValue = "0";
				};

				class UO_FW_SetupTimer_Time
				{
					// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					displayName = "Time"; // Attribute label
					tooltip = "Time in seconds";
					control = "Edit";
					property = "UO_FW_SetupTimer_Time";
					defaultValue = "300"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					expression = "_this setVariable ['%s',_value];";
					validate = "number";
					
				};
				class UO_FW_SetupTimer_Marker
				{
					// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					displayName = "Marker"; // Attribute label
					tooltip = "Marker name without quotes";
					control = "Edit";
					property = "UO_FW_SetupTimer_Marker";
					defaultValue = "''"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					expression = "_this setVariable ['%s',_value];";
					validate = "none";
					
				};
				class UO_FW_SetupTimer_DeleteMarker
				{
					// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					displayName = "Delete marker"; // Attribute label
					tooltip = "Should the marker be deleted after it expires";
					control = "Checkbox";
					property = "UO_FW_SetupTimer_DeleteMarker";
					defaultValue = "true"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					typeName = "BOOL"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					expression = "_this setVariable ['%s',_value];";
					validate = "none";
					
				};
			};
		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "United Operations Setup Timer Module"; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
		};
	};
