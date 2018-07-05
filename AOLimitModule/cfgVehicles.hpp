
	class UO_AOLimitModule: UO_Module
	{

		displayName = "AO Limit Module"; // Name displayed in the menu

		// Name of function triggered once conditions are met
		function = "UO_FW_fnc_EdenAOLimits";
		// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		functionPriority = 3;
 		scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
		is3DEN = 1;
		class Attributes 
		{
			class BluforMarkerAttribute
			{
				displayName = "Blufor markers";
				tooltip = "List of Marker names without quotes seperated by , for Blufor. Units must spawn inside to be valid.";
				control = "EditArray";
				typeName = "STRING";
				property = "UO_FW_AOLM_BluforMarkerAttribute";
				expression = "_this setVariable ['%s',_value];";
				validate = "none";
				defaultValue = "[]";
			};
			class OpforMarkerAttribute
			{
				displayName = "Opfor markers";
				tooltip = "List of Marker names without quotes seperated by , for Opfor. Units must spawn inside to be valid.";
				control = "EditArray";
				typeName = "STRING";
				property = "UO_FW_AOLM_OpforMarkerAttribute";
				expression = "_this setVariable ['%s',_value];";
				validate = "none";
				defaultValue = "[]";
			};
			class IndependentMarkerAttribute
			{
				displayName = "Independent markers";
				tooltip = "List of Marker names without quotes seperated by , for Independent. Units must spawn inside to be valid.";
				control = "EditArray";
				typeName = "STRING";
				property = "UO_FW_AOLM_IndependentMarkerAttribute";
				expression = "_this setVariable ['%s',_value];";
				validate = "none";
				defaultValue = "[]";
			};
			class CivilianMarkerAttribute
			{
				displayName = "Civilian markers";
				tooltip = "List of Marker names without quotes seperated by , for Civilians. Units must spawn inside to be valid.";
				control = "EditArray";
				typeName = "STRING";
				property = "UO_FW_AOLM_CivilianMarkerAttribute";
				expression = "_this setVariable ['%s',_value];";
				validate = "none";
				defaultValue = "[]";
			};
		};
		// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
		class ModuleDescription: ModuleDescription
		{
			description = "Olsenframework AO Limit Module"; // Short description, will be formatted as structured text
			sync[] = {}; // synced entities (can contain base classes)
		};
	};
