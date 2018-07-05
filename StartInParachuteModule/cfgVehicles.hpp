
class UO_FW_StartInParachuteModule: UO_Module
{

	displayName = "Start In Parachute Module"; // Name displayed in the menu

	// Name of function triggered once conditions are met
	function = "UO_FW_fnc_EdenStartInParachute";
	// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
	functionPriority = 3;
	scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
	is3DEN = 1;
	class Attributes 
	{
		class UO_FW_StartInParachute_SizeX
		{
			displayName = "Activation Radius X";
			tooltip = "The size of the X value of the area in which players will spawn in parachute. Default: 100";
			property = "UO_FW_StartInParachute_SizeX";
			control = "UO_FW_moduleradiusControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "100";
			typeName = "NUMBER";
			validate = "number";
		};
		class UO_FW_StartInParachute_SizeY
		{
			displayName = "Activation Radius Y";
			tooltip = "The size of the Y value of the area in which players will spawn in parachute. Default: 100";
			property = "UO_FW_StartInParachute_SizeY";
			control = "UO_FW_moduleradiusControl";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "100";
			typeName = "NUMBER";
			validate = "number";
		};
		class UO_FW_StartInParachute_SideSelect
		{
			displayName = "Side";
			tooltip = "Side on which to run the setup timer on";
			control = "Combo";
			typeName = "NUMBER";
			property = "UO_FW_StartInParachute_SideSelect";
			expression = "_this setVariable ['%s',_value];";
			validate = "none";
			class values
			{
					class West    {name = "West"; value = 0; default = 0;};
					class East    {name = "East"; value = 1;};
					class Ind    {name = "Independent"; value = 2;};
					class Civ    {name = "Civilian"; value = 3;};
					class Civ    {name = "All"; value = 4;};
				
			};
			defaultValue = "0";
		};
		class UO_FW_StartInParachute_Altitude
		{
			displayName = "Activation Altitude";
			tooltip = "the elevation above terrain level that the parachute will open. Default: 300";
			property = "UO_FW_StartInParachute_Altitude";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "300";
			typeName = "NUMBER";
			validate = "number";
		};
		class UO_FW_StartInParachute_AltitudeRandom
		{
			displayName = "Atltitude Random Height";
			tooltip = "A random number between 0 and altituderandom will be added to altitude for the effect to look better. default is 100";
			property = "UO_FW_StartInParachute_AltitudeRandom";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "100";
			typeName = "NUMBER";
			validate = "number";
		};
		class UO_FW_StartInParachute_Steerable
		{
			displayName = "Steerable Parachute";
			tooltip = "true for parachute to be stearable, false for nonstearable. false by default";
			property = "UO_FW_StartInParachute_Steerable";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = "false";
			typeName = "BOOL";
			validate = "none";
		};
	};
};
