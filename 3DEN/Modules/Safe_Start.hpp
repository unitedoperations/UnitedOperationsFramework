class UO_FW_Safe_Start
{
    displayName = "Safe Start";
    collapsed = 1;
    class Attributes
    {
        class UO_FW_Safe_Start_Enabled
        {
            property = "UO_FW_Safe_Start_Enabled";
            displayName = "Enable Safe Start";
            tooltip = "Safe Start lowers and engages the safety of the player's weapon on mission start";
            control = "Checkbox";
            expression="missionNamespace setVariable ['%s', _value];";
            defaultValue = "true";
            
        };
    };
};