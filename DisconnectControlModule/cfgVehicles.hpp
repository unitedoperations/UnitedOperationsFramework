
	class UO_DisconnectControlModule: UO_Module
	{

		displayName = "Disconnect Control Module"; // Name displayed in the menu

		// Name of function triggered once conditions are met
		function = "UO_fnc_LoadDisconnectControl";
		// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		functionPriority = 3;
 		scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.

		// Categories collapsible in "Edit Attributes" window
			// Category class, can be anything
			// Categories collapsible in "Edit Attributes" window
				class Arguments
				{
  					  class ControlTimeArgument
  					  {
  						  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
  						  displayName = "Delete Time"; // Argument label
  						  description = "Time for how long disconnected players should be deleted since mission start (in minutes)";
  						  typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
  						  defaultValue = "2"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
  					  };
					  class BluforDeleteArgument
  					  {
  						  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						  displayName = "Delete Blufor?"; // Argument label
  						  description = "Should Blufor units be deleted?";
  						  typeName = "BOOL"; // Value type, can be "NUMBER", "STRING" or "BOOL"
  						  defaultValue = "true"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
  					  };
					  class OpforDeleteArgument
					 {
						 // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						 displayName = "Delete Opfor?"; // Argument label
						 description = "Should Opfor units be deleted?";
						 typeName = "BOOL"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						 defaultValue = "true"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					 };
					 class IndforDeleteArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						displayName = "Delete Indfor?"; // Argument label
						description = "Should Indfor units be deleted?";
						typeName = "BOOL"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "true"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class CivilianDeleteArgument
				   {
					   // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					   displayName = "Delete Civilian?"; // Argument label
					   description = "Should Civilian units be deleted?";
					   typeName = "BOOL"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					   defaultValue = "true"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
				   };


				};
		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "United Operations Framework Disconnect Control Module"; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
		};
	};
