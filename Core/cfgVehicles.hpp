
	class UO_CoreBasicSetupModule: OlsenModule
	{
		// Standard object definitions
		scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
		displayName = "Basic Mission Setup Module"; // Name displayed in the menu
		// Name of function triggered once conditions are met
		function = "UO_fnc_init";
		// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		functionPriority = 1;
		// 0 for server only execution, 1 for global execution, 2 for persistent global execution
		isGlobal = 2;

		// Menu displayed when the module is placed or double-clicked on by Zeus
		curatorInfoType = "RscDisplayArgumentModuleNuke";
		// Categories collapsible in "Edit Arguments" window
			// Category class, can be anything
				class Arguments
				{
					// Arguments shared by specific module type (have to be mentioned in order to be present)
					// Module specific arguments
					class ViewDistancePlayerArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world

						displayName = "Max. Viewdistance Player "; // Argument label
						description = "Forced max view distance for Players"; // description description
						typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "2500"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class ViewDistanceAIArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world

						displayName = "Max. Viewdistance AI"; // Argument label
						description = "Forced max view distance for AI"; // description description
						typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "2500"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class BluforPlayerFactionNameArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world

						displayName = "Blufor Player Faction Name "; // Argument label
						description = "Faction name for Blufor Player Side, Empty for disable"; // description description
						typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = ""; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class BluforAIFactionNameArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world

						displayName = "Blufor AI Faction Name "; // Argument label
						description = "Faction name for Blufor AI Side, Empty for disable"; // description description
						typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = ""; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class BluforRespawnTicketsArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world

						displayName = "Blufor Respawn Tickets"; // Argument label
						description = "How often can an individual player respawn"; // description description
						typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "0"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class OpforPlayerFactionNameArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world

						displayName = "Opfor Player Faction Name "; // Argument label
						description = "Faction name for Opfor Player Side, Empty for disable"; // description description
						typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = ""; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class OpforAIFactionNameArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world

						displayName = "Opfor Player Faction Name "; // Argument label
						description = "Faction name for Opfor AI Side, Empty for disable"; // description description
						typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = ""; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class OpforRespawnTicketsArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world

						displayName = "Opfor Respawn Tickets"; // Argument label
						description = "How often can an individual player respawn"; // description description
						typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "0"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class IndforPlayerFactionNameArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world

						displayName = "Indfor Player Faction Name "; // Argument label
						description = "Faction name for Indfor Player Side, Empty for disable"; // description description
						typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = ""; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class IndforAIFactionNameArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world

						displayName = "Indfor Player Faction Name "; // Argument label
						description = "Faction name for Indfor AI Side, Empty for disable"; // description description
						typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = ""; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class IndforRespawnTicketsArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world

						displayName = "Indfor Respawn Tickets"; // Argument label
						description = "How often can an individual player respawn"; // description description
						typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "0"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class CivilianPlayerFactionNameArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world

						displayName = "Blufor Player Faction Name "; // Argument label
						description = "Faction name for Civilian Player Side, Empty for disable"; // description description
						typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = ""; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class CivilianAIFactionNameArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world

						displayName = "Civilian Player Faction Name "; // Argument label
						description = "Faction name for Civilian AI Side, Empty for disable"; // description description
						typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = ""; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class CivilianRespawnTicketsArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world

						displayName = "Civilian Respawn Tickets"; // Argument label
						description = "How often can an individual player respawn"; // description description
						typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "0"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class EnableDebugArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world

						displayName = "Enable Debug? "; // Argument label
						description = "Enables Debug for Olsen Framework"; // description description
						typeName = "BOOL"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "true"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
				};

		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "Olsenframework Basic Mission Setup"; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
		};
	};
