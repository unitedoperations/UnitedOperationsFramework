class UO_FW_EndConditions_MainSettings_Category5 {
    displayName = "Category Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_EndCondition_Enabled_5 {
            property = "UO_FW_EndCondition_Enabled_5";
            displayName = "Enable Category";
            tooltip = "Toggle Activation of the End Condition Category";
            control = "CheckBoxState";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class UO_FW_EndCondition_Mode_5 {
            property = "UO_FW_EndCondition_Mode_5";
            displayName = "Category Mode";
            tooltip = "Whether or not the condition fires if any condition is true, or if all conditions are true. Extract condition must be true in both cases.";
            control = "UO_FW_EndConditions_ModeAttribute";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "0";
        };
        class UO_FW_EndCondition_Message_5 {
            property = "UO_FW_EndCondition_Message_5";
            displayName = "Category Message";
            tooltip = "Message displayed when end condition category is triggered";
            control = "Edit";
            validate = "string";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'End condition 5 fired!'";
        };
    };
};

class UO_FW_EndConditions_CasualtySettings_Category5 {
    displayName = "Casualty Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_EndCondition_CasualtyCount_BLUFOR_Enabled_5 {
            property = "UO_FW_EndCondition_CasualtyCount_BLUFOR_Enabled_5";
            displayName = "BLUFOR Casualty";
            tooltip = "Enables casualty limit for this team";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class UO_FW_EndCondition_CasualtyCount_BLUFOR_Percentage_5 {
            property = "UO_FW_EndCondition_CasualtyCount_BLUFOR_Percentage_5";
            displayName = "Casualty Percentage";
            tooltip = "End condition fires when team casualty percentage is over this number";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "75";
        };
        class UO_FW_EndCondition_CasualtyCount_OPFOR_Enabled_5 {
            property = "UO_FW_EndCondition_CasualtyCount_OPFOR_Enabled_5";
            displayName = "OPFOR Casualty";
            tooltip = "Enables casualty limit for this team";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class UO_FW_EndCondition_CasualtyCount_OPFOR_Percentage_5 {
            property = "UO_FW_EndCondition_CasualtyCount_OPFOR_Percentage_5";
            displayName = "Casualty Percentage";
            tooltip = "End condition fires when team casualty percentage is over this number";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "75";
        };
        class UO_FW_EndCondition_CasualtyCount_INDFOR_Enabled_5 {
            property = "UO_FW_EndCondition_CasualtyCount_INDFOR_Enabled_5";
            displayName = "INDFOR Casualty";
            tooltip = "Enables casualty limit for this team";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class UO_FW_EndCondition_CasualtyCount_INDFOR_Percentage_5 {
            property = "UO_FW_EndCondition_CasualtyCount_INDFOR_Percentage_5";
            displayName = "Casualty Percentage";
            tooltip = "End condition fires when team casualty percentage is over this number";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "75";
        };
        class UO_FW_EndCondition_CasualtyCount_CIV_Enabled_5 {
            property = "UO_FW_EndCondition_CasualtyCount_CIV_Enabled_5";
            displayName = "CIVILIAN Casualty";
            tooltip = "Enables casualty limit for this team";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class UO_FW_EndCondition_CasualtyCount_CIV_Percentage_5 {
            property = "UO_FW_EndCondition_CasualtyCount_CIV_Percentage_5";
            displayName = "Casualty Percentage";
            tooltip = "End condition fires when team casualty percentage is over this number";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "75";
        };
    };
};

class UO_FW_EndConditions_EntitySettings_Category5 {
    displayName = "Entity Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_EndCondition_EntitiesAlive_Array_5 {
            property = "UO_FW_EndCondition_EntitiesAlive_Array_5";
            displayName = "Alive Entities";
            tooltip = "Array of entities checked for alive status. Leave blank to disable";
            control = "EditArray";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "[]";
        };
        class UO_FW_EndCondition_EntitiesDead_Array_5 {
            property = "UO_FW_EndCondition_EntitiesDead_Array_5";
            displayName = "Dead Entities";
            tooltip = "Array of entities checked for dead status. Leave blank to disable";
            control = "EditArray";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "[]";
        };
        class UO_FW_EndCondition_EntitiesDamaged_Array_5 {
            property = "UO_FW_EndCondition_EntitiesDamaged_Array_5";
            displayName = "Damaged Entities";
            tooltip = "Array of entities checked for over 50 percent damage or immobilized status. Includes dead state. Leave blank to disable";
            control = "EditArray";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "[]";
        };
    };
};

class UO_FW_EndConditions_HostageSettings_Category5 {
    displayName = "Hostage Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_EndCondition_HostageRescued_Array_5 {
            property = "UO_FW_EndCondition_HostageRescued_Array_5";
            displayName = "Hostage(s) Rescued";
            tooltip = "Array of hostages that must be rescued for the end condition to fire. leave blank to disable.";
            control = "EditArray";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "[]";
        };
    };
};

class UO_FW_EndConditions_VariableSettings_Category5 {
    displayName = "Custom Variable Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_EndCondition_CustomVariables_Array_5 {
            property = "UO_FW_EndCondition_CustomVariables_Array_5";
            displayName = "Custom Variables";
            tooltip = "Array of variables to check for true status. Leave blank to disable";
            control = "EditArray";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "[]";
        };
    };
};

class UO_FW_EndConditions_ExtractionSettings_Category5 {
    displayName = "Extraction Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_EndCondition_ExtractionEnabled_5 {
            property = "UO_FW_EndCondition_ExtractionEnabled_5";
            displayName = "Require Extraction";
            tooltip = "Require Extraction in addition to end conditions for this category.";
            control = "CheckBoxState";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class UO_FW_EndCondition_ExtractionTeam_5 {
            property = "UO_FW_EndCondition_ExtractionTeam_5";
            displayName = "Team";
            tooltip = "Team required to be in extract area.";
            control = "UO_FW_EndConditions_ExtractTeam";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
        class UO_FW_EndCondition_ExtractionMarker_5 {
            property = "UO_FW_EndCondition_ExtractionMarker_5";
            displayName = "Extraction Marker";
            tooltip = "Marker name of extraction area.";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class UO_FW_EndCondition_ExtractionRatio_5 {
            property = "UO_FW_EndCondition_ExtractionRatio_5";
            displayName = "Ratio";
            tooltip = "Percentage of alive personnel inside the marker to be considered extracted. Default 75";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "75";
        };
    };
};

class UO_FW_EndConditions_CaptureZoneSettings_Category5 {
    displayName = "CaptureZone Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_EndCondition_CaptureZoneCaptured_Array_5 {
            property = "UO_FW_EndCondition_CaptureZoneCaptured_Array_5";
            displayName = "CaptureZone Names";
            tooltip = "List of CaptureZones names that must be captured for the end condition to fire. Leave empty to disable.";
            control = "EditArray";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "[]";
        };
        class UO_FW_EndCondition_CaptureZoneCaptured_Team_5 {
            property = "UO_FW_EndCondition_CaptureZoneCaptured_Team_5";
            displayName = "CaptureZone Team";
            tooltip = "Team that must activate the CaptureZones for the condition to fire.";
            control = "UO_FW_EndConditions_CaptureZoneTeam";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "1";
        };
    };
};
