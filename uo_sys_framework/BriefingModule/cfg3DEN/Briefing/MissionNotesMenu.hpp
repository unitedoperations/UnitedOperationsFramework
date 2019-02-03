class UO_FW_MissionNotes {
    displayName = "Mission Notes";
    collapsed = 1;
    class Attributes {
        class UO_FW_Briefing_MissionNotes_Enable {
            property = "UO_FW_Briefing_MissionNotes_Enable";
            displayName = "Enable Mission Notes";
            tooltip = "Enables Mission Notes";
            control = "CheckboxState";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";

        };
        class UO_FW_Briefing_MissionNotes_Author {
            property = "UO_FW_Briefing_MissionNotes_Author";
            displayName = "Mission Author";
            tooltip = "Mission Author";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";

        };
        class UO_FW_Briefing_MissionNotes_Testers {
            property = "UO_FW_Briefing_MissionNotes_Testers";
            displayName = "Mission Testers and Additional Credit";
            tooltip = "Mission Testers and Additional Credit";
            control = "Edit";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";

        };
        class UO_FW_Briefing_MissionNotes_Conditions {
            property = "UO_FW_Briefing_MissionNotes_Conditions";
            displayName = "End Conditions";
            tooltip = "Describe the specific end conditions for the mission here";
            control = "EditMulti5";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";

        };
        class UO_FW_Briefing_MissionNotes_Custom {
            property = "UO_FW_Briefing_MissionNotes_Custom";
            displayName = "Mission Specific Notes";
            tooltip = "Put any special notes for the mission in here";
            control = "EditMulti5";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";

        };
         class UO_FW_Briefing_MissionNotes_Changelog {
            property = "UO_FW_Briefing_MissionNotes_Changelog";
            displayName = "Mission Changelog";
            tooltip = "Put any changes for the mission in here(Bugfixes and such)";
            control = "EditMulti5";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "''";

        };
        class UO_FW_Briefing_MissionNotes_GM {
            property = "UO_FW_Briefing_MissionNotes_GM";
            displayName = "Allow Game Mastering";
            tooltip = "Allow Game Mastering";
            control = "CheckBox";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "false";

        };
    };
};
