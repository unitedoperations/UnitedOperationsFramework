class UO_FW_CoverMap {
    displayName = "Cover Map Settings";
    collapsed = 1;
    class Attributes {
        class EGVAR(CoverMap,Enable) {
            property = QEGVAR(CoverMap,Enable);
            displayName = "Cover Map Module";
            tooltip = "Enable Cover Map Module";
            control = "CheckboxState";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(CoverMap,AllowSwitching) {
            property = QEGVAR(CoverMap,AllowSwitching);
            displayName = "Allow Map AO Switching";
            tooltip = "Allow players to switch AOs their character has defined via ace interaction in the map";
            control = "Checkbox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(CoverMap,DefaultAO_BLUFOR) {
            property = QEGVAR(CoverMap,DefaultAO_BLUFOR);
            displayName = "BLUFOR Starting AO";
            tooltip = "Set the BLUFOR Map area to corresponding CoverMap AO name.";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'Area0'";
            validate = "STRING";
        };
        class EGVAR(CoverMap,DefaultAO_OPFOR) {
            property = QEGVAR(CoverMap,DefaultAO_OPFOR);
            displayName = "OPFOR Starting AO";
            tooltip = "Set the OPFOR Map area to corresponding CoverMap AO name.";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'Area0'";
            validate = "STRING";
        };
        class EGVAR(CoverMap,DefaultAO_Indfor) {
            property = QEGVAR(CoverMap,DefaultAO_Indfor);
            displayName = "INDFOR Starting AO";
            tooltip = "Set the INDFOR Map area to corresponding CoverMap AO name.";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'Area0'";
            validate = "STRING";
        };
        class EGVAR(CoverMap,DefaultAO_Civilian) {
            property = QEGVAR(CoverMap,DefaultAO_Civ);
            displayName = "Civilian Starting AO";
            tooltip = "Set the Civilian Map area to corresponding CoverMap AO name.";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'Area0'";
            validate = "STRING";
        };
    };
};
