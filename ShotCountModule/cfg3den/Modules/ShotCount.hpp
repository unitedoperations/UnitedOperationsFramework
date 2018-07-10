class ShotCount
{
    displayName = "Shot Count Settings";
    collapsed = 1;
    class Attributes
    {
        class UO_FW_ShotCount_Enable
        {
            property = "UO_FW_ShotCount_Enable";
            displayName = "Shot Count";
            tooltip = "Enable Shot Count";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "true";
        };
    };
};