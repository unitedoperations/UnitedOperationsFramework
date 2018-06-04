
	class UO_JipModule: UO_Module
	{

		displayName = "Jip Module"; // Name displayed in the menu

		// Name of function triggered once conditions are met
		function = "UO_fnc_LoadJipModule";
		// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		functionPriority = 3;
 		scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.

		// Categories collapsible in "Edit Attributes" window
			// Category class, can be anything
			// Categories collapsible in "Edit Attributes" window
				class Arguments
				{
					class BluforTypeSelectArgument
					 {
						 displayName = "Blufor Jip Type";
						 description = "How should JIPs be handled, options are: DENY: Player is killed and put in spectator. TELEPORT: Player can teleport to his squad. TRANSPORT: Player can send a hint to all group leaders requesting transport.";
						 typeName = "NUMBER";
						 class values
						  {
							 class Teleport    {name = "Teleport"; value = 0; default = 0;};
							 class Transport    {name = "Transport"; value = 1;};
							 class Deny    {name = "Deny"; value = 2;};
						 };
					 };
					  class BluforJipDistanceArgument
					  {
						  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						  displayName = "Blufor Jip Distance"; // Argument label
						  description = "When you spawn, if your squad members are more then JIPDISTANCE away, you get the option to teleport or request transport.";
						  typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						  defaultValue = "50"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					  };
					  class BluforSpawnDistanceArgument
					  {
						  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						  displayName = "Blufor Spawn Distance"; // Argument label
						  description = "//If you move SPAWNDISTANCE away from your spawn position you loose the option to teleport or request transport.";
						  typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						  defaultValue = "300"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					  };
					  class OpforTypeSelectArgument
  					 {
  						 displayName = "Opfor Jip Type";
  						 description = "How should JIPs be handled, options are: DENY: Player is killed and put in spectator. TELEPORT: Player can teleport to his squad. TRANSPORT: Player can send a hint to all group leaders requesting transport.";
  						 typeName = "NUMBER";
  						 class values
  						  {
  							 class Teleport    {name = "Teleport"; value = 0; default = 0;};
  							 class Transport    {name = "Transport"; value = 1;};
  							 class Deny    {name = "Deny"; value = 2;};
  						 };
  					 };
  					  class OpforJipDistanceArgument
  					  {
  						  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
  						  displayName = "Opfor Jip Distance"; // Argument label
  						  description = "When you spawn, if your squad members are more then JIPDISTANCE away, you get the option to teleport or request transport.";
  						  typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
  						  defaultValue = "50"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
  					  };
  					  class OpforSpawnDistanceArgument
  					  {
  						  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
  						  displayName = "Opfor Spawn Distance"; // Argument label
  						  description = "//If you move SPAWNDISTANCE away from your spawn position you loose the option to teleport or request transport.";
  						  typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
  						  defaultValue = "300"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
  					  };
					  class IndforTypeSelectArgument
  					 {
  						 displayName = "Indfor Jip Type";
  						 description = "How should JIPs be handled, options are: DENY: Player is killed and put in spectator. TELEPORT: Player can teleport to his squad. TRANSPORT: Player can send a hint to all group leaders requesting transport.";
  						 typeName = "NUMBER";
  						 class values
  						  {
  							 class Teleport    {name = "Teleport"; value = 0; default = 0;};
  							 class Transport    {name = "Transport"; value = 1;};
  							 class Deny    {name = "Deny"; value = 2;};
  						 };
  					 };
  					  class IndforJipDistanceArgument
  					  {
  						  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
  						  displayName = "Indfor Jip Distance"; // Argument label
  						  description = "When you spawn, if your squad members are more then JIPDISTANCE away, you get the option to teleport or request transport.";
  						  typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
  						  defaultValue = "50"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
  					  };
  					  class IndforSpawnDistanceArgument
  					  {
  						  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
  						  displayName = "Indfor Spawn Distance"; // Argument label
  						  description = "//If you move SPAWNDISTANCE away from your spawn position you loose the option to teleport or request transport.";
  						  typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
  						  defaultValue = "300"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
  					  };
  					  class CivilianTypeSelectArgument
    					 {
    						 displayName = "Civilian Jip Type";
    						 description = "How should JIPs be handled, options are: DENY: Player is killed and put in spectator. TELEPORT: Player can teleport to his squad. TRANSPORT: Player can send a hint to all group leaders requesting transport.";
    						 typeName = "NUMBER";
    						 class values
    						  {
    							 class Teleport    {name = "Teleport"; value = 0; default = 0;};
    							 class Transport    {name = "Transport"; value = 1;};
    							 class Deny    {name = "Deny"; value = 2;};
    						 };
    					 };
    					  class CivilianJipDistanceArgument
    					  {
    						  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
    						  displayName = "Civilian Jip Distance"; // Argument label
    						  description = "When you spawn, if your squad members are more then JIPDISTANCE away, you get the option to teleport or request transport.";
    						  typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
    						  defaultValue = "50"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
    					  };
    					  class CivilianSpawnDistanceArgument
    					  {
    						  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
    						  displayName = "Civilian Spawn Distance"; // Argument label
    						  description = "//If you move SPAWNDISTANCE away from your spawn position you loose the option to teleport or request transport.";
    						  typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
    						  defaultValue = "300"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
    					  };

				};
		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "United Operations Framework Jip Module"; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
		};
	};
