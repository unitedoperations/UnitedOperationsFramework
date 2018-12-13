class UO_FW_AIAttack_Settings
{
    displayName = "AI Attack Settings";
    collapsed = 1;
    class Attributes
    {
		class UO_FW_AIATTACK_Enabled
        {
            property = "UO_FW_AIATTACK_Enabled";
            displayName = "AI Attack";
            tooltip = "Enables AI Attack";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value];";
            defaultValue = "false";
            typeName = "BOOL";

        };
        class UO_FW_AIATTACK_Path1
        {
            property = "UO_FW_AIATTACK_Path1";
            displayName = "Path 1 Unit";
            tooltip = "Unit which has waypoints and the path of it should be registered!";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
            defaultValue = "''";
        };
         class UO_FW_AIATTACK_Path2
        {
            property = "UO_FW_AIATTACK_Path2";
            displayName = "Path 2 Unit";
            tooltip = "Unit which has waypoints and the path of it should be registered!";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
            defaultValue = "''";
        };
         class UO_FW_AIATTACK_Path3
        {
            property = "UO_FW_AIATTACK_Path3";
            displayName = "Path 3 Unit";
            tooltip = "Unit which has waypoints and the path of it should be registered!";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
            defaultValue = "''";
        };
         class UO_FW_AIATTACK_Path4
        {
            property = "UO_FW_AIATTACK_Path4";
            displayName = "Path 4 Unit";
            tooltip = "Unit which has waypoints and the path of it should be registered!";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
            defaultValue = "''";
        };
         class UO_FW_AIATTACK_Path5
        {
            property = "UO_FW_AIATTACK_Path5";
            displayName = "Path 5 Unit";
            tooltip = "Unit which has waypoints and the path of it should be registered!";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
            defaultValue = "''";
        };
         class UO_FW_AIATTACK_Path6
        {
            property = "UO_FW_AIATTACK_Path6";
            displayName = "Path 6 Unit";
            tooltip = "Unit which has waypoints and the path of it should be registered!";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
            defaultValue = "''";
        };
         class UO_FW_AIATTACK_Path7
        {
            property = "UO_FW_AIATTACK_Path7";
            displayName = "Path 7 Unit";
            tooltip = "Unit which has waypoints and the path of it should be registered!";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
            defaultValue = "''";
        };
         class UO_FW_AIATTACK_Path8
        {
            property = "UO_FW_AIATTACK_Path8";
            displayName = "Path 8 Unit";
            tooltip = "Unit which has waypoints and the path of it should be registered!";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
            defaultValue = "''";
        };
         class UO_FW_AIATTACK_Path9
        {
            property = "UO_FW_AIATTACK_Path9";
            displayName = "Path 9 Unit";
            tooltip = "Unit which has waypoints and the path of it should be registered!";
			control = "EditShort";
            expression="missionNamespace setVariable ['%s',_value];";
            defaultValue = "''";
        };
    };
};