class UO_FW_EndConditions_MainSettings_Category6 {
    displayName = "Category Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_EndCondition_Enabled_6 {
            property = "UO_FW_EndCondition_Enabled_6";
            displayName = "Enable Category";
            tooltip = "Toggle Activation of the End Condition Category";
            control = "CheckBoxState";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class UO_FW_EndCondition_Mode_6 {
            property = "UO_FW_EndCondition_Mode_6";
            displayName = "Category Mode";
            tooltip = "Whether or not the condition fires if any condition is true, or if all conditions are true. Extract condition must be true in both cases.";
            control = "UO_FW_EndConditions_ModeAttribute";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "0";
        };
        class UO_FW_EndCondition_Message_6 {
            property = "UO_FW_EndCondition_Message_6";
            displayName = "Category Message";
            tooltip = "Message displayed when end condition category is triggered";
            control = "Edit";
            validate = "string";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'End condition 6 fired!'";
        };
    };
};

class UO_FW_EndConditions_CasualtySettings_Category6 {
    displayName = "Casualty Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_EndCondition_CasualtyCount_BLUFOR_Enabled_6 {
            property = "UO_FW_EndCondition_CasualtyCount_BLUFOR_Enabled_6";
            displayName = "BLUFOR Casualty";
            tooltip = "Enables casualty limit for this team";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class UO_FW_EndCondition_CasualtyCount_BLUFOR_Percentage_6 {
            property = "UO_FW_EndCondition_CasualtyCount_BLUFOR_Percentage_6";
            displayName = "Casualty Percentage";
            tooltip = "End condition fires when team casualty percentage is over this number";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "75";
        };
        class UO_FW_EndCondition_CasualtyCount_OPFOR_Enabled_6 {
            property = "UO_FW_EndCondition_CasualtyCount_OPFOR_Enabled_6";
            displayName = "OPFOR Casualty";
            tooltip = "Enables casualty limit for this team";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class UO_FW_EndCondition_CasualtyCount_OPFOR_Percentage_6 {
            property = "UO_FW_EndCondition_CasualtyCount_OPFOR_Percentage_6";
            displayName = "Casualty Percentage";
            tooltip = "End condition fires when team casualty percentage is over this number";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "75";
        };
        class UO_FW_EndCondition_CasualtyCount_RESISTANCE_Enabled_6 {
            property = "UO_FW_EndCondition_CasualtyCount_RESISTANCE_Enabled_6";
            displayName = "INDFOR Casualty";
            tooltip = "Enables casualty limit for this team";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class UO_FW_EndCondition_CasualtyCount_RESISTANCE_Percentage_6 {
            property = "UO_FW_EndCondition_CasualtyCount_RESISTANCE_Percentage_6";
            displayName = "Casualty Percentage";
            tooltip = "End condition fires when team casualty percentage is over this number";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "75";
        };
        class UO_FW_EndCondition_CasualtyCount_CIVILIAN_Enabled_6 {
            property = "UO_FW_EndCondition_CasualtyCount_CIVILIAN_Enabled_6";
            displayName = "CIVILIAN Casualty";
            tooltip = "Enables casualty limit for this team";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class UO_FW_EndCondition_CasualtyCount_CIVILIAN_Percentage_6 {
            property = "UO_FW_EndCondition_CasualtyCount_CIVILIAN_Percentage_6";
            displayName = "Casualty Percentage";
            tooltip = "End condition fires when team casualty percentage is over this number";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "75";
        };
    };
};

class UO_FW_EndConditions_EntitySettings_Category6 {
    displayName = "Entity Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_EndCondition_EntitiesAlive_Array_6 {
            property = "UO_FW_EndCondition_EntitiesAlive_Array_6";
            displayName = "Alive Entities";
            tooltip = "Array of entities checked for alive status. Leave blank to disable";
            control = "EditArray";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "[]";
        };
        class UO_FW_EndCondition_EntitiesDead_Array_6 {
            property = "UO_FW_EndCondition_EntitiesDead_Array_6";
            displayName = "Dead Entities";
            tooltip = "Array of entities checked for dead status. Leave blank to disable";
            control = "EditArray";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "[]";
        };
        class UO_FW_EndCondition_EntitiesDamaged_Array_6 {
            property = "UO_FW_EndCondition_EntitiesDamaged_Array_6";
            displayName = "Damaged Entities";
            tooltip = "Array of entities checked for over 50 percent damage or immobilized status. Includes dead state. Leave blank to disable";
            control = "EditArray";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "[]";
        };
    };
};

class UO_FW_EndConditions_HostageSettings_Category6 {
    displayName = "Hostage Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_EndCondition_HostageRescued_Array_6 {
            property = "UO_FW_EndCondition_HostageRescued_Array_6";
            displayName = "Hostage(s) Rescued";
            tooltip = "Array of hostages that must be rescued for the end condition to fire. leave blank to disable.";
            control = "EditArray";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "[]";
        };
    };
};

class UO_FW_EndConditions_VariableSettings_Category6 {
    displayName = "Custom Variable Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_EndCondition_CustomVariables_Array_6 {
            property = "UO_FW_EndCondition_CustomVariables_Array_6";
            displayName = "Custom Variables";
            tooltip = "Array of variables to check for true status. Leave blank to disable";
            control = "EditArray";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "[]";
        };
    };
};

class UO_FW_EndConditions_ExtractionSettings_Category6 {
    displayName = "Extraction Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_EndCondition_ExtractionEnabled_6 {
            property = "UO_FW_EndCondition_ExtractionEnabled_6";
            displayName = "Require Extraction";
            tooltip = "Require Extraction in addition to end conditions for this category.";
            control = "CheckBoxState";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class UO_FW_EndCondition_ExtractionTeam_6 {
            property = "UO_FW_EndCondition_ExtractionTeam_6";
            displayName = "Team";
            tooltip = "Team required to be in extract area.";
            control = "UO_FW_EndConditions_ExtractTeam";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
        class UO_FW_EndCondition_ExtractionMarker_6 {
            property = "UO_FW_EndCondition_ExtractionMarker_6";
            displayName = "Extraction Marker";
            tooltip = "Marker name of extraction area.";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_EndCondition_ExtractionRatio_6 {
            property = "UO_FW_EndCondition_ExtractionRatio_6";
            displayName = "Ratio";
            tooltip = "Percentage of alive personnel inside the marker to be considered extracted. Default 75";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "75";
        };
    };
};

class UO_FW_EndConditions_CaptureZoneSettings_Category6 {
    displayName = "CaptureZone Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_EndCondition_CaptureZoneCaptured_Array_6 {
            property = "UO_FW_EndCondition_CaptureZoneCaptured_Array_6";
            displayName = "CaptureZone Names";
            tooltip = "List of CaptureZones names that must be captured for the end condition to fire. Leave empty to disable.";
            control = "EditArray";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "[]";
        };
        class UO_FW_EndCondition_CaptureZoneCaptured_Team_6 {
            property = "UO_FW_EndCondition_CaptureZoneCaptured_Team_6";
            displayName = "CaptureZone Team";
            tooltip = "Team that must activate the CaptureZones for the condition to fire.";
            control = "UO_FW_EndConditions_CaptureZoneTeam";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "1";
        };
    };
};
