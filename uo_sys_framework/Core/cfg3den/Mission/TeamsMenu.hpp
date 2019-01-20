class UO_FW_TeamsSetting {
    displayName = "Team Settings";
    collapsed = 0;
    class Attributes {
		class UO_FW_TeamSetting_Blufor_Title {
            property = "UO_FW_TeamSetting_Blufor_Title";
            displayName = "BLUFOR";
            tooltip = "BLUFOR";
            control = "CategoryTitleIndent";
            defaultValue = "'BLUFOR'";
        };
		class UO_FW_TeamSetting_Blufor_TeamType {
            property = "UO_FW_TeamSetting_Blufor_TeamType";
            displayName = "Type";
            tooltip = "Set team to either AI, Player Controlled, or Both";
            control = "UO_FW_TeamType_Select";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
		class UO_FW_TeamSetting_Blufor_TeamName {
            property = "UO_FW_TeamSetting_Blufor_TeamName";
            displayName = "Name";
            tooltip = "Set team name";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'BLUFOR TEAM'";
        };
		class UO_FW_TeamSetting_Opfor_Title {
            property = "UO_FW_TeamSetting_Opfor_Title";
            displayName = "OPFOR";
            tooltip = "OPFOR";
            control = "CategoryTitleIndent";
            defaultValue = "'OPFOR'";
        };
		class UO_FW_TeamSetting_Opfor_TeamType {
            property = "UO_FW_TeamSetting_Opfor_TeamType";
            displayName = "Type";
            tooltip = "Set team to either AI, Player Controlled, or Both";
            control = "UO_FW_TeamType_Select";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
		class UO_FW_TeamSetting_Opfor_TeamName {
            property = "UO_FW_TeamSetting_Opfor_TeamName";
            displayName = "Name";
            tooltip = "Set team name";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'OPFOR TEAM'";
        };
		class UO_FW_TeamSetting_Indfor_Title {
            property = "UO_FW_TeamSetting_Indfor_Title";
            displayName = "INDFOR";
            tooltip = "INDFOR";
            control = "CategoryTitleIndent";
            defaultValue = "'INDFOR'";
        };
		class UO_FW_TeamSetting_Indfor_TeamType {
            property = "UO_FW_TeamSetting_Indfor_TeamType";
            displayName = "Type";
            tooltip = "Set team to either AI, Player Controlled, or Both";
            control = "UO_FW_TeamType_Select";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
		class UO_FW_TeamSetting_Indfor_TeamName {
            property = "UO_FW_TeamSetting_Indfor_TeamName";
            displayName = "Name";
            tooltip = "Set team name";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'INDFOR TEAM'";
        };
		class UO_FW_TeamSetting_Civ_Title {
            property = "UO_FW_TeamSetting_Civ_Title";
            displayName = "CIVILIAN";
            tooltip = "CIVILIAN";
            control = "CategoryTitleIndent";
            defaultValue = "'CIVILIAN'";
        };
		class UO_FW_TeamSetting_Civ_TeamType {
            property = "UO_FW_TeamSetting_Civ_TeamType";
            displayName = "Type";
            tooltip = "Set team to either AI, Player Controlled, or Both";
            control = "UO_FW_TeamType_Select";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
		class UO_FW_TeamSetting_Civ_TeamName {
            property = "UO_FW_TeamSetting_Civ_TeamName";
            displayName = "Name";
            tooltip = "Set team name";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'CIVILIAN TEAM'";
        };
    };
};
