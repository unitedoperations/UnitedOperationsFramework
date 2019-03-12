class EGVAR(Acre,RadioTypes_CAT_OPFOR) {
    displayName = "Radio Configuration";
    collapsed = 0;
    class Attributes {
        class EGVAR(Acre,SR_Type_OPFOR) {
            property = QEGVAR(Acre,SR_Type_OPFOR);
            displayName = "Short Range Radio Type";
            tooltip = "Sets the short range radio type for the side";
            control = QEGVAR(Acre,SR_SELECT);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(Acre,LR_Type_OPFOR) {
            property = QEGVAR(Acre,LR_Type_OPFOR);
            displayName = "Long Range Radio Type";
            tooltip = "Sets the long range radio type for the side";
            control = QEGVAR(Acre,LR_SELECT);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(Acre,PK_Type_OPFOR) {
            property = QEGVAR(Acre,PK_Type_OPFOR);
            displayName = "Long Range Pack Radio Type";
            tooltip = "Sets the long range pack radio type for the side";
            control = QEGVAR(Acre,PK_SELECT);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
    };
};

class EGVAR(Acre,RADIONET_CAT_OPFOR) {
    displayName = "Radio Net Configuration";
    collapsed = 0;
    class Attributes {
        class EGVAR(Acre,RADIONET_Enabled_OPFOR) {
            property = QEGVAR(Acre,RADIONET_Enabled_OPFOR);
            displayName = "Enable Radio Net Channel Names";
            control = "CheckBoxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(Acre,RADIONET_NAME1_OPFOR) {
            property = QEGVAR(Acre,RADIONET_NAME1_OPFOR);
            displayName = "Channel 1 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'PLTNET 1'";
        };
        class EGVAR(Acre,RADIONET_NAME2_OPFOR) {
            property = QEGVAR(Acre,RADIONET_NAME2_OPFOR);
            displayName = "Channel 2 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'PLTNET 2'";
        };
        class EGVAR(Acre,RADIONET_NAME3_OPFOR) {
            property = QEGVAR(Acre,RADIONET_NAME3_OPFOR);
            displayName = "Channel 3 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'PLTNET 3'";
        };
        class EGVAR(Acre,RADIONET_NAME4_OPFOR) {
            property = QEGVAR(Acre,RADIONET_NAME4_OPFOR);
            displayName = "Channel 4 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'PLTNET 4'";
        };
        class EGVAR(Acre,RADIONET_NAME5_OPFOR) {
            property = QEGVAR(Acre,RADIONET_NAME5_OPFOR);
            displayName = "Channel 5 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'COY'";
        };
        class EGVAR(Acre,RADIONET_NAME6_OPFOR) {
            property = QEGVAR(Acre,RADIONET_NAME6_OPFOR);
            displayName = "Channel 6 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'CAS'";
        };
        class EGVAR(Acre,RADIONET_NAME7_OPFOR) {
            property = QEGVAR(Acre,RADIONET_NAME7_OPFOR);
            displayName = "Channel 7 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'FIRES'";
        };
    };
};

class EGVAR(Acre,BABEL_CAT_OPFOR) {
    displayName = "Babel Configuration";
    collapsed = 1;
    class Attributes {
        class EGVAR(Acre,BABEL_Enabled_OPFOR) {
            property = QEGVAR(Acre,Babel_Enabled_OPFOR);
            displayName = "Enable Babel Languages";
            control = "CheckBoxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(Acre,BABEL_EN_OPFOR) {
            property = QEGVAR(Acre,Babel_EN_OPFOR);
            displayName = "English";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class EGVAR(Acre,BABEL_RU_OPFOR) {
            property = QEGVAR(Acre,Babel_RU_OPFOR);
            displayName = "Russian";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(Acre,BABEL_FR_OPFOR) {
            property = QEGVAR(Acre,Babel_FR_OPFOR);
            displayName = "French";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(Acre,BABEL_AR_OPFOR) {
            property = QEGVAR(Acre,Babel_AR_OPFOR);
            displayName = "Arabic";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(Acre,BABEL_GK_OPFOR) {
            property = QEGVAR(Acre,Babel_GK_OPFOR);
            displayName = "Greek";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(Acre,BABEL_Custom_OPFOR) {
            property = QEGVAR(Acre,Babel_Custom_OPFOR);
            displayName = "Custom Language";
            tooltip = "Define a custom language for this side";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Acre,BABEL_Custom2_OPFOR) {
            property = QEGVAR(Acre,Babel_Custom2_OPFOR);
            displayName = "Custom Language 2";
            tooltip = "Define a custom language for this side";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
    };
};
