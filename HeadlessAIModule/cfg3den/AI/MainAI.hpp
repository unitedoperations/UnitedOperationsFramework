class MainAI
{
    displayName = "AI Settings";
    collapsed = 0;
    class Attributes
    {
		class UO_FW_AI_Enabled
        {
            property = "UO_FW_AI_Enabled";
            displayName = "Enable AI System";
            tooltip = "Enable AI System";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "false";
            
        };
        class UO_FW_AI_MARKERS
        {
            property = "UO_FW_AI_MARKERS";
            displayName = "Debug Markers";
            tooltip = "Enables Debug Markers for AI";
            control = "Checkbox";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "false";
            
        };
    };
};