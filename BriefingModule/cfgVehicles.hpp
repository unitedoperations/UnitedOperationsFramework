
	class UO_BriefingModule: UO_Module
	{
		displayName = "Briefing Module"; // Name displayed in the menu
		scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
		// Name of function triggered once conditions are met
		function = "UO_fnc_LoadBriefing";
		// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		functionPriority = 3;

		// Categories collapsible in "Edit Attributes" window
			// Category class, can be anything
				class Arguments
				{
					// Arguments shared by specific module type (have to be mentioned in order to be present)
					// Module specific arguments
					class BriefingFilePathArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						displayName = "Filepath to Briefing"; // Argument label
						description = "Filepath to the Briefing file from the mission root folder"; // description description
						typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = """briefing.sqf"""; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
				};

		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "United Operations Briefing Module"; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
		};
	};
