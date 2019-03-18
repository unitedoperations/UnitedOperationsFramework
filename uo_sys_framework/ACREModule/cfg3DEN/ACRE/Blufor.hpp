class EGVAR(ACRE,RadioTypes_CAT_BLUFOR) {
    displayName = "Radio Configuration";
    collapsed = 0;
    class Attributes {
        class EGVAR(ACRE,SR_Type_BLUFOR) {
            property = QEGVAR(ACRE,SR_Type_BLUFOR);
            displayName = "Short Range Radio Type";
            tooltip = "Sets the short range radio type for the side";
            control = QEGVAR(ACRE,SR_SELECT);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(ACRE,LR_Type_BLUFOR) {
            property = QEGVAR(ACRE,LR_Type_BLUFOR);
            displayName = "Long Range Radio Type";
            tooltip = "Sets the long range radio type for the side";
            control = QEGVAR(ACRE,LR_SELECT);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(ACRE,PK_Type_BLUFOR) {
            property = QEGVAR(ACRE,PK_Type_BLUFOR);
            displayName = "Long Range Pack Radio Type";
            tooltip = "Sets the long range pack radio type for the side";
            control = QEGVAR(ACRE,PK_SELECT);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
    };
};

class EGVAR(ACRE,RADIONET_CAT_BLUFOR) {
    displayName = "Radio Net Configuration";
    collapsed = 0;
    class Attributes {
        class EGVAR(ACRE,RADIONET_Enabled_BLUFOR) {
            property = QEGVAR(ACRE,RADIONET_Enabled_BLUFOR);
            displayName = "Enable Radio Net Channel Names";
            control = "CheckBoxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,RADIONET_NAME1_BLUFOR) {
            property = QEGVAR(ACRE,RADIONET_NAME1_BLUFOR);
            displayName = "Channel 1 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'PLTNET 1'";
        };
        class EGVAR(ACRE,RADIONET_NAME2_BLUFOR) {
            property = QEGVAR(ACRE,RADIONET_NAME2_BLUFOR);
            displayName = "Channel 2 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'PLTNET 2'";
        };
        class EGVAR(ACRE,RADIONET_NAME3_BLUFOR) {
            property = QEGVAR(ACRE,RADIONET_NAME3_BLUFOR);
            displayName = "Channel 3 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'PLTNET 3'";
        };
        class EGVAR(ACRE,RADIONET_NAME4_BLUFOR) {
            property = QEGVAR(ACRE,RADIONET_NAME4_BLUFOR);
            displayName = "Channel 4 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'PLTNET 4'";
        };
        class EGVAR(ACRE,RADIONET_NAME5_BLUFOR) {
            property = QEGVAR(ACRE,RADIONET_NAME5_BLUFOR);
            displayName = "Channel 5 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'COY'";
        };
        class EGVAR(ACRE,RADIONET_NAME6_BLUFOR) {
            property = QEGVAR(ACRE,RADIONET_NAME6_BLUFOR);
            displayName = "Channel 6 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'CAS'";
        };
        class EGVAR(ACRE,RADIONET_NAME7_BLUFOR) {
            property = QEGVAR(ACRE,RADIONET_NAME7_BLUFOR);
            displayName = "Channel 7 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'FIRES'";
        };
    };
};

class EGVAR(ACRE,BABEL_CAT_BLUFOR) {
    displayName = "Babel Configuration";
    collapsed = 1;
    class Attributes {
        class EGVAR(ACRE,BABEL_Enabled_BLUFOR) {
            property = QEGVAR(ACRE,Babel_Enabled_BLUFOR);
            displayName = "Enable Babel Languages";
            control = "CheckBoxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,BABEL_EN_BLUFOR) {
            property = QEGVAR(ACRE,Babel_EN_BLUFOR);
            displayName = "English";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class EGVAR(ACRE,BABEL_RU_BLUFOR) {
            property = QEGVAR(ACRE,Babel_RU_BLUFOR);
            displayName = "Russian";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,BABEL_FR_BLUFOR) {
            property = QEGVAR(ACRE,Babel_FR_BLUFOR);
            displayName = "French";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,BABEL_AR_BLUFOR) {
            property = QEGVAR(ACRE,Babel_AR_BLUFOR);
            displayName = "Arabic";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,BABEL_GK_BLUFOR) {
            property = QEGVAR(ACRE,Babel_GK_BLUFOR);
            displayName = "Greek";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,BABEL_Custom_BLUFOR) {
            property = QEGVAR(ACRE,Babel_Custom_BLUFOR);
            displayName = "Custom Language";
            tooltip = "Define a custom language for this side";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(ACRE,BABEL_Custom2_BLUFOR) {
            property = QEGVAR(ACRE,Babel_Custom2_BLUFOR);
            displayName = "Custom Language 2";
            tooltip = "Define a custom language for this side";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
    };
};
