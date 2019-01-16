class UO_FW_INDFOR_NATOStyle {
    displayName = "NATO Style Briefing";
    collapsed = 1;
    class Attributes {
        class UO_FW_Briefing_INDFOR_NATO {
            property = "UO_FW_Briefing_INDFOR_NATO";
            displayName = "NATO style briefing";
            tooltip = "Enables NATO style briefing";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "false";

        };
		class UO_FW_Briefing_INDFOR_NATO_SITUATION_TITLE {
            property = "UO_FW_Briefing_INDFOR_NATO_SITUATION_TITLE";
            displayName = "Situation";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";

        };
		class UO_FW_Briefing_INDFOR_NATO_SIT_MAIN {
            property = "UO_FW_Briefing_INDFOR_NATO_SIT_MAIN";
            displayName = "Situation";
            tooltip = "Situation";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_SIT_Terrain {
            property = "UO_FW_Briefing_INDFOR_NATO_SIT_Terrain";
            displayName = "Terrain";
            tooltip = "Terrain";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_SIT_KEYTerrain {
            property = "UO_FW_Briefing_INDFOR_NATO_SIT_KEYTerrain";
            displayName = "Key Terrain";
            tooltip = "Key Terrain";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_SIT_Weather {
            property = "UO_FW_Briefing_INDFOR_NATO_SIT_Weather";
            displayName = "Weather";
            tooltip = "Weather";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_Enemy_TITLE {
            property = "UO_FW_Briefing_INDFOR_NATO_Enemy_TITLE";
            displayName = "Enemy";
			control = "SubTitle";
            expression = "true";
            defaultValue = "";

        };
		class UO_FW_Briefing_INDFOR_NATO_Enemy_DIS {
            property = "UO_FW_Briefing_INDFOR_NATO_Enemy_DIS";
            displayName = "Enemy Disposition";
            tooltip = "Enemy Disposition";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_Enemy_STRENGTH {
            property = "UO_FW_Briefing_INDFOR_NATO_Enemy_STRENGTH";
            displayName = "Enemy Strength";
            tooltip = "Enemy Strength";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_NATO_Enemy_EQUIPMENT {
            property = "UO_FW_Briefing_INDFOR_NATO_Enemy_EQUIPMENT";
            displayName = "Enemy Equipment";
            tooltip = "Enemy Equipment";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_NATO_Enemy_APPEARANCE {
            property = "UO_FW_Briefing_INDFOR_NATO_Enemy_APPEARANCE";
            displayName = "Enemy Appearance";
            tooltip = "Enemy Appearance";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_NATO_Enemy_MLCOA {
            property = "UO_FW_Briefing_INDFOR_NATO_Enemy_MLCOA";
            displayName = "Most Likely Course of Action";
            tooltip = "Most Likely Course of Action";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_Enemy_MDCOA {
            property = "UO_FW_Briefing_INDFOR_NATO_Enemy_MDCOA";
            displayName = "Most Dangerous Course of Action";
            tooltip = "Most Dangerous Course of Action";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_FRIENDLY_TITLE {
            property = "UO_FW_Briefing_INDFOR_NATO_FRIENDLY_TITLE";
            displayName = "Friendly";
			control = "SubTitle";
            expression = "true";
            defaultValue = "";

        };
		class UO_FW_Briefing_INDFOR_NATO_FRIENDLY_DIS {
            property = "UO_FW_Briefing_INDFOR_NATO_FRIENDLY_DIS";
            displayName = "Friendly Disposition";
            tooltip = "Friendly Disposition";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_FRIENDLY_Higher {
            property = "UO_FW_Briefing_INDFOR_NATO_FRIENDLY_Higher";
            displayName = "Friendly Higher Units";
            tooltip = "Friendly Higher Units";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_FRIENDLY_STRENGTH {
            property = "UO_FW_Briefing_INDFOR_NATO_FRIENDLY_STRENGTH";
            displayName = "Friendly Strength";
            tooltip = "Friendly Strength";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
        class UO_FW_Briefing_INDFOR_NATO_FRIENDLY_APPEARANCE {
            property = "UO_FW_Briefing_INDFOR_NATO_FRIENDLY_APPEARANCE";
            displayName = "Friendly Appearance";
            tooltip = "Friendly Appearance";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_Mission_TITLE {
            property = "UO_FW_Briefing_INDFOR_NATO_Mission_TITLE";
            displayName = "Mission";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";

        };
        class UO_FW_Briefing_INDFOR_NATO_Mission {
            property = "UO_FW_Briefing_INDFOR_NATO_Mission";
            displayName = "Mission";
            tooltip = "Mission";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_EXECUTION_TITLE {
            property = "UO_FW_Briefing_INDFOR_NATO_EXECUTION_TITLE";
            displayName = "Execution";
            tooltip = "Execution";
			control = "CategoryTitleIndent";
            validate = "STRING";
            expression = "true";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_EXECUTION_INTENT {
            property = "UO_FW_Briefing_INDFOR_NATO_EXECUTION_INTENT";
            displayName = "Intent";
            tooltip = "Intent";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_EXECUTION_MANEUVER {
            property = "UO_FW_Briefing_INDFOR_NATO_EXECUTION_MANEUVER";
            displayName = "Maneuver";
            tooltip = "Maneuver";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_EXECUTION_Timings {
            property = "UO_FW_Briefing_INDFOR_NATO_EXECUTION_Timings";
            displayName = "Timings";
            tooltip = "Timings";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_EXECUTION_Tasks {
            property = "UO_FW_Briefing_INDFOR_NATO_EXECUTION_Tasks";
            displayName = "Tasks";
            tooltip = "Tasks";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_SANDS_TITLE {
            property = "UO_FW_Briefing_INDFOR_NATO_SANDS_TITLE";
            displayName = "Service Support";
            tooltip = "Service Support";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_SANDS_SUPPORT_TITLE {
            property = "UO_FW_Briefing_INDFOR_NATO_SANDS_SUPPORT_TITLE";
            displayName = "Support";
            tooltip = "Support";
			control = "SubTitle";
            expression = "true";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_SANDS_SUPPORT_FIRES {
            property = "UO_FW_Briefing_INDFOR_NATO_SANDS_SUPPORT_FIRES";
            displayName = "Fires";
            tooltip = "Fires";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_SANDS_SUPPORT_AMMO {
            property = "UO_FW_Briefing_INDFOR_NATO_SANDS_SUPPORT_AMMO";
            displayName = "Ammo";
            tooltip = "Ammo";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_SANDS_SERVICE_TITLE {
            property = "UO_FW_Briefing_INDFOR_NATO_SANDS_SERVICE_TITLE";
            displayName = "Service";
            tooltip = "Service";
			control = "SubTitle";
            expression = "true";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_SANDS_SERVICE_GENERAL {
            property = "UO_FW_Briefing_INDFOR_NATO_SANDS_SERVICE_GENERAL";
            displayName = "General";
            tooltip = "General";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_CANDS_TITLE {
            property = "UO_FW_Briefing_INDFOR_NATO_CANDS_TITLE";
            displayName = "Command and Signals";
            tooltip = "Command and Signals";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_CANDS_COMMAND_TITLE {
            property = "UO_FW_Briefing_INDFOR_NATO_CANDS_COMMAND_TITLE";
            displayName = "Command";
            tooltip = "Command";
			control = "SubTitle";
            expression = "true";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_CANDS_COMMAND {
            property = "UO_FW_Briefing_INDFOR_NATO_CANDS_COMMAND";
            displayName = "Command";
            tooltip = "Command";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_CANDS_Signals_TITLE {
            property = "UO_FW_Briefing_INDFOR_NATO_CANDS_Signals_TITLE";
            displayName = "Signals";
            tooltip = "Signals";
			control = "SubTitle";
            expression = "true";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_CANDS_Signals_FREQ {
            property = "UO_FW_Briefing_INDFOR_NATO_CANDS_Signals_FREQ";
            displayName = "Radio Frequencies";
            tooltip = "Radio Frequencies";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_CANDS_Signals_CODEWORDS {
            property = "UO_FW_Briefing_INDFOR_NATO_CANDS_Signals_CODEWORDS";
            displayName = "Codewords";
            tooltip = "Codewords";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_CANDS_Signals_SPECIAL {
            property = "UO_FW_Briefing_INDFOR_NATO_CANDS_Signals_SPECIAL";
            displayName = "Special Signals";
            tooltip = "Special Signals";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_CANDS_Signals_CALLSIGNS {
            property = "UO_FW_Briefing_INDFOR_NATO_CANDS_Signals_CALLSIGNS";
            displayName = "Callsigns";
            tooltip = "Callsigns";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
		class UO_FW_Briefing_INDFOR_NATO_CANDS_Signals_PASSWORDS {
            property = "UO_FW_Briefing_INDFOR_NATO_CANDS_Signals_PASSWORDS";
            displayName = "Passwords";
            tooltip = "Passwords";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
    };
};

class INDFOR_WPStyle {
    displayName = "Warsaw Pact Style Briefing";
    collapsed = 1;
    class Attributes {
		class UO_FW_Briefing_INDFOR_Warsaw {
            property = "UO_FW_Briefing_INDFOR_Warsaw";
            displayName = "Warsaw Pact style briefing";
            tooltip = "Enables Warsaw Pact style briefing";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "false";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Preliminaries_TITLE {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Preliminaries_TITLE";
            displayName = "Preliminaries";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Preliminaries_Weather {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Preliminaries_Weather";
            displayName = "Weather";
            tooltip = "Weather";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Preliminaries_Terrain {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Preliminaries_Terrain";
            displayName = "Terrain";
            tooltip = "Terrain";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Reference_TITLE {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Reference_TITLE";
            displayName = "Reference Points";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Reference_DeploymentPoints {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Reference_DeploymentPoints";
            displayName = "Deployment Reference Points";
            tooltip = "Deployment Reference Points";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Reference_SubsequentPoints {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Reference_SubsequentPoints";
            displayName = "Subsequent Reference Points";
            tooltip = "Subsequent Reference Points";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Enemy_TITLE {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Enemy_TITLE";
            displayName = "Enemy";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Enemy_Disp{
            property = "UO_FW_Briefing_INDFOR_Warsaw_Enemy_Disp;
            displayName = "Enemy Disposition";
            tooltip = "Enemy Disposition";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Enemy_Equip{
            property = "UO_FW_Briefing_INDFOR_Warsaw_Enemy_Equip;
            displayName = "Enemy Equipment";
            tooltip = "Enemy Equipment";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Enemy_Prob_HQ {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Enemy_Prob_HQ";
            displayName = "Probable Enemy HQ Location";
            tooltip = "Probable Enemy HQ Location";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Enemy_Prob_Line {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Enemy_Prob_Line";
            displayName = "Probable Enemy Main Element Location";
            tooltip = "Probable Enemy Main Element Location";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Enemy_Prob_Dir_Attack {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Enemy_Prob_Dir_Attack";
            displayName = "Probable Enemy Direction of Attack";
            tooltip = "Probable Enemy Direction of Attack";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Enemy_Prob_Arty {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Enemy_Prob_Arty";
            displayName = "Probable Enemy Artillery Positions & Capability";
            tooltip = "Probable Enemy Artillery Positions & Capability";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Higher_TITLE {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Higher_TITLE";
            displayName = "Higher and Adjacent Units";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Higher_Disp{
            property = "UO_FW_Briefing_INDFOR_Warsaw_Higher_Disp;
            displayName = "Description";
            tooltip = "Description";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Higher_Boundary {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Higher_Boundary";
            displayName = "Boundaries";
            tooltip = "Boundaries";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Higher_Arty {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Higher_Arty";
            displayName = "Location and Capability of Artillery";
            tooltip = "Location and Capability of Artillery";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Mission_TITLE {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Mission_TITLE";
            displayName = "Mission";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Mission_Desc {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Mission_Desc";
            displayName = "Mission Statement";
            tooltip = "Mission Statement";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Mission_DIR {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Mission_DIR";
            displayName = "End State Direction";
            tooltip = "End State Direction";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Order_TITLE {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Order_TITLE";
            displayName = "Order";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Order_Tasks {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Order_Tasks";
            displayName = "Tasks";
            tooltip = "Tasks";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Order_Tasks_Arty {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Order_Tasks_Arty";
            displayName = "Tasks for Artillery Elements";
            tooltip = "Tasks for Artillery Elements";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Order_Timings {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Order_Timings";
            displayName = "Readiness Timings";
            tooltip = "Readiness Timings";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_Order_Signals {
            property = "UO_FW_Briefing_INDFOR_Warsaw_Order_Signals";
            displayName = "Signals";
            tooltip = "Signals";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_COMM_TITLE {
            property = "UO_FW_Briefing_INDFOR_Warsaw_COMM_TITLE";
            displayName = "Location of the Commander";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_COMM_LOC {
            property = "UO_FW_Briefing_INDFOR_Warsaw_COMM_LOC";
            displayName = "Location of the Commander";
            tooltip = "Location of the Commander";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_SUCC_TITLE {
            property = "UO_FW_Briefing_INDFOR_Warsaw_SUCC_TITLE";
            displayName = "Succession of Command";
			control = "CategoryTitleIndent";
            expression = "true";
            defaultValue = "";
        };
		class UO_FW_Briefing_INDFOR_Warsaw_SUCC_DESC {
            property = "UO_FW_Briefing_INDFOR_Warsaw_SUCC_DESC";
            displayName = "Succession of Command";
            tooltip = "Succession of Command";
			control = "EditMulti5";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
	};
};

class INDFOR_Custom_File {
    displayName = "Briefing File";
    collapsed = 1;
    class Attributes {
		class UO_FW_Briefing_INDFOR_File {
            property = "UO_FW_Briefing_INDFOR_File";
            displayName = "Briefing File";
            tooltip = "Loads file as briefing";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "false";
        };
		class UO_FW_Briefing_INDFOR_File_Path {
            property = "UO_FW_Briefing_INDFOR_File_Path";
            displayName = "Path to briefing file";
            tooltip = "Path to briefing file";
			control = "Edit";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";
        };
	};
};

class INDFOR_Appendix {
    displayName = "Appendix Card File";
    collapsed = 1;
    class Attributes {
		class UO_FW_Briefing_INDFOR_Appendix {
            property = "UO_FW_Briefing_INDFOR_Appendix";
            displayName = "Appendix File";
            tooltip = "Enables Appendix File";
            control = "CheckboxState";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "false";

        };
		class UO_FW_Briefing_INDFOR_Appendix_Path {
            property = "UO_FW_Briefing_INDFOR_Appendix_Path";
            displayName = "Path to Appendix file";
            tooltip = "Path to Appendix Briefing File";
			control = "Edit";
            validate = "STRING";
            expression="missionNamespace setVariable ['%s', _value, true]; %s = _value;";
            defaultValue = "''";

        };
	};
};
