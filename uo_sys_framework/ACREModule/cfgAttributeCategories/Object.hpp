class EGVAR(ACRE,UnitOptions) {
    displayName = "ACRE Options";
    collapsed = 1;
    class Attributes {
        class EGVAR(ACRE,UNITSETTINGS_Enable) {
            property = QEGVAR(ACRE,UNITSETTINGS_Enable);
            displayName = "Enable ACRE Unit Settings";
            tooltip = "Enables Framework ACRE Settings on this unit";
            control = QEGVAR(Core,CheckBoxStatePlayerOnlyCategory);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "false";
        };
        class EGVAR(ACRE,SR_RADIO_Enabled) {
            property = QEGVAR(ACRE,SR_RADIO_Enabled);
            displayName = "Give Short Range Radio";
            tooltip = "Gives this unit a short range radio defined in ACRE settings";
            control = "CheckBox";
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "false";
        };
        class EGVAR(ACRE,SR_RADIO_CHANNEL) {
            property = QEGVAR(ACRE,SR_RADIO_CHANNEL);
            displayName = "Short Range Radio Channel";
            tooltip = "Sets the short range radio channel of this unit";
            control = QEGVAR(ACRE,ChannelSelect);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "1";
        };
        class EGVAR(ACRE,SR_RADIO_EAR) {
            property = QEGVAR(ACRE,SR_RADIO_EAR);
            displayName = "Short Range Radio Ear";
            tooltip = "Sets the short range radio earpiece setting";
            control = QEGVAR(ACRE,EarSetting);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "0";
        };
        class EGVAR(ACRE,LR_RADIO_Enabled) {
            property = QEGVAR(ACRE,LR_RADIO_Enabled);
            displayName = "Give Long Range Radio";
            tooltip = "Gives this unit a long range radio defined in ACRE settings";
            control = "CheckBox";
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "false";
        };
        class EGVAR(ACRE,LR_RADIO_CHANNEL) {
            property = QEGVAR(ACRE,LR_RADIO_CHANNEL);
            displayName = "Long Range Radio Channel";
            tooltip = "Sets the long range radio channel of this unit";
            control = QEGVAR(ACRE,ChannelSelect);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "1";
        };
        class EGVAR(ACRE,LR_RADIO_EAR) {
            property = QEGVAR(ACRE,LR_RADIO_EAR);
            displayName = "Long Range Radio Ear";
            tooltip = "Sets the long range radio earpiece setting";
            control = QEGVAR(ACRE,EarSetting);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "0";
        };
        class EGVAR(ACRE,PK_RADIO_Enabled) {
            property = QEGVAR(ACRE,PK_RADIO_Enabled);
            displayName = "Give Pack Radio";
            tooltip = "Gives this unit a long range pack radio defined in ACRE settings";
            control = "CheckBox";
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "false";
        };
        class EGVAR(ACRE,PK_RADIO_CHANNEL) {
            property = QEGVAR(ACRE,PK_RADIO_CHANNEL);
            displayName = "Pack Radio Channel";
            tooltip = "Sets the long range pack radio channel of this unit";
            control = QEGVAR(ACRE,ChannelSelect);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "1";
        };
        class EGVAR(ACRE,PK_RADIO_EAR) {
            property = QEGVAR(ACRE,PK_RADIO_EAR);
            displayName = "Pack Radio Ear";
            tooltip = "Sets the long range pack radio earpiece setting";
            control = QEGVAR(ACRE,EarSetting);
            expression = ENTITY_EXPRESSION;
            condition = "objectControllable";
            defaultValue = "0";
        };
    };
};
