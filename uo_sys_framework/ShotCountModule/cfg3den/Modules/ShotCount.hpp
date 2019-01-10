class UO_FW_ShotCount
{
    displayName = "Shot Count Settings";
    collapsed = 1;
    class Attributes
    {
        class UO_FW_ShotCount_Enabled
        {
            property = "UO_FW_ShotCount_Enabled";
            displayName = "Shot Count";
            tooltip = "Enable Shot Count";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "true";
        };
    };
};
