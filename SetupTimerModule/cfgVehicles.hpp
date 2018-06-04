
	class UO_SetupTimerModule: UO_Module
	{
		displayName = "Setup Timer Module"; // Name displayed in the menu
		scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
		// Name of function triggered once conditions are met
		function = "UO_fnc_LoadSetupTimer";
		// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		functionPriority = 3;

		// Categories collapsible in "Edit Attributes" window
			// Category class, can be anything
				class Arguments
				{
					class SideSelectArgument
				 {
					 displayName = "Side";
					 description = "Side on which to run the setup timer on";
					 typeName = "NUMBER";
					 class values
					  {
						 class West    {name = "West"; value = 1; default = 1;};
						 class East    {name = "East"; value = 2;};
						 class Ind    {name = "Independent"; value = 3;};
						 class Civ    {name = "Civilian"; value = 4;};
					 };
				 };
					// Arguments shared by specific module type (have to be mentioned in order to be present)
					// Module specific arguments
					class TimeArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						displayName = "Time"; // Argument label
						description = "Time in seconds"; // description description
						typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "300"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class MarkerArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						displayName = "Marker"; // Argument label
						description = "Name of the marker"; // description description
						typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = " "; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
				};

		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "United Operations Setup Timer Module"; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
		};
	};
