class UO_FW_CoverMap
{
    displayName = "Cover Map Settings";
    collapsed = 1;
    class Attributes
    {
        class UO_FW_CoverMap_Enable
        {
            property = "UO_FW_CoverMap_Enable";
            displayName = "Cover Map Module";
            tooltip = "Enable Cover Map Module";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "false";
        };
				class UO_FW_CoverMap_AllowSwitching
        {
            property = "UO_FW_CoverMap_AllowSwitching";
            displayName = "Allow Map AO Switching";
            tooltip = "Allow players to switch AOs their character has defined via ace interaction in the map";
            control = "Checkbox";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "false";
        };
				class UO_FW_CoverMap_DefaultAO_West
        {
            property = "UO_FW_CoverMap_DefaultAO_West";
            displayName = "BLUFOR Starting AO";
            tooltip = "Set the BLUFOR Map area to corresponding CoverMap AO name.";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "'Area0'";
            validate = "STRING";
        };
				class UO_FW_CoverMap_DefaultAO_East
        {
            property = "UO_FW_CoverMap_DefaultAO_East";
            displayName = "OPFOR Starting AO";
            tooltip = "Set the OPFOR Map area to corresponding CoverMap AO name.";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "'Area0'";
            validate = "STRING";
        };
				class UO_FW_CoverMap_DefaultAO_Indfor
        {
            property = "UO_FW_CoverMap_DefaultAO_Indfor";
            displayName = "INDFOR Starting AO";
            tooltip = "Set the INDFOR Map area to corresponding CoverMap AO name.";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "'Area0'";
            validate = "STRING";
        };
				class UO_FW_CoverMap_DefaultAO_Civ
        {
            property = "UO_FW_CoverMap_DefaultAO_Civ";
            displayName = "Civilian Starting AO";
            tooltip = "Set the Civilian Map area to corresponding CoverMap AO name.";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "'Area0'";
            validate = "STRING";
        };
    };
};
