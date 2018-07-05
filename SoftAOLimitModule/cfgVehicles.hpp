
class UO_SoftAOLimitModule: OlsenModule
{

	displayName = "Soft AO Limit Module"; // Name displayed in the menu

	// Name of function triggered once conditions are met
	function = "UO_FW_fnc_EdenSoftAOLimits";
	// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
	functionPriority = 3;
	scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
	is3DEN = 1;
	// Categories collapsible in "Edit Attributes" window
		// Category class, can be anything
		// Categories collapsible in "Edit Attributes" window
	class Attributes 
	{
		class UO_FW_SoftAoLimit_TimeOutside
		{
			displayName = "Max time outside of AO";
			tooltip = "The amount of time in seconds a land based unit is allowed to stay outside the AO (-1 = Infinity)";
			control = "Edit";
			typeName = "NUMBER";
			property = "UO_FW_SoftAoLimit_TimeOutside";
			expression = "_this setVariable ['%s',_value];";
			validate = "number";
			defaultValue = "30";
		};
		class UO_FW_SoftAoLimit_TimeOutsideAir
		{
			displayName = "Max time outside of AO for aerial units";
			tooltip = "The amount of time in seconds an air based unit is allowed to stay outside the AO (-1 = Infinity)";
			control = "Edit";
			typeName = "NUMBER";
			property = "UO_FW_SoftAoLimit_TimeOutsideAir";
			expression = "_this setVariable ['%s',_value];";
			validate = "number";
			defaultValue = "-1";
		};
		class UO_FW_SoftAoLimit_BluforMarkers
		{
			displayName = "Blufor markers";
			tooltip = "List of Marker names without quotes seperated by , for Blufor. Units must spawn inside to be valid.";
			control = "EditArray";
			typeName = "STRING";
			property = "UO_FW_SoftAoLimit_BluforMarkers";
			expression = "_this setVariable ['%s',_value];";
			validate = "none";
			defaultValue = "[]";
		};
		class UO_FW_SoftAoLimit_OpforMarkers
		{
			displayName = "Opfor markers";
			tooltip = "List of Marker names without quotes seperated by , for Opfor. Units must spawn inside to be valid.";
			control = "EditArray";
			typeName = "STRING";
			property = "UO_FW_SoftAoLimit_OpforMarkers";
			expression = "_this setVariable ['%s',_value];";
			validate = "none";
			defaultValue = "[]";
		};
		class UO_FW_SoftAoLimit_IndependentMarkers
		{
			displayName = "Independent markers";
			tooltip = "List of Marker names without quotes seperated by , for Independent. Units must spawn inside to be valid.";
			control = "EditArray";
			typeName = "STRING";
			property = "UO_FW_SoftAoLimit_IndependentMarkers";
			expression = "_this setVariable ['%s',_value];";
			validate = "none";
			defaultValue = "[]";
		};
		class UO_FW_SoftAoLimit_CivilianMarkers
		{
			displayName = "Civilian markers";
			tooltip = "List of Marker names without quotes seperated by , for Civilians. Units must spawn inside to be valid.";
			control = "EditArray";
			typeName = "STRING";
			property = "UO_FW_SoftAoLimit_CivilianMarkers";
			expression = "_this setVariable ['%s',_value];";
			validate = "none";
			defaultValue = "[]";
		};
	
	};
	// Module description. Must inherit from base class, otherwise pre-defined entities won't be available
};
