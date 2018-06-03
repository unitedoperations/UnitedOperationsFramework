
	class UO_AILinkModule: UOModule
	{

		displayName = "AI Link Module"; // Name displayed in the menu

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
					  class StartDelayArgument
					  {
						  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						  displayName = "Start Delay"; // Argument label
						  description = "Delay in seconds when starting the mission until the first loop runs.";
						  typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						  defaultValue = "30"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					  };
					  class ShareDelayArgument
					  {
						 // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						 displayName = "Share Delay"; // Argument label
						 description = "Delay in seconds  between loops after the first.";
						 typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						 defaultValue = "15"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					  };
					  class TransDelayArgument
					  {
						 // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						 displayName = "Trans Delay"; // Argument label
						 description = "Delay in seconds, maximum randomized, for target information to be transmitted. No effect if set higher than tin_aiLink_shareDelay.";
						 typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						 defaultValue = "10"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					  };
					  class LRRangeArgument
					  {
						 // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						 displayName = "LR Range"; // Argument label
						 description = "Range if both groups have long-range radios, also used if tin_aiLink_needRadio is false.";
						 typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						 defaultValue = "800"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					  };
					  class SRRangeArgument
 					 {
 					   // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
 					   displayName = "SR Range"; // Argument label
 					   description = "Range if both groups have short-range radios.";
 					   typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
 					   defaultValue = "400"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
 					 };
					  class NeedRadioArgument
					  {
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						displayName = "Need Radio"; // Argument label
						description = "Controls if both AI groups need radios. If false, it will work regardless of radios. Will also perform somewhat better.";
						typeName = "BOOL"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "false"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					  };
					 class MaxKnowsArgument
					 {
					   // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					   displayName = "Max Knows about"; // Argument label
					   description = "The maximum amount that knowsAbout will be set to via this script.";
					   typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					   defaultValue = "3.5"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					 };
					 class DebugArgument
					 {
					   // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
					   displayName = "Debug"; // Argument label
					   description = "Debug Information; Very spammy.";
					   typeName = "BOOL"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					   defaultValue = "false"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					 };

				};
		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "United Operations Framework AI Link Module The script shares target information regarding playableUnits using knowsAbout if tin_aiLink_needRadio is false, or if both units have long or short range radios."; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
		};
	};
