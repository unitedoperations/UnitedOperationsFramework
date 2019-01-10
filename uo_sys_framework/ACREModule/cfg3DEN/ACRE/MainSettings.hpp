class UO_FW_MAIN_ACRE_SETTINGS_CAT
{
    displayName = "Main ACRE Settings";
    collapsed = 0;
    class Attributes
    {
		class UO_FW_ACRE_SETTINGS_ENABLED
        {
            property = "UO_FW_ACRE_SETTINGS_ENABLED";
            displayName = "Enable ACRE Framework";
            tooltip = "Toggle activation";
            control = "CheckBoxState";
            expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "false";
        };
        class UO_FW_ACRE_SCRAMBLE_ENABLED
        {
            property = "UO_FW_ACRE_SCRAMBLE_ENABLED";
            displayName = "Enable Frequency Scramble";
            tooltip = "Toggle frequency scrambling";
            control = "CheckBox";
            expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "false";
        };
		class UO_FW_ACRE_BABEL_ENABLED
        {
            property = "UO_FW_ACRE_BABEL_ENABLED";
            displayName = "Enable Babel";
            tooltip = "Toggle Babel activation";
            control = "CheckBox";
            expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "false";
        };
    };
};
