class EGVAR(ACRE,RadioTypes_CAT_Civ) {
    displayName = "Radio Configuration";
    collapsed = 0;
    class Attributes {
        class EGVAR(ACRE,SR_Type_Civ) {
            property = QEGVAR(ACRE,SR_Type_Civ);
            displayName = "Short Range Radio Type";
            tooltip = "Sets the short range radio type for the side";
            control = QEGVAR(ACRE,SR_SELECT);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(ACRE,LR_Type_Civ) {
            property = QEGVAR(ACRE,LR_Type_Civ);
            displayName = "Long Range Radio Type";
            tooltip = "Sets the long range radio type for the side";
            control = QEGVAR(ACRE,LR_SELECT);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(ACRE,PK_Type_Civ) {
            property = QEGVAR(ACRE,PK_Type_Civ);
            displayName = "Long Range Pack Radio Type";
            tooltip = "Sets the long range pack radio type for the side";
            control = QEGVAR(ACRE,PK_SELECT);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
    };
};

class EGVAR(ACRE,RADIONET_CAT_Civ) {
    displayName = "Radio Net Configuration";
    collapsed = 0;
    class Attributes {
        class EGVAR(ACRE,RADIONET_Enabled_Civ) {
            property = QEGVAR(ACRE,RADIONET_Enabled_Civ);
            displayName = "Enable Radio Net Channel Names";
            control = "CheckBoxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,RADIONET_NAME1_Civ) {
            property = QEGVAR(ACRE,RADIONET_NAME1_Civ);
            displayName = "Channel 1 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'PLTNET 1'";
        };
        class EGVAR(ACRE,RADIONET_NAME2_Civ) {
            property = QEGVAR(ACRE,RADIONET_NAME2_Civ);
            displayName = "Channel 2 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'PLTNET 2'";
        };
        class EGVAR(ACRE,RADIONET_NAME3_Civ) {
            property = QEGVAR(ACRE,RADIONET_NAME3_Civ);
            displayName = "Channel 3 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'PLTNET 3'";
        };
        class EGVAR(ACRE,RADIONET_NAME4_Civ) {
            property = QEGVAR(ACRE,RADIONET_NAME4_Civ);
            displayName = "Channel 4 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'PLTNET 4'";
        };
        class EGVAR(ACRE,RADIONET_NAME5_Civ) {
            property = QEGVAR(ACRE,RADIONET_NAME5_Civ);
            displayName = "Channel 5 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'COY'";
        };
        class EGVAR(ACRE,RADIONET_NAME6_Civ) {
            property = QEGVAR(ACRE,RADIONET_NAME6_Civ);
            displayName = "Channel 6 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'CAS'";
        };
        class EGVAR(ACRE,RADIONET_NAME7_Civ) {
            property = QEGVAR(ACRE,RADIONET_NAME7_Civ);
            displayName = "Channel 7 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'FIRES'";
        };
    };
};

class EGVAR(ACRE,BABEL_CAT_Civ) {
    displayName = "Babel Configuration";
    collapsed = 1;
    class Attributes {
        class EGVAR(ACRE,BABEL_Enabled_Civ) {
            property = QEGVAR(ACRE,Babel_Enabled_Civ);
            displayName = "Enable Babel Languages";
            control = "CheckBoxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,BABEL_EN_Civ) {
            property = QEGVAR(ACRE,Babel_EN_Civ);
            displayName = "English";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class EGVAR(ACRE,BABEL_RU_Civ) {
            property = QEGVAR(ACRE,Babel_RU_Civ);
            displayName = "Russian";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,BABEL_FR_Civ) {
            property = QEGVAR(ACRE,Babel_FR_Civ);
            displayName = "French";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,BABEL_AR_Civ) {
            property = QEGVAR(ACRE,Babel_AR_Civ);
            displayName = "Arabic";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,BABEL_GK_Civ) {
            property = QEGVAR(ACRE,Babel_GK_Civ);
            displayName = "Greek";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,BABEL_Custom_Civ) {
            property = QEGVAR(ACRE,Babel_Custom_Civ);
            displayName = "Custom Language";
            tooltip = "Define a custom language for this side";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(ACRE,BABEL_Custom2_Civ) {
            property = QEGVAR(ACRE,Babel_Custom2_Civ);
            displayName = "Custom Language 2";
            tooltip = "Define a custom language for this side";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
    };
};
