
	class OF_AISkillModule: OlsenModule
	{

		displayName = "AI Skill Module"; // Name displayed in the menu

		// Name of function triggered once conditions are met
		function = "OF_fnc_LoadAntiND";
		// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		functionPriority = 3;
 		scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.

		// Categories collapsible in "Edit Attributes" window
			// Category class, can be anything
			// Categories collapsible in "Edit Attributes" window
				class Arguments
				{
					class TypeArgument
				  {
					  displayName = "Activation Type";
					  description = "How will synced Units be handled. Unit will call the module on all synced units. Group the module will run on Units in the group of the synced unit. Side all units with the same side of the unit";
					  typeName = "NUMBER";
					  class values
					   {
						  class West    {name = "Unit"; value = 1; default = 1;};
						  class East    {name = "Group"; value = 2;};
						  class Ind    {name = "Side"; value = 3;};
						  class Civ    {name = "Civilian"; value = 4;};
					  };
				  };
					class NDDistanceArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						displayName = "Distance"; // Argument label
						description = "max. Distance from spawn to andiND"; // description description
						typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "0"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class NDTimeArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						displayName = "Time"; // Argument label
						description = "in seconds. How long should anti ND work"; // description description
						typeName = "Number"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "30"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};

				};
		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "Olsenframework AI Skill Module"; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
		};
	};
