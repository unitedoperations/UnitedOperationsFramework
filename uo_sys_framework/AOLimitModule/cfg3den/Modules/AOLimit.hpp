class UO_FW_AOLimit
{
    displayName = "AO Limit Settings";
    collapsed = 1;
    class Attributes
    {
		class UO_FW_AOLimit_Enabled
			{
				property = "UO_FW_AOLimit_Enabled";
				displayName = "AO Limit Enabled";
				tooltip = "Toggle activation";
				control = "CheckboxState";
				expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
				defaultValue = "false";
			};
        class UO_FW_AOLimit_BluforMarker
			{
				displayName = "Blufor markers";
				tooltip = "List of Marker names without quotes seperated by , for Blufor. Units must spawn inside to be valid.";
				control = "EditArray";
				typeName = "STRING";
				property = "UO_FW_AOLimit_BluforMarker";
				expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
				validate = "none";
				defaultValue = "[]";
			};
			class UO_FW_AOLimit_OpforMarker
			{
				displayName = "Opfor markers";
				tooltip = "List of Marker names without quotes seperated by , for Opfor. Units must spawn inside to be valid.";
				control = "EditArray";
				typeName = "STRING";
				property = "UO_FW_AOLimit_OpforMarker";
				expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
				validate = "none";
				defaultValue = "[]";
			};
			class UO_FW_AOLimit_IndependentMarker
			{
				displayName = "Independent markers";
				tooltip = "List of Marker names without quotes seperated by , for Independent. Units must spawn inside to be valid.";
				control = "EditArray";
				typeName = "STRING";
				property = "UO_FW_AOLimit_IndependentMarker";
				expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
				validate = "none";
				defaultValue = "[]";
			};
			class UO_FW_AOLimit_CivilianMarker
			{
				displayName = "Civilian markers";
				tooltip = "List of Marker names without quotes seperated by , for Civilians. Units must spawn inside to be valid.";
				control = "EditArray";
				typeName = "STRING";
				property = "UO_FW_AOLimit_CivilianMarker";
				expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
				validate = "none";
				defaultValue = "[]";
			};
    };
};