
	class UO_OlsenEndConditionModule: UO_Module
	{
		// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		functionPriority = 4;
		// 0 for server only execution, 1 for global execution, 2 for persistent global execution
		isGlobal = 2;
		// 1 for module waiting until all synced triggers are activated
		isTriggerActivated = 0;
		// 1 if modules is to be disabled once it's activated (i.e., repeated trigger activation won't work)
		isDisposable = 0;
		// // 1 to run init function in Eden Editor as well
		is3DEN = 0;
 		scope = 1; // Editor visibility; 2 will show it in the menu, 1 will hide it.
		// Menu displayed when the module is placed or double-clicked on by Zeus
		curatorInfoType = "RscDisplayAttributeModuleNuke";
	};
	class UO_AreaEndModule: UO_OlsenEndConditionModule
	{
		// Standard object definitions
		scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
		displayName = "Area Endcondition Module"; // Name displayed in the menu
		function = "UO_fnc_AreaEnd";


		// Categories collapsible in "Edit Attributes" window
			// Category class, can be anything
			// Categories collapsible in "Edit Attributes" window
		class Arguments
		{
		   class AreaEndSideSelectArgument
		   {
			   displayName = "Side";
			   description = "Select the side to name channels for";
			   typeName = "NUMBER";
			   class values
			    {
				   class West    {name = "West"; value = 1; default = 1;};
				   class East    {name = "East"; value = 2;};
				   class Ind    {name = "Independent"; value = 3;};
				   class Civ    {name = "Civilian"; value = 4;};
			   };
		   };
		   class AreaDistanceArgument
		   {
			   // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			   displayName = "Distance"; // Argument label
			   description = "Distance as radius from gameLogic"; // description description
			   typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			   defaultValue = "300"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
		   };
		   class MessageArgument
		  {
			  // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			  displayName = "Message"; // Argument label
			  description = "Message to end the mission with"; // description description
			  typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			  defaultValue = ""; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
		  };
		   class AreaMinArgument
		   {
			   // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			   displayName = "Min"; // Argument label
			   description = "Minimal Argument"; // description description
			   typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			   defaultValue = "0"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
		   };
		   class AreaMaxTimeArgument
		   {
			   // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			   displayName = "Max"; // Argument label
			   description = "Maximal Argument"; // description description
			   typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			   defaultValue = "0"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
		   };
		   class AreaTypeArgument
		   {
			   displayName = "Type";
 			  description = "Select a type for evaluation of Endconditions. Use Min <= ammountOfUnits <= Max and Min == Max for a specific number.";
 			  typeName = "NUMBER";
 			  class values
 			   {
 				  class BetweenSame    {name = "Min <= ammountOfUnits <= Max"; value = 1; default = 1;};
 				  class Between    {name = "Min < ammountOfUnits < Max"; value = 2;};
 				  class OutsideSame    {name = "ammountOfUnits <= min || max <= ammountOfUnits"; value = 3;};
 				  class Outside    {name = "ammountOfUnits < min || max < ammountOfUnits"; value = 4;};
 			  };
		   };
			// Module specific arguments
			class EndCheckTimeArgument
			{
				// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
				displayName = "Checktime"; // Argument label
				description = "Time in seconds needed to check the condition again. Only change if you know what you are doing."; // description description
				typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = "60"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
			};
		};
		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "Olsenframework Area End Condition"; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
			position = 1;
		};
	};
	class UO_CustomEndModule: UO_OlsenEndConditionModule
	{
		displayName = "Custom Endcondition Module"; // Name displayed in the menu
		// Name of function triggered once conditions are met
		function = "UO_fnc_CustomEnd";
		scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
		class Arguments
		{
		   class CustomCodeArgument
		   {
			   // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			   displayName = "Code"; // Argument label
			   description = "if(your code) exitWith"; // description description
			   typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			   defaultValue = ""; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
		   };
		   class MessageArgument
		   {
			   // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			   displayName = "Message"; // Argument label
			   description = "Message to end the mission with"; // description description
			   typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			   defaultValue = "Message to end the mission with"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
		   };
		   class EndCheckTimeArgument
		   {
			   // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			   displayName = "Checktime"; // Argument label
			   description = "Time in seconds needed to check the condition again. Only change if you know what you are doing."; // description description
			   typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			   defaultValue = "60"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
		   };
		};
		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "Olsenframework Custom End Condition"; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
		};
	};
	class UO_CustomCodeEndModule: UO_OlsenEndConditionModule
	{
		displayName = "Custom Code Endcondition Module"; // Name displayed in the menu
		// Name of function triggered once conditions are met
		function = "UO_fnc_CustomCodeEnd";
		scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
		class Arguments
		{
		   class CustomCodeArgument
		   {
			   // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			   displayName = "Code"; // Argument label
			   description = "Path to file to execute"; // description description
			   typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			   defaultValue = ""; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
		   };
		   class EndCheckTimeArgument
		   {
			   // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			   displayName = "Checktime"; // Argument label
			   description = "Time in seconds needed to check the condition again. Only change if you know what you are doing."; // description description
			   typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			   defaultValue = "60"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
		   };
		};
		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "Olsenframework Custom Code Condition"; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
		};
	};

	class UO_TimeLimitEndModule: UO_OlsenEndConditionModule
	{
			scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
		displayName = "Time Limit Endcondition Module"; // Name displayed in the menu
		// Name of function triggered once conditions are met
		function = "UO_fnc_TimeLimitEnd";
		// Categories collapsible in "Edit Attributes" window
			// Category class, can be anything
			// Categories collapsible in "Edit Attributes" window
		class Arguments
		{
		   class TimeLimitArgument
		   {
			   // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			   displayName = "Time"; // Argument label
			   description = "Time in minutes needed before mission is ended"; // description description
			   typeName = "Number"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			   defaultValue = "120"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
		   };
		   class MessageArgument
		   {
			   // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			   displayName = "Message"; // Argument label
			   description = "Message to end the mission with"; // description description
			   typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			   defaultValue = "Timelimit Reached!"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
		   };

		};
		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "Olsenframework Time Limit Endcondition"; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
		};
	};
	class UO_CasualtyPercentageEndModule: UO_OlsenEndConditionModule
	{
			scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
		displayName = "Casualty Percentage Endcondition Module"; // Name displayed in the menu
		// Name of function triggered once conditions are met
		function = "UO_fnc_CasualtyEnd";
		// Categories collapsible in "Edit Attributes" window
			// Category class, can be anything
			// Categories collapsible in "Edit Attributes" window
		class Arguments
		{
		   class FactionNameArgument
		   {
			   // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			   displayName = "Faction Name"; // Argument label
			   description = "Name of the faction which should be checked"; // description description
			   typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			   defaultValue = ""; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
		   };
		   class PercentageArgument
		   {
			   // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			   displayName = "Max Percentage"; // Argument label
			   description = "Max Percentage of casualties."; // description description
			   typeName = "Number"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			   defaultValue = "80"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
		   };
		   class MessageArgument
		   {
			   // Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			   displayName = "Message"; // Argument label
			   description = "Message to end the mission with"; // description description
			   typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			   defaultValue = "Message to end the mission with"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
		   };
		   class EndCheckTimeArgument
		   {
			   	// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
			   	displayName = "Checktime"; // Argument label
			   	description = "Time in seconds needed to check the condition again. Only change if you know what you are doing."; // description description
			   	typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			   	defaultValue = "60"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
		   };
		};
		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "Olsenframework Casualty Percentage Endcondition"; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
		};
	};
