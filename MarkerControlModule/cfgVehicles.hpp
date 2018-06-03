
	class UO_MarkerControlModule: UOModule
	{

		displayName = "Marker Control Module"; // Name displayed in the menu

		// Name of function triggered once conditions are met
		function = "UO_fnc_LoadMarkerControl";
		// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		functionPriority = 3;
 		scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.

		// Categories collapsible in "Edit Attributes" window
			// Category class, can be anything
			// Categories collapsible in "Edit Attributes" window
				class Arguments
				{
				  class BluforMarkerArgument
				  {
					  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					  displayName = "Blufor Markers"; // Argument label
					  description = "Markers which only Blufor can see";
					  typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					  defaultValue = "[]"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
				  };
				  class BluforBriefingMarkerArgument
				  {
					  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					  displayName = "Blufor Briefing Markers"; // Argument label
					  description = "Markers which only Blufor while briefing can see";
					  typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					  defaultValue = "[]"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
				  };
				  class OpforMarkerArgument
				  {
					  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					  displayName = "Opfor Markers"; // Argument label
					  description = "Markers which only Opfor can see";
					  typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					  defaultValue = "[]"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
				  };
				  class OpforBriefingMarkerArgument
				  {
					  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					  displayName = "Opfor Briefing Markers"; // Argument label
					  description = "Markers which only Opfor while briefing can see";
					  typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					  defaultValue = "[]"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
				  };
				  class IndforMarkerArgument
				  {
					  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					  displayName = "Indfor Markers"; // Argument label
					  description = "Markers which only Indfor can see";
					  typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					  defaultValue = "[]"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
				  };
				  class IndforBriefingMarkerArgument
				  {
					  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					  displayName = "Indfor Briefing Markers"; // Argument label
					  description = "Markers which only Indfor while briefing can see";
					  typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					  defaultValue = "[]"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
				  };
				  class CivilianMarkerArgument
				  {
					  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					  displayName = "Civilian Markers"; // Argument label
					  description = "Markers which only Civilian can see";
					  typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					  defaultValue = "[]"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
				  };
				  class CivilianBriefingMarkerArgument
				  {
					  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					  displayName = "Civilian Briefing Markers"; // Argument label
					  description = "Markers which only Civilian while briefing can see";
					  typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					  defaultValue = "[]"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
				  };
				  class NooneMarkerArgument
				  {
					  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					  displayName = "Invisible Markers"; // Argument label
					  description = "Markers noone can see";
					  typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					  defaultValue = "[]"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
				  };

				};
		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "Olsenframework Marker Control Module"; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
		};
	};
