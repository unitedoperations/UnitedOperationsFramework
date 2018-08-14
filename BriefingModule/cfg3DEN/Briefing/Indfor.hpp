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
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_SIT_KEYTERRAIN
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_SIT_KEYTERRAIN";
            displayName = "Key Terrain";
            tooltip = "Key Terrain";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_SIT_WEATHER
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_SIT_WEATHER";
            displayName = "Weather";
            tooltip = "Weather";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_ENEMY_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_ENEMY_TITLE";
            displayName = "Enemy";
			control = "SubTitle";
            expression = "true";
            defaultValue = "";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_ENEMY_DIS
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_ENEMY_DIS";
            displayName = "Enemy Disposition";
            tooltip = "Enemy Disposition";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_ENEMY_STRENGTH
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_ENEMY_STRENGTH";
            displayName = "Enemy Strength";
            tooltip = "Enemy Strength";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_NATO_ENEMY_EQUIPMENT
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_ENEMY_EQUIPMENT";
            displayName = "Enemy Equipment";
            tooltip = "Enemy Equipment";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_NATO_ENEMY_APPEARANCE
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_ENEMY_APPEARANCE";
            displayName = "Enemy Appearance";
            tooltip = "Enemy Appearance";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_NATO_ENEMY_MLCOA
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_ENEMY_MLCOA";
            displayName = "Most Likely Course of Action";
            tooltip = "Most Likely Course of Action";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_ENEMY_MDCOA
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_ENEMY_MDCOA";
            displayName = "Most Dangerous Course of Action";
            tooltip = "Most Dangerous Course of Action";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_FRIENDLY_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_FRIENDLY_TITLE";
            displayName = "Friendly";
			control = "SubTitle";
            expression = "true";
            defaultValue = "";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_FRIENDLY_DIS
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_FRIENDLY_DIS";
            displayName = "Friendly Disposition";
            tooltip = "Friendly Disposition";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_FRIENDLY_HIGHER
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_FRIENDLY_HIGHER";
            displayName = "Friendly Higher Units";
            tooltip = "Friendly Higher Units";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_FRIENDLY_STRENGTH
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_FRIENDLY_STRENGTH";
            displayName = "Friendly Strength";
            tooltip = "Friendly Strength";
			control = "EditMulti5";
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
			control = "EditMulti5";
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
			control = "SubTitle";
            expression = "true";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_SANDS_SUPPORT_FIRES
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_SANDS_SUPPORT_FIRES";
            displayName = "Fires";
            tooltip = "Fires";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_SANDS_SUPPORT_AMMO
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_SANDS_SUPPORT_AMMO";
            displayName = "Ammo";
            tooltip = "Ammo";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_SANDS_SERVICE_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_SANDS_SERVICE_TITLE";
            displayName = "Service";
            tooltip = "Service";
			control = "SubTitle";
            expression = "true";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_SANDS_SERVICE_GENERAL
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_SANDS_SERVICE_GENERAL";
            displayName = "General";
            tooltip = "General";
			control = "EditMulti5";
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
		class UO_FW_BRIEFING_INDFOR_NATO_CANDS_COMMAND_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_CANDS_COMMAND_TITLE";
            displayName = "Command";
            tooltip = "Command";
			control = "SubTitle";
            expression = "true";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_CANDS_COMMAND
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_CANDS_COMMAND";
            displayName = "Command";
            tooltip = "Command";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_TITLE";
            displayName = "Signals";
            tooltip = "Signals";
			control = "SubTitle";
            expression = "true";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_FREQ
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_FREQ";
            displayName = "Radio Frequencies";
            tooltip = "Radio Frequencies";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_CODEWORDS
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_CODEWORDS";
            displayName = "Codewords";
            tooltip = "Codewords";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_SPECIAL
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_SPECIAL";
            displayName = "Special Signals";
            tooltip = "Special Signals";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_CALLSIGNS
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_CALLSIGNS";
            displayName = "Callsigns";
            tooltip = "Callsigns";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
            
        };
		class UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_PASSWORDS
        {
            property = "UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_PASSWORDS";
            displayName = "Passwords";
            tooltip = "Passwords";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
    };
};

