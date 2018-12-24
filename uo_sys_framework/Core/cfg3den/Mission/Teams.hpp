class Teams
{
    displayName = "Team Settings";
    collapsed = 0;
    class Attributes
    {
		class UO_FW_TeamSetting_Blufor_Title
        {
            property = "UO_FW_TeamSetting_Blufor_Title";
            displayName = "BLUFOR";
            tooltip = "BLUFOR";
            control = "CategoryTitleIndent";
            defaultValue = "'BLUFOR'";
        };
		class UO_FW_TeamSetting_Blufor_TeamType
        {
            property = "UO_FW_TeamSetting_Blufor_TeamType";
            displayName = "Type";
            tooltip = "Set team to either AI, Player Controlled, or Both";
            control = "TeamTypeWest";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "0";
        };
		class UO_FW_TeamSetting_Blufor_TeamName
        {
            property = "UO_FW_TeamSetting_Blufor_TeamName";
            displayName = "Name";
            tooltip = "Set team name";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "'BLUFOR TEAM'";
        };
        class UO_FW_TeamSetting_Blufor_RespawnTickets
        {
            property = "UO_FW_TeamSetting_Blufor_RespawnTickets";
            displayName = "Respawns";
            tooltip = "Number of individual respawns. Place down Gamelogic with name uo_fw_west_respawn to define respawn location.";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "0";
            validate = "number";
        };
		class UO_FW_TeamSetting_Opfor_Title
        {
            property = "UO_FW_TeamSetting_Opfor_Title";
            displayName = "OPFOR";
            tooltip = "OPFOR";
            control = "CategoryTitleIndent";
            defaultValue = "'OPFOR'";
        };
		class UO_FW_TeamSetting_Opfor_TeamType
        {
            property = "UO_FW_TeamSetting_Opfor_TeamType";
            displayName = "Type";
            tooltip = "Set team to either AI, Player Controlled, or Both";
            control = "TeamTypeEast";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "0";
        };
		class UO_FW_TeamSetting_Opfor_TeamName
        {
            property = "UO_FW_TeamSetting_Opfor_TeamName";
            displayName = "Name";
            tooltip = "Set team name";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "'OPFOR TEAM'";
        };
         class UO_FW_TeamSetting_Opfor_RespawnTickets
        {
            property = "UO_FW_TeamSetting_Opfor_RespawnTickets";
            displayName = "Respawns";
            tooltip = "Number of individual respawns.Place down Gamelogic with name uo_fw_east_respawn to define respawn location.";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "0";
            validate = "number";
        };
		class UO_FW_TeamSetting_Indfor_Title
        {
            property = "UO_FW_TeamSetting_Indfor_Title";
            displayName = "INDFOR";
            tooltip = "INDFOR";
            control = "CategoryTitleIndent";
            defaultValue = "'INDFOR'";
        };
		class UO_FW_TeamSetting_Indfor_TeamType
        {
            property = "UO_FW_TeamSetting_Indfor_TeamType";
            displayName = "Type";
            tooltip = "Set team to either AI, Player Controlled, or Both";
            control = "TeamTypeIndfor";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "0";
        };
		class UO_FW_TeamSetting_Indfor_TeamName
        {
            property = "UO_FW_TeamSetting_Indfor_TeamName";
            displayName = "Name";
            tooltip = "Set team name";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "'INDFOR TEAM'";
        };
         class UO_FW_TeamSetting_Indfor_RespawnTickets
        {
            property = "UO_FW_TeamSetting_Indfor_RespawnTickets";
            displayName = "Respawns";
            tooltip = "Number of individual respawns. Place down Gamelogic with name uo_fw_guer_respawn to define respawn location.";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "0";
            validate = "number";
        };
		class UO_FW_TeamSetting_Civ_Title
        {
            property = "UO_FW_TeamSetting_Civ_Title";
            displayName = "CIVILIAN";
            tooltip = "CIVILIAN";
            control = "CategoryTitleIndent";
            defaultValue = "'CIVILIAN'";
        };
		class UO_FW_TeamSetting_Civ_TeamType
        {
            property = "UO_FW_TeamSetting_Civ_TeamType";
            displayName = "Type";
            tooltip = "Set team to either AI, Player Controlled, or Both";
            control = "TeamTypeCiv";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "0";
        };
		class UO_FW_TeamSetting_Civ_TeamName
        {
            property = "UO_FW_TeamSetting_Civ_TeamName";
            displayName = "Name";
            tooltip = "Set team name";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "'CIVILIAN TEAM'";
        };
         class UO_FW_TeamSetting_Civ_RespawnTickets
        {
            property = "UO_FW_TeamSetting_Civ_RespawnTickets";
            displayName = "Respawns";
            tooltip = "Number of individual respawns.Place down Gamelogic with name uo_fw_civ_respawn to define respawn location.";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "0";
            validate = "number";
        };
    };
};
