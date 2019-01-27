class UO_FW_AILink {
    displayName = "AI Link Settings";
    collapsed = 1;
    class Attributes {
        class UO_FW_AILink_Enabled {
            property = "UO_FW_AILink_Enabled";
            displayName = "AI Link";
            tooltip = "Enables AI Link";
            control = "CheckboxState";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
        };
        class UO_FW_AILink_StartDelay {
            property = "UO_FW_AILink_StartDelay";
            displayName = "Start Delay";
            tooltip = "Delay in seconds when starting the mission until the first loop runs.";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "30";
            typeName = "NUMBER";
        };
        class UO_FW_AILink_ShareDelay {
            property = "UO_FW_AILink_ShareDelay";
            displayName = "Share Delay";
            tooltip = "Delay in seconds  between loops after the first.";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "15";
            typeName = "NUMBER";
        };
        class UO_FW_AILink_TransDelay {
            property = "UO_FW_AILink_TransDelay";
            displayName = "Trans Delay";
            tooltip = "Delay in seconds, maximum randomized, for target information to be transmitted. No effect if set higher than tin_AILink_shareDelay.";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "10";
            typeName = "NUMBER";
        };
        class UO_FW_AILink_LRRange {
            property = "UO_FW_AILink_LRRange";
            displayName = "LR Range";
            tooltip = "Range if both groups have long-range radios, also used if tin_AILink_needRadio is false.";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "800";
            typeName = "NUMBER";
        };
        class UO_FW_AILink_SRRange {
            property = "UO_FW_AILink_SRRange";
            displayName = "SR Range";
            tooltip = "Range if both groups have short-range radios.";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "400";
            typeName = "NUMBER";
        };
        class UO_FW_AILink_NeedRadio {
            property = "UO_FW_AILink_NeedRadio";
            displayName = "Need Radio";
            tooltip = "Controls if both AI groups need radios. If false, it will work regardless of radios. Will also perform somewhat better.";
            control = "Checkbox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "none";
            defaultValue = "false";
            typeName = "BOOL";
        };
        class UO_FW_AILink_MaxKnows {
            property = "UO_FW_AILink_MaxKnows";
            displayName = "Max Knows about";
            tooltip = "The maximum amount that knowsAbout will be set to via this script.";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "3.5";
            typeName = "NUMBER";
        };
        class UO_FW_AILink_Debug {
            property = "UO_FW_AILink_Debug";
            displayName = "Debug?";
            tooltip = "Debug Information; Very spammy.";
            control = "Checkbox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "none";
            defaultValue = "false";
            typeName = "BOOL";
        };
    };
};
