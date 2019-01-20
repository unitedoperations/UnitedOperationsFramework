class UO_FW_EndConditions_Timelimit_Settings {
    displayName = "Timelimit Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_Timelimit_Enabled {
            property = "UO_FW_Timelimit_Enabled";
            displayName = "Mission Time Limit";
            tooltip = "Enables mission time limit";
            control = "CheckboxState";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class UO_FW_Timelimit {
            property = "UO_FW_Timelimit";
            displayName = "Time Limit";
            tooltip = "Ends mission after this time has been reached. Time in minutes";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "30";
        };
        class UO_FW_Timelimit_Message {
            property = "UO_FW_Timelimit_Message";
            displayName = "Time Limit Message";
            tooltip = "Message displayed on time limit reached";
            control = "Edit";
            validate = "string";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'Time Limit Reached!'";
        };
    };
};
