class UO_FW_AILink {
    displayName = "AI Link Settings";
    collapsed = 1;
    class Attributes {
        class EGVAR(AILink,Enabled) {
            property = QEGVAR(AILink,Enabled);
            displayName = "AI Link";
            tooltip = "Enables AI Link";
            control = "CheckboxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
        };
        class EGVAR(AILink,StartDelay) {
            property = QEGVAR(AILink,StartDelay);
            displayName = "Start Delay";
            tooltip = "Delay in seconds when starting the mission until the first loop runs.";
            control = QMGVAR(30To120Step1_Slider);
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "30";
            typeName = "NUMBER";
        };
        class EGVAR(AILink,ShareDelay) {
            property = QEGVAR(AILink,ShareDelay);
            displayName = "Share Delay";
            tooltip = "Delay in seconds between loops after the first.";
            control = QMGVAR(10To100Step1_Slider);
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "30";
            typeName = "NUMBER";
        };
        class EGVAR(AILink,TransDelay) {
            property = QEGVAR(AILink,TransDelay);
            displayName = "Trans Delay";
            tooltip = "Delay in seconds, maximum randomized, for target information to be transmitted. No effect if set higher than tin_AILink_shareDelay.";
            control = QMGVAR(10To100Step1_Slider);
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "10";
            typeName = "NUMBER";
        };
        class EGVAR(AILink,LRRange) {
            property = QEGVAR(AILink,LRRange);
            displayName = "LR Range";
            tooltip = "Range if both groups have long-range radios, also used if tin_AILink_needRadio is false.";
            control = QMGVAR(500To2500Step100_Slider);
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "800";
            typeName = "NUMBER";
        };
        class EGVAR(AILink,SRRange) {
            property = QEGVAR(AILink,SRRange);
            displayName = "SR Range";
            tooltip = "Range if both groups have short-range radios.";
            control = QMGVAR(300To1000Step100_Slider);
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "400";
            typeName = "NUMBER";
        };
        class EGVAR(AILink,NeedRadio) {
            property = QEGVAR(AILink,NeedRadio);
            displayName = "Need Radio";
            tooltip = "Controls if both AI groups need radios. If false, it will work regardless of radios. Will also perform somewhat better.";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            validate = "none";
            defaultValue = "false";
            typeName = "BOOL";
        };
        class EGVAR(AILink,MaxKnows) {
            property = QEGVAR(AILink,MaxKnows);
            displayName = "Max Knows about";
            tooltip = "The maximum amount that knowsAbout will be set to via this script.";
            control = QMGVAR(1To4Step01_Slider);
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "3.5";
            typeName = "NUMBER";
        };
        class EGVAR(AILink,Debug) {
            property = QEGVAR(AILink,Debug);
            displayName = "Debug?";
            tooltip = "Debug Information; Very spammy.";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            validate = "none";
            defaultValue = "false";
            typeName = "BOOL";
        };
    };
};
