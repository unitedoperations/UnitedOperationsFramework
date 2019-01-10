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
		    	displayName = "Blufor Markers";
		    	tooltip = "Markers which are only visible by Blufor. Marker names or 3DEN layer names without quotes and seperated by ,";
		    	control = "EditArray";
		    	typeName = "STRING";
		    	property = "UO_FW_MarkerControl_BluforMarkers";
		    	expression = "missionNamespace setVariable ['%s',_value];";
		    	validate = "none";
		    	defaultValue = "[]";
		    };
		    class UO_FW_MarkerControl_BluforBriefingMarkers
		    {
		    	displayName = "Blufor briefing Markers";
		    	tooltip = "Markers which are only visible by Blufor during the briefing. Marker names or 3DEN layer names without quotes and seperated by ,";
		    	control = "EditArray";
		    	typeName = "STRING";
		    	property = "UO_FW_MarkerControl_BluforBriefingMarkers";
		    	expression = "missionNamespace setVariable ['%s',_value];";
		    	validate = "none";
		    	defaultValue = "[]";
		    };
		     class UO_FW_MarkerControl_OpforMarkers
		    {
		    	displayName = "Opfor Markers";
		    	tooltip = "Markers which are only visible by Opfor. Marker names or 3DEN layer names without quotes and seperated by ,";
		    	control = "EditArray";
		    	typeName = "STRING";
		    	property = "UO_FW_MarkerControl_OpforMarkers";
		    	expression = "missionNamespace setVariable ['%s',_value];";
		    	validate = "none";
		    	defaultValue = "[]";
		    };
		    class UO_FW_MarkerControl_OpforBriefingMarkers
		    {
		    	displayName = "Opfor briefing Markers";
		    	tooltip = "Markers which are only visible by Opfor during the briefing. Marker names or 3DEN layer names without quotes and seperated by ,";
		    	control = "EditArray";
		    	typeName = "STRING";
		    	property = "UO_FW_MarkerControl_OpforBriefingMarkers";
		    	expression = "missionNamespace setVariable ['%s',_value];";
		    	validate = "none";
		    	defaultValue = "[]";
		    };
		     class UO_FW_MarkerControl_IndependentMarkers
		    {
		    	displayName = "Independent Markers";
		    	tooltip = "Markers which are only visible by Independent. Marker names or 3DEN layer names without quotes and seperated by ,";
		    	control = "EditArray";
		    	typeName = "STRING";
		    	property = "UO_FW_MarkerControl_IndependentMarkers";
		    	expression = "missionNamespace setVariable ['%s',_value];";
		    	validate = "none";
		    	defaultValue = "[]";
		    };
		    class UO_FW_MarkerControl_IndependentBriefingMarkers
		    {
		    	displayName = "Independent briefing Markers";
		    	tooltip = "Markers which are only visible by Independent during the briefing. Marker names or 3DEN layer names without quotes and seperated by ,";
		    	control = "EditArray";
		    	typeName = "STRING";
		    	property = "UO_FW_MarkerControl_IndependentBriefingMarkers";
		    	expression = "missionNamespace setVariable ['%s',_value];";
		    	validate = "none";
		    	defaultValue = "[]";
		    };
		     class UO_FW_MarkerControl_CivilianMarkers
		    {
		    	displayName = "Civilian Markers";
		    	tooltip = "Markers which are only visible by Civilian. Marker names or 3DEN layer names without quotes and seperated by ,";
		    	control = "EditArray";
		    	typeName = "STRING";
		    	property = "UO_FW_MarkerControl_CivilianMarkers";
					expression = "missionNamespace setVariable ['%s',_value];";
		    	validate = "none";
		    	defaultValue = "[]";
		    };
		    class UO_FW_MarkerControl_CivilianBriefingMarkers
		    {
		    	displayName = "Civilian briefing Markers";
		    	tooltip = "Markers which are only visible by Civilian during the briefing. Marker names or 3DEN layer names without quotes and seperated by ,";
		    	control = "EditArray";
		    	typeName = "STRING";
		    	property = "UO_FW_MarkerControl_CivilianBriefingMarkers";
		    	expression = "missionNamespace setVariable ['%s',_value];";
		    	validate = "none";
		    	defaultValue = "[]";
		    };
		     class UO_FW_MarkerControl_SystemMarkers
		    {
		    	displayName = "System Markers";
		    	tooltip = "Markers which are not visible. Marker names or 3DEN layer names without quotes and seperated by ,";
		    	control = "EditArray";
		    	typeName = "STRING";
		    	property = "UO_FW_MarkerControl_SystemMarkers";
		    	expression = "missionNamespace setVariable ['%s',_value];";
		    	validate = "none";
		    	defaultValue = "[]";
		    };
    };
};
