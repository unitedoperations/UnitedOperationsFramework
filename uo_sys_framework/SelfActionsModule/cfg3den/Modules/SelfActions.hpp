class EGVAR(SelfActions,Settings) {
    displayName = "Self Action Settings";
    collapsed = 1;
    class Attributes {
        class EGVAR(SelfActions,Enable) {
            property = QEGVAR(SelfActions,Enable);
            displayName = "Self Actions Enable";
            tooltip = "Enable Self Actions";
            control = "CheckboxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class EGVAR(SelfActions,CheckColour_Enabled) {
            property = QEGVAR(SelfActions,CheckColour_Enabled);
            displayName = "Team Colour Action";
            tooltip = "Enable Team Colour Action";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class EGVAR(SelfActions,CheckMap_Enabled) {
            property = QEGVAR(SelfActions,CheckMap_Enabled);
            displayName = "View Map Action";
            tooltip = "Enable View Map Action";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class EGVAR(SelfActions,CutGrass_Enabled) {
            property = QEGVAR(SelfActions,CutGrass_Enabled);
            displayName = "Cut Grass Action";
            tooltip = "Enable Cut Grass Action";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class EGVAR(SelfActions,ParaFlares_Enabled) {
            property = QEGVAR(SelfActions,ParaFlares_Enabled);
            displayName = "Launch ParaFlare Action";
            tooltip = "Enable Launch ParaFlare Action";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(SelfActions,ParaFlare_Brightness) {
            property = QEGVAR(SelfActions,ParaFlare_Brightness);
            displayName = "ParaFlare Brightness";
            tooltip = "Sets the brightness of paraflares";
            control = QMGVAR(15To40Step5_Slider);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "15";
        };
    };
};