class INDFOR_WPStyle
{
    displayName = "Warsaw Pact Style Briefing";
    collapsed = 1;
    class Attributes
    {
		class UO_FW_BRIEFING_INDFOR_WARSAW
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW";
            displayName = "Warsaw Pact style briefing";
            tooltip = "Enables Warsaw Pact style briefing";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "false";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_PRELIMINARIES_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_PRELIMINARIES_TITLE";
            displayName = "Preliminaries";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_PRELIMINARIES_WEATHER
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_PRELIMINARIES_WEATHER";
            displayName = "Weather";
            tooltip = "Weather";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_PRELIMINARIES_TERRAIN
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_PRELIMINARIES_TERRAIN";
            displayName = "Terrain";
            tooltip = "Terrain";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_REFERENCE_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_REFERENCE_TITLE";
            displayName = "Reference Points";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_REFERENCE_DEPLOYMENTPOINTS
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_REFERENCE_DEPLOYMENTPOINTS";
            displayName = "Deployment Reference Points";
            tooltip = "Deployment Reference Points";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_REFERENCE_SUBSEQUENTPOINTS
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_REFERENCE_SUBSEQUENTPOINTS";
            displayName = "Subsequent Reference Points";
            tooltip = "Subsequent Reference Points";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_ENEMY_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_ENEMY_TITLE";
            displayName = "Enemy";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_ENEMY_DISP
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_ENEMY_DISP";
            displayName = "Enemy Disposition";
            tooltip = "Enemy Disposition";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_ENEMY_EQUIP
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_ENEMY_EQUIP";
            displayName = "Enemy Equipment";
            tooltip = "Enemy Equipment";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_ENEMY_PROB_HQ
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_ENEMY_PROB_HQ";
            displayName = "Probable Enemy HQ Location";
            tooltip = "Probable Enemy HQ Location";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_ENEMY_PROB_LINE
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_ENEMY_PROB_LINE";
            displayName = "Probable Enemy Main Element Location";
            tooltip = "Probable Enemy Main Element Location";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_ENEMY_PROB_DIR_ATTACK
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_ENEMY_PROB_DIR_ATTACK";
            displayName = "Probable Enemy Direction of Attack";
            tooltip = "Probable Enemy Direction of Attack";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_ENEMY_PROB_ARTY
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_ENEMY_PROB_ARTY";
            displayName = "Probable Enemy Artillery Positions & Capability";
            tooltip = "Probable Enemy Artillery Positions & Capability";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_HIGHER_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_HIGHER_TITLE";
            displayName = "Higher and Adjacent Units";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_HIGHER_DISP
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_HIGHER_DISP";
            displayName = "Description";
            tooltip = "Description";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_HIGHER_BOUNDARY
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_HIGHER_BOUNDARY";
            displayName = "Boundaries";
            tooltip = "Boundaries";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_HIGHER_ARTY
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_HIGHER_ARTY";
            displayName = "Location and Capability of Artillery";
            tooltip = "Location and Capability of Artillery";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_MISSION_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_MISSION_TITLE";
            displayName = "Mission";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_MISSION_DESC
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_MISSION_DESC";
            displayName = "Mission Statement";
            tooltip = "Mission Statement";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_MISSION_DIR
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_MISSION_DIR";
            displayName = "End State Direction";
            tooltip = "End State Direction";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_ORDER_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_ORDER_TITLE";
            displayName = "Order";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_ORDER_TASKS
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_ORDER_TASKS";
            displayName = "Tasks";
            tooltip = "Tasks";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_ORDER_TASKS_ARTY
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_ORDER_TASKS_ARTY";
            displayName = "Tasks for Artillery Elements";
            tooltip = "Tasks for Artillery Elements";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_ORDER_TIMINGS
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_ORDER_TIMINGS";
            displayName = "Readiness Timings";
            tooltip = "Readiness Timings";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_ORDER_SIGNALS
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_ORDER_SIGNALS";
            displayName = "Signals";
            tooltip = "Signals";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_COMM_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_COMM_TITLE";
            displayName = "Location of the Commander";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_COMM_LOC
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_COMM_LOC";
            displayName = "Location of the Commander";
            tooltip = "Location of the Commander";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_SUCC_TITLE
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_SUCC_TITLE";
            displayName = "Succession of Command";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
		class UO_FW_BRIEFING_INDFOR_WARSAW_SUCC_DESC
        {
            property = "UO_FW_BRIEFING_INDFOR_WARSAW_SUCC_DESC";
            displayName = "Succession of Command";
            tooltip = "Succession of Command";
			control = "EditMulti5";
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