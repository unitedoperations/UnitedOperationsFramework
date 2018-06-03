
	class UO_AceMedicalModule: UO_Module
	{

		displayName = "Ace Medical Module"; // Name displayed in the menu

		// Name of function triggered once conditions are met
		function = "UO_fnc_LoadMedical";
		// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		functionPriority = 3;
 		scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.

		// Categories collapsible in "Edit Attributes" window
			// Category class, can be anything
			// Categories collapsible in "Edit Attributes" window
				class Arguments
				{
					class ReviveArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						displayName = "Ace Revive"; // Argument label
						description = "Module is a workaround for mission Parameter"; // description description
						typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						class values
						{
							  class Positive    {name = "True"; value = 1;default = 1; };
							  class Negative   {name = "False"; value = 0;};
						};
				   };

				};
		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "Olsenframework Ace Medical Module"; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
		};
	};
