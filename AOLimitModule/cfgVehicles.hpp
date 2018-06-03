
	class UO_AOLimitModule: UO_Module
	{

		displayName = "AO Limit Module"; // Name displayed in the menu

		// Name of function triggered once conditions are met
		function = "UO_fnc_LoadAOLimits";
		// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		functionPriority = 3;
 		scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.

		// Categories collapsible in "Edit Attributes" window
			// Category class, can be anything
			// Categories collapsible in "Edit Attributes" window
				class Arguments
				{
					class AOBluforMarkerArrayArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						displayName = "Blufor markers"; // Argument label
						description = "Array of Marker names in quotes for Blufor"; // description description
						typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "[]"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class AOOpforMarkerArrayArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						displayName = "Opfor markers"; // Argument label
						description = "Array of Marker names in quotes for Opfor"; // description description
						typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "[]"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)

					};
					class AOIndforMarkerArrayArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						displayName = "Indfor markers"; // Argument label
						description = "Array of Marker names in quotes for Indfor"; // description description
						typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "[]"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)

					};
					class AOCivilianMarkerArrayArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						property = "AOCivilianMarkerArray";
						displayName = "Civilian markers"; // Argument label
						description = "Array of Marker names in quotes for Civilian"; // description description
						typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "[]"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)

					};
				};
		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "Olsenframework AO Limit Module"; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
		};
	};
