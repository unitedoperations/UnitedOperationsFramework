
	class UO_StartOnTeamColorModule: UO_Module
	{
		displayName = "Start On Team Color Module"; // Name displayed in the menu

		// Name of function triggered once conditions are met
		function = "UO_fnc_LoadTeamColor";
		// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		functionPriority = 3;
		scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
		// Categories collapsible in "Edit Attributes" window
			// Category class, can be anything
				class Arguments
				{
				};

		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "Olsenframework Start On Team Color Module"; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
		};
	};