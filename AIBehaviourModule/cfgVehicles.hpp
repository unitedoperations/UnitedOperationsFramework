
	class UO_AIDriverModule: UO_Module
	{

		displayName = "AI Driver Module"; // Name displayed in the menu
scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
		// Name of function triggered once conditions are met
		function = "UO_fnc_LoadAILink";
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
					 };
				 };
				 class DistanceArgument
				 {
					 // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					 displayName = "Distance"; // Argument label
					 description = "Set Behaviour on all units within range. Group will set on all groups in range. Side no use";
					 typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					 defaultValue = "0"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
				 };
				 class MinMoraleArgument
				 {
					 // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					 displayName = "Min Morale"; // Argument label
					 description = "If below this threshold it will change pos to minStance between 0 and 1"; // description description
					 typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					 defaultValue = "0.2"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
				 };
				   class MinStanceArgument
				   {
					   // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					   displayName = "Min Stance"; // Argument label
					   description = "In quotes, UP, MIDDLE, DOWN"; // description description
					   typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					   defaultValue = "DOWN"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
				   };
				   class MaxMoraleArgument
				   {
					   // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					   displayName = "Max Morale"; // Argument label
					   description = "If above this threshold it will change pos to minStance between 0 and 1"; // description description
					   typeName = "Number"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					   defaultValue = "0.8"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
				   };
				   class MaxStanceArgument
				  {
					  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					  displayName = "Max Stance"; // Argument label
					  description = "In quotes, UP, MIDDLE, DOWN"; // description description
					  typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					  defaultValue = "UP"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
				  };
				};
		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "United Operations Framework AI Driver Module"; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
		};
	};
