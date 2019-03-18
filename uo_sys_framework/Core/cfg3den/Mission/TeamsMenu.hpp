class EGVAR(Core,TeamsSettings) {
    displayName = "Team Settings";
    collapsed = 0;
    class Attributes {
        class EGVAR(Core,TeamType_Blufor) {
            property = QEGVAR(Core,TeamType_Blufor);
            displayName = "Type";
            tooltip = "Set team to either AI, Player Controlled, or Both";
            control = QEGVAR(Core,TeamType_Select);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(Core,TeamName_Blufor) {
            property = QEGVAR(Core,TeamName_Blufor);
            displayName = "Name";
            tooltip = "Set team name";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'BLUFOR TEAM'";
        };
        class EGVAR(Core,TeamType_Opfor) {
            property = QEGVAR(Core,TeamType_Opfor);
            displayName = "Type";
            tooltip = "Set team to either AI, Player Controlled, or Both";
            control = QEGVAR(Core,TeamType_Select);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(Core,TeamName_Opfor) {
            property = QEGVAR(Core,TeamName_Opfor);
            displayName = "Name";
            tooltip = "Set team name";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'OPFOR TEAM'";
        };
        class EGVAR(Core,TeamType_Indfor) {
            property = QEGVAR(Core,TeamType_Indfor);
            displayName = "Type";
            tooltip = "Set team to either AI, Player Controlled, or Both";
            control = QEGVAR(Core,TeamType_Select);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(Core,TeamName_Indfor) {
            property = QEGVAR(Core,TeamName_Indfor);
            displayName = "Name";
            tooltip = "Set team name";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'Indfor TEAM'";
        };
        class EGVAR(Core,TeamType_Civ) {
            property = QEGVAR(Core,TeamType_Civ);
            displayName = "Type";
            tooltip = "Set team to either AI, Player Controlled, or Both";
            control = QEGVAR(Core,TeamType_Select);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "0";
        };
        class EGVAR(Core,TeamName_Civ) {
            property = QEGVAR(Core,TeamName_Civ);
            displayName = "Name";
            tooltip = "Set team name";
            control = "EditShort";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'CIVILIAN TEAM'";
        };
    };
};
