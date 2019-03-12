class EGVAR(ACRE,RadioTypes_CAT_Civilian) {
    displayName = "Radio Configuration";
    collapsed = 0;
    class Attributes {
        class EGVAR(ACRE,SR_Type_Civilian) {
            property = QEGVAR(ACRE,SR_Type_Civilian);
            displayName = "Short Range Radio Type";
            tooltip = "Sets the short range radio type for the side";
            control = QEGVAR(Acre,SR_SELECT);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(ACRE,LR_Type_Civilian) {
            property = QEGVAR(ACRE,LR_Type_Civilian);
            displayName = "Long Range Radio Type";
            tooltip = "Sets the long range radio type for the side";
            control = QEGVAR(Acre,LR_SELECT);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(ACRE,PK_Type_Civilian) {
            property = QEGVAR(ACRE,PK_Type_Civilian);
            displayName = "Long Range Pack Radio Type";
            tooltip = "Sets the long range pack radio type for the side";
            control = QEGVAR(Acre,PK_SELECT);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
    };
};

class EGVAR(Acre,RADIONET_CAT_Civilian) {
    displayName = "Radio Net Configuration";
    collapsed = 0;
    class Attributes {
        class EGVAR(ACRE,RADIONET_Enabled_Civilian) {
            property = QEGVAR(ACRE,RADIONET_Enabled_Civilian);
            displayName = "Enable Radio Net Channel Names";
            control = "CheckBoxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,RADIONET_NAME1_Civilian) {
            property = QEGVAR(ACRE,RADIONET_NAME1_Civilian);
            displayName = "Channel 1 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'PLTNET 1'";
        };
        class EGVAR(ACRE,RADIONET_NAME2_Civilian) {
            property = QEGVAR(ACRE,RADIONET_NAME2_Civilian);
            displayName = "Channel 2 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'PLTNET 2'";
        };
        class EGVAR(ACRE,RADIONET_NAME3_Civilian) {
            property = QEGVAR(ACRE,RADIONET_NAME3_Civilian);
            displayName = "Channel 3 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'PLTNET 3'";
        };
        class EGVAR(ACRE,RADIONET_NAME4_Civilian) {
            property = QEGVAR(ACRE,RADIONET_NAME4_Civilian);
            displayName = "Channel 4 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'PLTNET 4'";
        };
        class EGVAR(ACRE,RADIONET_NAME5_Civilian) {
            property = QEGVAR(ACRE,RADIONET_NAME5_Civilian);
            displayName = "Channel 5 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'COY'";
        };
        class EGVAR(ACRE,RADIONET_NAME6_Civilian) {
            property = QEGVAR(ACRE,RADIONET_NAME6_Civilian);
            displayName = "Channel 6 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'CAS'";
        };
        class EGVAR(ACRE,RADIONET_NAME7_Civilian) {
            property = QEGVAR(ACRE,RADIONET_NAME7_Civilian);
            displayName = "Channel 7 Name";
            tooltip = "Sets the name of the channel";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'FIRES'";
        };
    };
};

class EGVAR(Acre,BABEL_CAT_Civilian) {
    displayName = "Babel Configuration";
    collapsed = 1;
    class Attributes {
        class EGVAR(ACRE,BABEL_Enabled_Civilian) {
            property = QEGVAR(Acre,Babel_Enabled_Civilian);
            displayName = "Enable Babel Languages";
            control = "CheckBoxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,BABEL_EN_Civilian) {
            property = QEGVAR(Acre,Babel_EN_Civilian);
            displayName = "English";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class EGVAR(ACRE,BABEL_RU_Civilian) {
            property = QEGVAR(Acre,Babel_RU_Civilian);
            displayName = "Russian";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,BABEL_FR_Civilian) {
            property = QEGVAR(Acre,Babel_FR_Civilian);
            displayName = "French";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,BABEL_AR_Civilian) {
            property = QEGVAR(Acre,Babel_AR_Civilian);
            displayName = "Arabic";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,BABEL_GK_Civilian) {
            property = QEGVAR(Acre,Babel_GK_Civilian);
            displayName = "Greek";
            tooltip = "Enables the language for this side";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(ACRE,BABEL_Custom_Civilian) {
            property = QEGVAR(Acre,Babel_Custom_Civilian);
            displayName = "Custom Language";
            tooltip = "Define a custom language for this side";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(ACRE,BABEL_Custom2_Civilian) {
            property = QEGVAR(Acre,Babel_Custom2_Civilian);
            displayName = "Custom Language 2";
            tooltip = "Define a custom language for this side";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
    };
};
