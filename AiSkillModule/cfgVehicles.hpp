
	class UO_AISkillModule: UOModule
	{

		displayName = "AI Skill Module"; // Name displayed in the menu

		// Name of function triggered once conditions are met
		function = "UO_fnc_LoadAntiND";
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
					  description = "Set Skill on all units within range. Group will set on all groups in range. Side no use";
					  typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
					  defaultValue = "0.8"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
				  };
					class AimingAccuracyArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						displayName = "Aiming Accuracy"; // Argument label
						description = " Affects how well the AI can lead a target, how accurately the AI estimate range and calculates bullet drop,how well the AI compensates for weapon dispersion,how much the AI will know to compensate for recoil Higher value  more controlled fire,how certain the AI must be about its aim on target before opening fire"; // description description
						typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "0.8"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class AimingShakeArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						displayName = "Aiming Shake"; // Argument label
						description = "Affects how steadily the AI can hold a weapon (Higher value = less weapon sway)"; // description description
						typeName = "Number"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "0.8"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class AimingSpeedArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						displayName = "Aiming Speed"; // Argument label
						description = "Affects how quickly the AI can rotate and stabilize its aim (Higher value = faster, less error)"; // description description
						typeName = "Number"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "0.8"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class CommandingArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						displayName = "Commanding"; // Argument label
						description = "Affects how quickly the AI can rotate and stabilize its aim (Higher value = faster, less error)"; // description description
						typeName = "Number"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "0.8"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class CourageArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						displayName = "Courage"; // Argument label
						description = "Affects unit's subordinates' morale (Higher value = more courage)"; // description description
						typeName = "Number"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "0.8"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class ReloadSpeedArgument
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						displayName = "Reload Speed"; // Argument label
						description = "Affects the delay between switching or reloading a weapon Higher value = less delay"; // description description
						typeName = "Number"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "0.8"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class SpotDistance
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						displayName = " Spot Distance"; // Argument label
						description = "Affects the AI ability to spot targets within it's visual or audible range Higher value = more likely to spot, accuracy of the information Higher value = more accurate information"; // description description
						typeName = "Number"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "0.8"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
					class SpotTime
					{
						// Unique property, use "<moduleClass>_<attributeClass>" format to make sure the name is unique in the world
						displayName = " Spot Time"; // Argument label
						description = "Affects how quick the AI react to death, damage or observing an enemy (Higher value = quicker reaction)"; // description description
						typeName = "Number"; // Value type, can be "NUMBER", "STRING" or "BOOL"
						defaultValue = "0.8"; // Default attribute value. WARNING: This is an expression, and its returned value will be used (50 in this case)
					};
				};
		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "Olsenframework AI Skill Module"; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
		};
	};
