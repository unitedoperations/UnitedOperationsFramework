class UO_FW_DisconnectControl {
    displayName = "Disconnect Control Settings";
    collapsed = 1;
    class Attributes {
        class EGVAR(DisconnectControl,Enabled) {
            property = QEGVAR(DisconnectControl,Enabled);
            displayName = "Disconnect Control";
            tooltip = "Enables Disconnect Control";
            control = "CheckboxState";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "true";
            typeName = "BOOL";
        };
        class EGVAR(DisconnectControl,Time) {
            property = QEGVAR(DisconnectControl,Time);
            displayName = "Time since start";
            tooltip = "Time for how long disconnected players should be deleted since mission start (in minutes)";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "2";
            typeName = "NUMBER";
        };
        class EGVAR(DisconnectControl,BluforDelete) {
            property = QEGVAR(DisconnectControl,BluforDelete);
            displayName = "Delete Blufor?";
            tooltip = "Should Blufor units be deleted";
            control = "Checkbox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "none";
            defaultValue = "true";
            typeName = "BOOL";
        };
        class EGVAR(DisconnectControl,OpforDelete) {
            property = QEGVAR(DisconnectControl,OpforDelete);
            displayName = "Delete Opfor?";
            tooltip = "Should Opfor units be deleted";
            control = "Checkbox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "none";
            defaultValue = "true";
            typeName = "BOOL";
        };
        class EGVAR(DisconnectControl,IndforDelete) {
            property = QEGVAR(DisconnectControl,IndforDelete);
            displayName = "Delete Independent?";
            tooltip = "Should Independent units be deleted";
            control = "Checkbox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "none";
            defaultValue = "true";
            typeName = "BOOL";
        };
        class EGVAR(DisconnectControl,CIVDelete) {
            property = QEGVAR(DisconnectControl,CIVDelete);
            displayName = "Delete Civilian?";
            tooltip = "Should Civilian units be deleted";
            control = "Checkbox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "none";
            defaultValue = "true";
            typeName = "BOOL";
        };
    };
};
