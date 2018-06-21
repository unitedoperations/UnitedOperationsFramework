class INDFOR_NATOStyle
{
    displayName = "NATO Style Briefing";
    collapsed = 1;
    class Attributes
    {
        class UO_FW_BRIEFING_INDFOR_NATO
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO";
            displayName = "NATO style briefing";
            tooltip = "Enables NATO style briefing";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "false";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_SITUATION_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_SITUATION_TITLE";
            displayName = "Situation";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_SIT_MAIN
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_SIT_MAIN";
            displayName = "Situation";
            tooltip = "Situation";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_SIT_TERRAIN
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_SIT_TERRAIN";
            displayName = "Terrain";
            tooltip = "Terrain";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_SIT_KEYTERRAIN
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_SIT_KEYTERRAIN";
            displayName = "Key Terrain";
            tooltip = "Key Terrain";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_SIT_WEATHER
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_SIT_WEATHER";
            displayName = "Weather";
            tooltip = "Weather";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_ENEMY_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_ENEMY_TITLE";
            displayName = "Enemy";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_ENEMY_DIS
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_ENEMY_DIS";
            displayName = "Enemy Disposition";
            tooltip = "Enemy Disposition";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_ENEMY_STRENGTH
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_ENEMY_STRENGTH";
            displayName = "Enemy Strength";
            tooltip = "Enemy Strength";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_NATO_ENEMY_EQUIPMENT
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_ENEMY_EQUIPMENT";
            displayName = "Enemy Equipment";
            tooltip = "Enemy Equipment";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_NATO_ENEMY_APPEARANCE
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_ENEMY_APPEARANCE";
            displayName = "Enemy Appearance";
            tooltip = "Enemy Appearance";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_NATO_ENEMY_MLCOA
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_ENEMY_MLCOA";
            displayName = "Most Likely Course of Action";
            tooltip = "Most Likely Course of Action";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_ENEMY_MDCOA
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_ENEMY_MDCOA";
            displayName = "Most Dangerous Course of Action";
            tooltip = "Most Dangerous Course of Action";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_FRIENDLY_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_FRIENDLY_TITLE";
            displayName = "Friendly";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_FRIENDLY_DIS
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_FRIENDLY_DIS";
            displayName = "Friendly Disposition";
            tooltip = "Friendly Disposition";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_FRIENDLY_HIGHER
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_FRIENDLY_HIGHER";
            displayName = "Friendly Higher Units";
            tooltip = "Friendly Higher Units";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_FRIENDLY_STRENGTH
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_FRIENDLY_STRENGTH";
            displayName = "Friendly Strength";
            tooltip = "Friendly Strength";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_MISSION_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_MISSION_TITLE";
            displayName = "Mission";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
            
        };
        class UO_FW_BRIEFING_INDFOR_NATO_MISSION
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_MISSION";
            displayName = "Mission";
            tooltip = "Mission";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_EXECUTION_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_EXECUTION_TITLE";
            displayName = "Execution";
            tooltip = "Execution";
			control = "CategoryTitleIndent";
            validate = "STRING";
            expression = "true";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_EXECUTION_INTENT
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_EXECUTION_INTENT";
            displayName = "Intent";
            tooltip = "Intent";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_EXECUTION_MANEUVER
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_EXECUTION_MANEUVER";
            displayName = "Maneuver";
            tooltip = "Maneuver";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_EXECUTION_TIMINGS
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_EXECUTION_TIMINGS";
            displayName = "Timings";
            tooltip = "Timings";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_EXECUTION_TASKS
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_EXECUTION_TASKS";
            displayName = "Tasks";
            tooltip = "Tasks";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_SANDS_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_SANDS_TITLE";
            displayName = "Service Support";
            tooltip = "Service Support";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_SANDS_SUPPORT_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_SANDS_SUPPORT_TITLE";
            displayName = "Support";
            tooltip = "Support";
			control = "SubTitleIndent";
            expression = "true";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_SANDS_SUPPORT_FIRES
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_SANDS_SUPPORT_FIRES";
            displayName = "Fires";
            tooltip = "Fires";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_SANDS_SUPPORT_AMMO
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_SANDS_SUPPORT_AMMO";
            displayName = "Ammo";
            tooltip = "Ammo";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_SANDS_SERVICE_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_SANDS_SERVICE_TITLE";
            displayName = "Service";
            tooltip = "Service";
			control = "SubTitleIndent";
            expression = "true";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_SANDS_SERVICE_GENERAL
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_SANDS_SERVICE_GENERAL";
            displayName = "General";
            tooltip = "General";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_CANDS_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_CANDS_TITLE";
            displayName = "Command and Signals";
            tooltip = "Command and Signals";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_CANDS_COMMAND
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_CANDS_COMMAND";
            displayName = "Command";
            tooltip = "Command";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_TITLE";
            displayName = "Signals";
            tooltip = "Signals";
			control = "SubTitleIndent";
            expression = "true";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_FREQ
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_FREQ";
            displayName = "Radio Frequencies";
            tooltip = "Radio Frequencies";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_CODEWORDS
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_CODEWORDS";
            displayName = "Codewords";
            tooltip = "Codewords";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_SPECIAL
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_SPECIAL";
            displayName = "Special Signals";
            tooltip = "Special Signals";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_CALLSIGNS
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_CALLSIGNS";
            displayName = "Callsigns";
            tooltip = "Callsigns";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_PASSWORDS
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_PASSWORDS";
            displayName = "Passwords";
            tooltip = "Passwords";
			control = "EditMulti3";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
    };
};

class INDFOR_Custom_File
{
    displayName = "Briefing File";
    collapsed = 1;
    class Attributes
    {
		class UO_FW_BRIEFING_INDFOR_FILE
        {
            property = "UO_FW_BRIEFING_INDFOR_FILE";
            displayName = "Briefing File";
            tooltip = "Loads file as briefing";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "false";
            
        };
		class UO_FW_BRIEFING_INDFOR_FILE_PATH
        {
            property = "UO_FW_BRIEFING_INDFOR_FILE_PATH";
            displayName = "Path to briefing file";
            tooltip = "Path to briefing file";
			control = "Edit";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
	};
};

class INDFOR_APPENDIX
{
    displayName = "Appendix Card File";
    collapsed = 1;
    class Attributes
    {
		class UO_FW_BRIEFING_INDFOR_APPENDIX
        {
            property = "UO_FW_BRIEFING_INDFOR_APPENDIX";
            displayName = "Appendix File";
            tooltip = "Enables Appendix File";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "false";
            
        };
		class UO_FW_BRIEFING_INDFOR_APPENDIX_PATH
        {
            property = "UO_FW_BRIEFING_INDFOR_APPENDIX_PATH";
            displayName = "Path to Appendix file";
            tooltip = "Path to Appendix Briefing File";
			control = "Edit";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
	};
};