class UO_FW_TeamsSetting {
    displayName = "Team Settings";
    collapsed = 0;
    class Attributes {
        class UO_FW_TeamSetting_Blufor_TeamType {
            property = "UO_FW_TeamSetting_Blufor_TeamType";
            displayName = "Type";
            tooltip = "Set team to either AI, Player Controlled, or Both";
            control = "UO_FW_TeamType_Select";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
        class UO_FW_TeamSetting_TeamName_Blufor {
            property = "UO_FW_TeamSetting_TeamName_Blufor";
            displayName = "Name";
            tooltip = "Set team name";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'BLUFOR TEAM'";
        };
        class UO_FW_TeamSetting_Opfor_TeamType {
            property = "UO_FW_TeamSetting_Opfor_TeamType";
            displayName = "Type";
            tooltip = "Set team to either AI, Player Controlled, or Both";
            control = "UO_FW_TeamType_Select";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
        class UO_FW_TeamSetting_TeamName_Opfor {
            property = "UO_FW_TeamSetting_TeamName_Opfor";
            displayName = "Name";
            tooltip = "Set team name";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'OPFOR TEAM'";
        };
        class UO_FW_TeamSetting_Indfor_TeamType {
            property = "UO_FW_TeamSetting_Indfor_TeamType";
            displayName = "Type";
            tooltip = "Set team to either AI, Player Controlled, or Both";
            control = "UO_FW_TeamType_Select";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
        class UO_FW_TeamSetting_TeamName_Indfor {
            property = "UO_FW_TeamSetting_TeamName_Indfor";
            displayName = "Name";
            tooltip = "Set team name";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'INDFOR TEAM'";
        };
        class UO_FW_TeamSetting_Civ_TeamType {
            property = "UO_FW_TeamSetting_Civ_TeamType";
            displayName = "Type";
            tooltip = "Set team to either AI, Player Controlled, or Both";
            control = "UO_FW_TeamType_Select";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
        class UO_FW_TeamSetting_TeamName_Civ {
            property = "UO_FW_TeamSetting_TeamName_Civ";
            displayName = "Name";
            tooltip = "Set team name";
            control = "EditShort";
            expression = UO_FW_SCENARIO_EXPRESSION;
            defaultValue = "'CIVILIAN TEAM'";
        };
    };
};
