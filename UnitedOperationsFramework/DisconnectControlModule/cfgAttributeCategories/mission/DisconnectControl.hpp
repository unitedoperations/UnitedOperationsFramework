class UO_FW_DisconnectControl
{
    displayName = "Disconnect Control Settings";
    collapsed = 0;
    class Attributes
    {
        class UO_FW_DisconnectControl_Enabled
        {
            property = "UO_FW_DisconnectControl_Enabled";
            displayName = "Disconnect Control";
            tooltip = "Enables Disconnect Control";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value];";
            defaultValue = "true";
            typeName = "BOOL";

        };
        class UO_FW_DisconnectControl_Time
        {
            property = "UO_FW_DisconnectControl_Time";
            displayName = "Time since start";
            tooltip = "Time for how long disconnected players should be deleted since mission start (in minutes)";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "number";
            defaultValue = "2";
            typeName = "NUMBER";
        };
		class UO_FW_DisconnectControl_BluforDelete
        {
            property = "UO_FW_DisconnectControl_BluforDelete";
            displayName = "Delete Blufor?";
            tooltip = "Should Blufor units be deleted";
			control = "Checkbox";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "none";
            defaultValue = "true";
            typeName = "BOOL";
        };
        class UO_FW_DisconnectControl_OpforDelete
        {
            property = "UO_FW_DisconnectControl_OpforDelete";
            displayName = "Delete Opfor?";
            tooltip = "Should Opfor units be deleted";
			control = "Checkbox";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "none";
            defaultValue = "true";
            typeName = "BOOL";
        };
        class UO_FW_DisconnectControl_IndependentDelete
        {
            property = "UO_FW_DisconnectControl_IndependentDelete";
            displayName = "Delete Independent?";
            tooltip = "Should Independent units be deleted";
			control = "Checkbox";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "none";
            defaultValue = "true";
            typeName = "BOOL";
        };
        class UO_FW_DisconnectControl_CivilianDelete
        {
            property = "UO_FW_DisconnectControl_CivilianDelete";
            displayName = "Delete Civilian?";
            tooltip = "Should Civilian units be deleted";
			control = "Checkbox";
            expression="missionNamespace setVariable ['%s',_value];";
			validate = "none";
            defaultValue = "true";
            typeName = "BOOL";
        };
    };
};