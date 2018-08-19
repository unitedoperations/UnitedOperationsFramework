class UO_FW_SoftAOLimit
{
    displayName = "Soft AO Limit Settings";
    collapsed = 1;
    class Attributes
    {
	 	class UO_FW_SoftAoLimit_Enabled
        {
            property = "UO_FW_SoftAoLimit_Enabled";
            displayName = "Soft AO Limit enabled";
            tooltip = "Toggle activation";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "false";
        };
		class UO_FW_SoftAoLimit_TimeOutside
		{
			displayName = "Max time outside of AO";
			tooltip = "The amount of time in seconds a land based unit is allowed to stay outside the AO (-1 = Infinity)";
			control = "Edit";
			typeName = "NUMBER";
			property = "UO_FW_SoftAoLimit_TimeOutside";
			expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
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
			expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
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
			expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
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
			expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
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
			expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
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
			expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
			validate = "none";
			defaultValue = "[]";
		};
	
    };
};