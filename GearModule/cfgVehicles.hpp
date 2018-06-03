

	class UO_GearModule: UOModule
	{
		// Standard object definitions
		scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
		displayName = "Gear Module"; // Name displayed in the menu
		function = "UO_fnc_LoadGear";


		// Categories collapsible in "Edit Attributes" window
			// Category class, can be anything
			// Categories collapsible in "Edit Attributes" window
		class Arguments
		{
		   class Gear1Argument
		   {
			   displayName = "Gear 1";
			   description = "Path of gear to load";
			   typeName = "STRING";
			   defaultValue = "";
		   };
		   class Gear2Argument
		  {
			  displayName = "Gear 2";
			  description = "Path of gear to load";
			  typeName = "STRING";
			  defaultValue = "";
		  };
		  class Gear3Argument
		  {
			  displayName = "Gear 3";
			  description = "Path of gear to load";
			  typeName = "STRING";
			  defaultValue = "";
		  };
		  class Gear4Argument
		  {
			  displayName = "Gear 4";
			  description = "Path of gear to load";
			  typeName = "STRING";
			  defaultValue = "";
		  };
		  class Gear5Argument
		  {
			  displayName = "Gear 5";
			  description = "Path of gear to load";
			  typeName = "STRING";
			  defaultValue = "";
		  };
		  class Gear6Argument
		   {
			   displayName = "Gear 6";
			   description = "Path of gear to load";
			   typeName = "STRING";
			   defaultValue = "";
		   };
		   class Gear7Argument
 		   {
 			   displayName = "Gear 7";
 			   description = "Path of gear to load";
 			   typeName = "STRING";
 			   defaultValue = "";
 		   };
		   class Gear8Argument
 		   {
 			   displayName = "Gear 8";
 			   description = "Path of gear to load";
 			   typeName = "STRING";
 			   defaultValue = "";
 		   };
		   class Gear9Argument
 		   {
 			   displayName = "Gear 9";
 			   description = "Path of gear to load";
 			   typeName = "STRING";
 			   defaultValue = "";
 		   };
		    class Gear10Argument
 		   {
 			   displayName = "Gear 10";
 			   description = "Path of gear to load";
 			   typeName = "STRING";
 			   defaultValue = "";
 		   };
		};
		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "Olsenframework Gear"; // Short description, will be formatted as structured text
			sync[] = {}; // Array of synced entities (can contain base classes)
		};
	};
