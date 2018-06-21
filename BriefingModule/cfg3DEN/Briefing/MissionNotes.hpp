class Main
{
    displayName = "Mission Notes";
    collapsed = 1;
    class Attributes
    {
		class UO_FW_BRIEFING_MISSIONNOTES_AUTHOR
        {
            property = "UO_FW_BRIEFING_MISSIONNOTES_AUTHORS";
            displayName = "Mission Author";
            tooltip = "Mission Author";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "profileNameSteam";
            
        };
		class UO_FW_BRIEFING_MISSIONNOTES_TESTERS
        {
            property = "UO_FW_BRIEFING_MISSIONNOTES_TESTERS";
            displayName = "Mission Testers and Additional Credit";
            tooltip = "Mission Testers and Additional Credit";
            control = "Edit";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
        class UO_FW_BRIEFING_MISSIONNOTES_CUSTOM
        {
            property = "UO_FW_BRIEFING_MISSIONNOTES_CUSTOM";
            displayName = "Mission Specific Notes";
            tooltip = "Put any special notes for the mission in here";
            control = "EditMulti5";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_MISSIONNOTES_GM
        {
            property = "UO_FW_BRIEFING_MISSIONNOTES_GM";
            displayName = "Game Mastering";
            tooltip = "Game Mastering";
            control = "Checkbox";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "false";
            
        };
    };
};