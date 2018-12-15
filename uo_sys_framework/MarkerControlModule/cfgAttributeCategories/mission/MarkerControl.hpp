class UO_FW_MarkerControl
{
    displayName = "Marker Control Settings";
    collapsed = 1;
    class Attributes
    {
        class UO_FW_MarkerControl_Enabled
        {
            property = "UO_FW_MarkerControl_Enabled";
            displayName = "Marker Control";
            tooltip = "Enables Marker Control";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value];";
            defaultValue = "true";
            typeName = "BOOL";

        };
        class UO_FW_MarkerControl_BluforMarkers
		{
			displayName = "Blufor markers";
			tooltip = "Markers which are only visible by Blufor. Marker names without quotes and separated by ,";
			control = "EditArray";
			typeName = "STRING";
			property = "UO_FW_MarkerControl_BluforMarkers";
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";
			defaultValue = "[]";
		};
		class UO_FW_MarkerControl_BluforBriefingMarkers
		{
			displayName = "Blufor briefing markers";
			tooltip = "Markers which are only visible by Blufor while briefing. Marker names without quotes and separated by ,";
			control = "EditArray";
			typeName = "STRING";
			property = "UO_FW_MarkerControl_BluforBriefingMarkers";
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";
			defaultValue = "[]";
		};
		 class UO_FW_MarkerControl_OpforMarkers
		{
			displayName = "Opfor markers";
			tooltip = "Markers which are only visible by Opfor. Marker names without quotes and separated by ,";
			control = "EditArray";
			typeName = "STRING";
			property = "UO_FW_MarkerControl_OpforMarkers";
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";
			defaultValue = "[]";
		};
		class UO_FW_MarkerControl_OpforBriefingMarkers
		{
			displayName = "Opfor briefing markers";
			tooltip = "Markers which are only visible by Opfor while briefing. Marker names without quotes and separated by ,";
			control = "EditArray";
			typeName = "STRING";
			property = "UO_FW_MarkerControl_OpforBriefingMarkers";
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";
			defaultValue = "[]";
		};
		 class UO_FW_MarkerControl_IndependentMarkers
		{
			displayName = "Independent markers";
			tooltip = "Markers which are only visible by Independent. Marker names without quotes and separated by ,";
			control = "EditArray";
			typeName = "STRING";
			property = "UO_FW_MarkerControl_IndependentMarkers";
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";
			defaultValue = "[]";
		};
		class UO_FW_MarkerControl_IndependentBriefingMarkers
		{
			displayName = "Independent briefing markers";
			tooltip = "Markers which are only visible by Independent while briefing. Marker names without quotes and separated by ,";
			control = "EditArray";
			typeName = "STRING";
			property = "UO_FW_MarkerControl_IndependentBriefingMarkers";
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";
			defaultValue = "[]";
		};
		 class UO_FW_MarkerControl_CivilianMarkers
		{
			displayName = "Civilian markers";
			tooltip = "Markers which are only visible by Civilian. Marker names without quotes and separated by ,";
			control = "EditArray";
			typeName = "STRING";
			property = "UO_FW_MarkerControl_CivilianMarkers";
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";
			defaultValue = "[]";
		};
		class UO_FW_MarkerControl_CivilianBriefingMarkers
		{
			displayName = "Civilian briefing markers";
			tooltip = "Markers which are only visible by Civilian while briefing. Marker names without quotes and separated by ,";
			control = "EditArray";
			typeName = "STRING";
			property = "UO_FW_MarkerControl_CivilianBriefingMarkers";
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";
			defaultValue = "[]";
		};
		 class UO_FW_MarkerControl_NooneMarkers
		{
			displayName = "Hidden markers";
			tooltip = "Markers which are hidden to all players. Marker names without quotes and separated by ,";
			control = "EditArray";
			typeName = "STRING";
			property = "UO_FW_MarkerControl_NooneMarkers";
			expression = "missionNamespace setVariable ['%s',_value];";
			validate = "none";
			defaultValue = "[]";
		};
    };
};