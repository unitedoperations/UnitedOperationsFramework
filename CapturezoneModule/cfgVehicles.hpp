
class UO_FW_CapturezoneModule: OlsenModule
{

	displayName = "Capturezone Module"; // Name displayed in the menu

	// Name of function triggered once conditions are met
	function = "UO_FW_fnc_EdenCapturezone";
	// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
	functionPriority = 3;
	scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
	is3DEN = 1;
	class Attributes 
	{
		class UO_FW_Capturezone_VariableName
		{
			displayName = "Variable name";
			tooltip = "Name of variable which will be set to true via missionNamespace setVariable when capturezone is captured. Enables chaining in endconditions";
			property = "UO_FW_Capturezone_VariableName";
			control = "Edit";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "''";
			typeName = "STRING";
			validate = "none";
		};
		class UO_FW_Capturezone_Markername
		{
			displayName = "Capturezone marker";
			tooltip = "Marker name of the capturezone without quotes. Default: 300";
			property = "UO_FW_Capturezone_Markername";
			control = "Edit";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "''";
			typeName = "STRING";
			validate = "none";
		};
		class UO_FW_Capturezone_BluforWin
		{
			displayName = "Blufor time";
			tooltip = "Time needed for Blufor to capture the zone in seconds. 0 to disable";
			property = "UO_FW_Capturezone_BluforWin";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "0";
			typeName = "NUMBER";
			validate = "number";
		};
		class UO_FW_Capturezone_OpforWin
		{
			displayName = "Opfor time";
			tooltip = "Time needed for Opfor to capture the zone in seconds. 0 to disable";
			property = "UO_FW_Capturezone_OpforWin";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "0";
			typeName = "NUMBER";
			validate = "number";
		};
		class UO_FW_Capturezone_IndependentWin
		{
			displayName = "Independent time";
			tooltip = "Time needed for Independent to capture the zone in seconds. 0 to disable";
			property = "UO_FW_Capturezone_IndependentWin";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "0";
			typeName = "NUMBER";
			validate = "number";
		};
		class UO_FW_Capturezone_CivilianWin
		{
			displayName = "Civilian time";
			tooltip = "Time needed for Civilian to capture the zone in seconds. 0 to disable";
			property = "UO_FW_Capturezone_CivilianWin";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "0";
			typeName = "NUMBER";
			validate = "number";
		};
		class UO_FW_Capturezone_BluforMessage
		{
			displayName = "Blufor Message";
			tooltip = "Message to display when Blufor captures the zone. empty Edit to disable hints";
			property = "UO_FW_Capturezone_BluforMessage";
			control = "Edit";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "'Blufor is capturing the zone!'";
			typeName = "STRING";
			validate = "none";
		};
		class UO_FW_Capturezone_OpforMessage
		{
			displayName = "Opfor Message";
			tooltip = "Message to display when Opfor captures the zone. empty Edit to disable hints";
			property = "UO_FW_Capturezone_OpforMessage";
			control = "Edit";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "'Opfor is capturing the zone!'";
			typeName = "STRING";
			validate = "none";
		};
		class UO_FW_Capturezone_IndependentMessage
		{
			displayName = "Independent Message";
			tooltip = "Message to display when Independent captures the zone. empty Edit to disable hints";
			property = "UO_FW_Capturezone_IndependentMessage";
			control = "Edit";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "'Independent is capturing the zone!'";
			typeName = "STRING";
			validate = "none";
		};
		class UO_FW_Capturezone_CivilianMessage
		{
			displayName = "Civilian Message";
			tooltip = "Message to display when Civilian captures the zone. empty Edit to disable hints";
			property = "UO_FW_Capturezone_CivilianMessage";
			control = "Edit";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "'Civilian is capturing the zone!'";
			typeName = "STRING";
			validate = "none";
		};
		class UO_FW_Capturezone_ContestedMessage
		{
			displayName = "Contested Message";
			tooltip = "Message to display when the zone is contested. empty Edit to disable hints";
			property = "UO_FW_Capturezone_ContestedMessage";
			control = "Edit";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "'The capturezone is contested!'";
			typeName = "STRING";
			validate = "none";
		};
		class UO_FW_Capturezone_UncontestedMessage
		{
			displayName = "Uncontested Message";
			tooltip = "Message to display when the zone is uncontested. empty Edit to disable hints";
			property = "UO_FW_Capturezone_UncontestedMessage";
			control = "Edit";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "'The zone is uncontested!'";
			typeName = "STRING";
			validate = "none";
		};
		class UO_FW_Capturezone_SleepIntervall
		{
			displayName = "Sleep Interval";
			tooltip = "Time between checking the capturezone when noone was in it";
			property = "UO_FW_Capturezone_SleepIntervall";
			control = "EditShort";
			expression = "_this setVariable ['%s',_value,true];";
			defaultValue = "15";
			typeName = "NUMBER";
			validate = "number";
		};
	};
};
