class EGVAR(FiremissionVirtual,Settings) {
    displayName = "Firemission Settings";
    collapsed = 0;
    class Attributes {
        class EGVAR(FiremissionVirtual,Enabled) {
            property = QEGVAR(FiremissionVirtual,Enabled);
            displayName = "Firemission Virtual";
            tooltip = "Enables Virtual Firemissions";
            control = "CheckboxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
        };
        class EGVAR(FiremissionVirtual,CallInChannel_Blufor) {
            property = QEGVAR(FiremissionVirtual,CallInChannel_Blufor);
            displayName = "Blufor Artillery channel";
            tooltip = "Blufor FO needs to be on this channel on his non 343 radio to call in a firemission";
            control =  "Edit";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "1";
            typeName = "NUMBER";
        };
        class EGVAR(FiremissionVirtual,CallInChannel_Opfor) {
            property = QEGVAR(FiremissionVirtual,CallInChannel_Opfor);
            displayName = "Opfor Artillery channel";
            tooltip = "Opfor FO needs to be on this channel on his non 343 radio to call in a firemission";
            control =  "Edit";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "1";
            typeName = "NUMBER";
        };
        class EGVAR(FiremissionVirtual,CallInChannel_Indfor) {
            property = QEGVAR(FiremissionVirtual,CallInChannel_Indfor);
            displayName = "Indfor Artillery channel";
            tooltip = "Indfor FO needs to be on this channel on his non 343 radio to call in a firemission";
            control =  "Edit";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "1";
            typeName = "NUMBER";
        };
        class EGVAR(FiremissionVirtual,CallInChannel_Civfor) {
            property = QEGVAR(FiremissionVirtual,CallInChannel_Civfor);
            displayName = "Civfor Artillery channel";
            tooltip = "Civfor FO needs to be on this channel on his non 343 radio to call in a firemission";
            control =  "Edit";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "1";
            typeName = "NUMBER";
        };
       
    };
};
