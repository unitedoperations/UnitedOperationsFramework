
class UO_FW_CoverMapModule: OlsenModule {
	displayName = "Cover Map Module"; // Name displayed in the menu
	scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
	// Name of function triggered once conditions are met
	function = "UO_FW_fnc_CoverMap";
	// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
	isGlobal = 1;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 1;
	canSetArea = 1;
	canSetAreaHeight = 0;
	canSetAreaShape = 0;

	class AttributeValues {
    size2[] = {100,100};
		IsRectangle = 1;
  };

	// Categories collapsible in "Edit Attributes" window
		// Category class, can be anything
		class Attributes {
			class UO_FW_CoverMap_AOName	{
				displayName = "AO Name";
				tooltip = "AO name displayed in ace actions and referenced in module settings";
				control = "EditShort";
				typeName = "STRING";
				property = "UO_FW_CoverMap_AOName";
				expression = "_this setVariable ['%s',_value];";
				validate = "STRING";
				defaultValue = "'Area0'";
			};
			class UO_FW_CoverMap_RadiusX {
				displayName = "Radius X";
				tooltip = "The size of the X value of the setup zone. Default: 100";
				property = "UO_FW_CoverMap_RadiusX";
				control = "UO_FW_AI_moduleradiusControl";
				expression = "_this setVariable ['%s',_value];";
				defaultValue = "100";
				typeName = "NUMBER";
				validate = "number";
			};
			class UO_FW_CoverMap_RadiusY {
				displayName = "Radius Y";
				tooltip = "The size of the Y value of the setup zone. Default: 100";
				property = "UO_FW_CoverMap_RadiusY";
				control = "UO_FW_AI_moduleradiusControl2";
				expression = "_this setVariable ['%s',_value];";
				defaultValue = "100";
				typeName = "NUMBER";
				validate = "number";
			};
			class UO_FW_CoverMap_ZoomLevel {
				displayName = "Zoomlevel";
				tooltip = "Map zoom level of the AO. Default: 0.2";
				property = "UO_FW_CoverMap_ZoomLevel";
				control = "EditShort";
				expression = "_this setVariable ['%s',_value];";
				defaultValue = "0.2";
				typeName = "NUMBER";
				validate = "number";
			};
		};
};

//class UO_FW_CoverMapModule_R : UO_FW_CoverMapModule {
//	displayName = "Cover Map Module (Rectangle)"; // Name displayed in the menu
//	class AttributeValues {
//      size2[] = {100,100};
//			IsRectangle = 1;
//    };
//};
