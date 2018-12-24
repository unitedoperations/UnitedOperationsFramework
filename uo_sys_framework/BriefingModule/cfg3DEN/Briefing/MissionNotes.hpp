class Main
{
    displayName = "Mission Notes";
    collapsed = 1;
    class Attributes
    {
        class UO_FW_BRIEFING_MISSIONNOTES_ENABLE
        {
            property = "UO_FW_BRIEFING_MISSIONNOTES_ENABLE";
            displayName = "Enable Mission Notes";
            tooltip = "Enables Mission Notes";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "false";
            
        };
		class UO_FW_BRIEFING_MISSIONNOTES_AUTHOR
        {
            property = "UO_FW_BRIEFING_MISSIONNOTES_AUTHOR";
            displayName = "Mission Author";
            tooltip = "Mission Author";
            control = "EditShort";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "profileNameSteam";
            
        };
		class UO_FW_BRIEFING_MISSIONNOTES_TESTERS
        {
            property = "UO_FW_BRIEFING_MISSIONNOTES_TESTERS";
            displayName = "Mission Testers and Additional Credit";
            tooltip = "Mission Testers and Additional Credit";
            control = "Edit";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_MISSIONNOTES_CONDITIONS
        {
            property = "UO_FW_BRIEFING_MISSIONNOTES_CONDITIONS";
            displayName = "End Conditions";
            tooltip = "Describe the specific end conditions for the mission here";
            control = "EditMulti5";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
            
        };
        class UO_FW_BRIEFING_MISSIONNOTES_CUSTOM
        {
            property = "UO_FW_BRIEFING_MISSIONNOTES_CUSTOM";
            displayName = "Mission Specific Notes";
            tooltip = "Put any special notes for the mission in here";
            control = "EditMulti5";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
            
        };
         class UO_FW_BRIEFING_MISSIONNOTES_CHANGELOG
        {
            property = "UO_FW_BRIEFING_MISSIONNOTES_CHANGELOG";
            displayName = "Mission Changelog";
            tooltip = "Put any changes for the mission in here(Bugfixes and such)";
            control = "EditMulti5";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_MISSIONNOTES_GM
        {
            property = "UO_FW_BRIEFING_MISSIONNOTES_GM";
            displayName = "Allow Game Mastering";
            tooltip = "Allow Game Mastering";
            control = "CheckBox";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "false";
            
        };
    };
};