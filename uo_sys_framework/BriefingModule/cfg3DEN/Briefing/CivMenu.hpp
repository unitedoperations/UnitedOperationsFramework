class EGVAR(Briefing,NATOStyle_Civ) {
    displayName = "NATO Style Briefing";
    collapsed = 1;
    class Attributes {
        class EGVAR(Briefing,NATO_Civ) {
            property = QEGVAR(Briefing,NATO_Civ);
            displayName = "NATO style briefing";
            tooltip = "Enables NATO style briefing";
            control = "CheckboxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(Briefing,NATO_Situation_Title_Civ) {
            property = QEGVAR(Briefing,NATO_Situation_Title_Civ);
            displayName = "Situation";
            control = "CategoryTitle";
            expression = "true";
            defaultValue = "";
        };
        class EGVAR(Briefing,NATO_SIT_Main_Civ) {
            property = QEGVAR(Briefing,NATO_SIT_Main_Civ);
            displayName = "Situation";
            tooltip = "Situation";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_SIT_Terrain_Civ) {
            property = QEGVAR(Briefing,NATO_SIT_Terrain_Civ);
            displayName = "Terrain";
            tooltip = "Terrain";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_SIT_KEYTerrain_Civ) {
            property = QEGVAR(Briefing,NATO_SIT_KEYTerrain_Civ);
            displayName = "Key Terrain";
            tooltip = "Key Terrain";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_SIT_Weather_Civ) {
            property = QEGVAR(Briefing,NATO_SIT_Weather_Civ);
            displayName = "Weather";
            tooltip = "Weather";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_Enemy_Title_Civ) {
            property = QEGVAR(Briefing,NATO_Enemy_Title_Civ);
            displayName = "Enemy";
            control = "SubTitle";
            expression = "true";
            defaultValue = "";
        };
        class EGVAR(Briefing,NATO_Enemy_DIS_Civ) {
            property = QEGVAR(Briefing,NATO_Enemy_DIS_Civ);
            displayName = "Enemy Disposition";
            tooltip = "Enemy Disposition";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_Enemy_STRENGTH_Civ) {
            property = QEGVAR(Briefing,NATO_Enemy_STRENGTH_Civ);
            displayName = "Enemy Strength";
            tooltip = "Enemy Strength";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_Enemy_EQUIPMENT_Civ) {
            property = QEGVAR(Briefing,NATO_Enemy_EQUIPMENT_Civ);
            displayName = "Enemy Equipment";
            tooltip = "Enemy Equipment";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_Enemy_APPEARANCE_Civ) {
            property = QEGVAR(Briefing,NATO_Enemy_APPEARANCE_Civ);
            displayName = "Enemy Appearance";
            tooltip = "Enemy Appearance";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_Enemy_MLCOA_Civ) {
            property = QEGVAR(Briefing,NATO_Enemy_MLCOA_Civ);
            displayName = "Most Likely Course of Action";
            tooltip = "Most Likely Course of Action";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_Enemy_MDCOA_Civ) {
            property = QEGVAR(Briefing,NATO_Enemy_MDCOA_Civ);
            displayName = "Most Dangerous Course of Action";
            tooltip = "Most Dangerous Course of Action";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_FRIENDLY_Title_Civ) {
            property = QEGVAR(Briefing,NATO_FRIENDLY_Title_Civ);
            displayName = "Friendly";
            control = "SubTitle";
            expression = "true";
            defaultValue = "";
        };
        class EGVAR(Briefing,NATO_FRIENDLY_DIS_Civ) {
            property = QEGVAR(Briefing,NATO_FRIENDLY_DIS_Civ);
            displayName = "Friendly Disposition";
            tooltip = "Friendly Disposition";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_FRIENDLY_Higher_Civ) {
            property = QEGVAR(Briefing,NATO_FRIENDLY_Higher_Civ);
            displayName = "Friendly Higher Units";
            tooltip = "Friendly Higher Units";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_FRIENDLY_STRENGTH_Civ) {
            property = QEGVAR(Briefing,NATO_FRIENDLY_STRENGTH_Civ);
            displayName = "Friendly Strength";
            tooltip = "Friendly Strength";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_FRIENDLY_APPEARANCE_Civ) {
            property = QEGVAR(Briefing,NATO_FRIENDLY_APPEARANCE_Civ);
            displayName = "Friendly Appearance";
            tooltip = "Friendly Appearance";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_Mission_Title_Civ) {
            property = QEGVAR(Briefing,NATO_Mission_Title_Civ);
            displayName = "Mission";
            control = "CategoryTitle";
            expression = "true";
            defaultValue = "";
        };
        class EGVAR(Briefing,NATO_Mission_Civ) {
            property = QEGVAR(Briefing,NATO_Mission_Civ);
            displayName = "Mission";
            tooltip = "Mission";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_EXECUTION_Title_Civ) {
            property = QEGVAR(Briefing,NATO_EXECUTION_Title_Civ);
            displayName = "Execution";
            tooltip = "Execution";
            control = "CategoryTitle";
            validate = "STRING";
            expression = "true";
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_EXECUTION_INTENT_Civ) {
            property = QEGVAR(Briefing,NATO_EXECUTION_INTENT_Civ);
            displayName = "Intent";
            tooltip = "Intent";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_EXECUTION_MANEUVER_Civ) {
            property = QEGVAR(Briefing,NATO_EXECUTION_MANEUVER_Civ);
            displayName = "Maneuver";
            tooltip = "Maneuver";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_EXECUTION_Timings_Civ) {
            property = QEGVAR(Briefing,NATO_EXECUTION_Timings_Civ);
            displayName = "Timings";
            tooltip = "Timings";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_EXECUTION_Tasks_Civ) {
            property = QEGVAR(Briefing,NATO_EXECUTION_Tasks_Civ);
            displayName = "Tasks";
            tooltip = "Tasks";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_SANDS_Title_Civ) {
            property = QEGVAR(Briefing,NATO_SANDS_Title_Civ);
            displayName = "Service Support";
            tooltip = "Service Support";
            control = "CategoryTitle";
            expression = "true";
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_SANDS_SUPPORT_Title_Civ) {
            property = QEGVAR(Briefing,NATO_SANDS_SUPPORT_Title_Civ);
            displayName = "Support";
            tooltip = "Support";
            control = "SubTitle";
            expression = "true";
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_SANDS_SUPPORT_FIRES_Civ) {
            property = QEGVAR(Briefing,NATO_SANDS_SUPPORT_FIRES_Civ);
            displayName = "Fires";
            tooltip = "Fires";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_SANDS_SUPPORT_AMMO_Civ) {
            property = QEGVAR(Briefing,NATO_SANDS_SUPPORT_AMMO_Civ);
            displayName = "Ammo";
            tooltip = "Ammo";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_SANDS_SERVICE_Title_Civ) {
            property = QEGVAR(Briefing,NATO_SANDS_SERVICE_Title_Civ);
            displayName = "Service";
            tooltip = "Service";
            control = "SubTitle";
            expression = "true";
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_SANDS_SERVICE_GENERAL_Civ) {
            property = QEGVAR(Briefing,NATO_SANDS_SERVICE_GENERAL_Civ);
            displayName = "General";
            tooltip = "General";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_CANDS_Title_Civ) {
            property = QEGVAR(Briefing,NATO_CANDS_Title_Civ);
            displayName = "Command and Signals";
            tooltip = "Command and Signals";
            control = "CategoryTitle";
            expression = "true";
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_CANDS_COMMAND_Title_Civ) {
            property = QEGVAR(Briefing,NATO_CANDS_COMMAND_Title_Civ);
            displayName = "Command";
            tooltip = "Command";
            control = "SubTitle";
            expression = "true";
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_CANDS_COMMAND_Civ) {
            property = QEGVAR(Briefing,NATO_CANDS_COMMAND_Civ);
            displayName = "Command";
            tooltip = "Command";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_CANDS_Signals_Title_Civ) {
            property = QEGVAR(Briefing,NATO_CANDS_Signals_Title_Civ);
            displayName = "Signals";
            tooltip = "Signals";
            control = "SubTitle";
            expression = "true";
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_CANDS_Signals_FREQ_Civ) {
            property = QEGVAR(Briefing,NATO_CANDS_Signals_FREQ_Civ);
            displayName = "Radio Frequencies";
            tooltip = "Radio Frequencies";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_CANDS_Signals_CODEWORDS_Civ) {
            property = QEGVAR(Briefing,NATO_CANDS_Signals_CODEWORDS_Civ);
            displayName = "Codewords";
            tooltip = "Codewords";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_CANDS_Signals_SPECIAL_Civ) {
            property = QEGVAR(Briefing,NATO_CANDS_Signals_SPECIAL_Civ);
            displayName = "Special Signals";
            tooltip = "Special Signals";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_CANDS_Signals_CALLSIGNS_Civ) {
            property = QEGVAR(Briefing,NATO_CANDS_Signals_CALLSIGNS_Civ);
            displayName = "Callsigns";
            tooltip = "Callsigns";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,NATO_CANDS_Signals_PASSWORDS_Civ) {
            property = QEGVAR(Briefing,NATO_CANDS_Signals_PASSWORDS_Civ);
            displayName = "Passwords";
            tooltip = "Passwords";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
    };
};
class EGVAR(Briefing,WPStyle_Civ) {
    displayName = "Warsaw Pact Style Briefing";
    collapsed = 1;
    class Attributes {
        class EGVAR(Briefing,Warsaw_Civ) {
            property = QEGVAR(Briefing,Warsaw_Civ);
            displayName = "Warsaw Pact style briefing";
            tooltip = "Enables Warsaw Pact style briefing";
            control = "CheckboxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(Briefing,Warsaw_Preliminaries_Title_Civ) {
            property = QEGVAR(Briefing,Warsaw_Preliminaries_Title_Civ);
            displayName = "Preliminaries";
            control = "CategoryTitle";
            expression = "true";
            defaultValue = "";
        };
        class EGVAR(Briefing,Warsaw_Preliminaries_Weather_Civ) {
            property = QEGVAR(Briefing,Warsaw_Preliminaries_Weather_Civ);
            displayName = "Weather";
            tooltip = "Weather";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,Warsaw_Preliminaries_Terrain_Civ) {
            property = QEGVAR(Briefing,Warsaw_Preliminaries_Terrain_Civ);
            displayName = "Terrain";
            tooltip = "Terrain";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,Warsaw_Reference_Title_Civ) {
            property = QEGVAR(Briefing,Warsaw_Reference_Title_Civ);
            displayName = "Reference Points";
            control = "CategoryTitle";
            expression = "true";
            defaultValue = "";
        };
        class EGVAR(Briefing,Warsaw_Reference_DeploymentPoints_Civ) {
            property = QEGVAR(Briefing,Warsaw_Reference_DeploymentPoints_Civ);
            displayName = "Deployment Reference Points";
            tooltip = "Deployment Reference Points";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,Warsaw_Reference_SubsequentPoints_Civ) {
            property = QEGVAR(Briefing,Warsaw_Reference_SubsequentPoints_Civ);
            displayName = "Subsequent Reference Points";
            tooltip = "Subsequent Reference Points";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,Warsaw_Enemy_Title_Civ) {
            property = QEGVAR(Briefing,Warsaw_Enemy_Title_Civ);
            displayName = "Enemy";
            control = "CategoryTitle";
            expression = "true";
            defaultValue = "";
        };
        class EGVAR(Briefing,Warsaw_Enemy_Disp_Civ) {
            property = QEGVAR(Briefing,Warsaw_Enemy_Disp_Civ);
            displayName = "Enemy Disposition";
            tooltip = "Enemy Disposition";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,Warsaw_Enemy_Equip_Civ) {
            property = QEGVAR(Briefing,Warsaw_Enemy_Equip_Civ);
            displayName = "Enemy Equipment";
            tooltip = "Enemy Equipment";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,Warsaw_Enemy_Prob_HQ_Civ) {
            property = QEGVAR(Briefing,Warsaw_Enemy_Prob_HQ_Civ);
            displayName = "Probable Enemy HQ Location";
            tooltip = "Probable Enemy HQ Location";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,Warsaw_Enemy_Prob_Line_Civ) {
            property = QEGVAR(Briefing,Warsaw_Enemy_Prob_Line_Civ);
            displayName = "Probable Enemy Main Element Location";
            tooltip = "Probable Enemy Main Element Location";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,Warsaw_Enemy_Prob_Dir_Attack_Civ) {
            property = QEGVAR(Briefing,Warsaw_Enemy_Prob_Dir_Attack_Civ);
            displayName = "Probable Enemy Direction of Attack";
            tooltip = "Probable Enemy Direction of Attack";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,Warsaw_Enemy_Prob_Arty_Civ) {
            property = QEGVAR(Briefing,Warsaw_Enemy_Prob_Arty_Civ);
            displayName = "Probable Enemy Artillery Positions and Capability";
            tooltip = "Probable Enemy Artillery Positions and Capability";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,Warsaw_Higher_Title_Civ) {
            property = QEGVAR(Briefing,Warsaw_Higher_Title_Civ);
            displayName = "Higher and Adjacent Units";
            control = "CategoryTitle";
            expression = "true";
            defaultValue = "";
        };
        class EGVAR(Briefing,Warsaw_Higher_Disp_Civ) {
            property = QEGVAR(Briefing,Warsaw_Higher_Disp_Civ);
            displayName = "Description";
            tooltip = "Description";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,Warsaw_Higher_Boundary_Civ) {
            property = QEGVAR(Briefing,Warsaw_Higher_Boundary_Civ);
            displayName = "Boundaries";
            tooltip = "Boundaries";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,Warsaw_Higher_Arty_Civ) {
            property = QEGVAR(Briefing,Warsaw_Higher_Arty_Civ);
            displayName = "Location and Capability of Artillery";
            tooltip = "Location and Capability of Artillery";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,Warsaw_Mission_Title_Civ) {
            property = QEGVAR(Briefing,Warsaw_Mission_Title_Civ);
            displayName = "Mission";
            control = "CategoryTitle";
            expression = "true";
            defaultValue = "";
        };
        class EGVAR(Briefing,Warsaw_Mission_Desc_Civ) {
            property = QEGVAR(Briefing,Warsaw_Mission_Desc_Civ);
            displayName = "Mission Statement";
            tooltip = "Mission Statement";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,Warsaw_Mission_DIR_Civ) {
            property = QEGVAR(Briefing,Warsaw_Mission_DIR_Civ);
            displayName = "End State Direction";
            tooltip = "End State Direction";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,Warsaw_Order_Title_Civ) {
            property = QEGVAR(Briefing,Warsaw_Order_Title_Civ);
            displayName = "Order";
            control = "CategoryTitle";
            expression = "true";
            defaultValue = "";
        };
        class EGVAR(Briefing,Warsaw_Order_Tasks_Civ) {
            property = QEGVAR(Briefing,Warsaw_Order_Tasks_Civ);
            displayName = "Tasks";
            tooltip = "Tasks";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,Warsaw_Order_Tasks_Arty_Civ) {
            property = QEGVAR(Briefing,Warsaw_Order_Tasks_Arty_Civ);
            displayName = "Tasks for Artillery Elements";
            tooltip = "Tasks for Artillery Elements";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,Warsaw_Order_Timings_Civ) {
            property = QEGVAR(Briefing,Warsaw_Order_Timings_Civ);
            displayName = "Readiness Timings";
            tooltip = "Readiness Timings";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,Warsaw_Order_Signals_Civ) {
            property = QEGVAR(Briefing,Warsaw_Order_Signals_Civ);
            displayName = "Signals";
            tooltip = "Signals";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,Warsaw_COMM_Title_Civ) {
            property = QEGVAR(Briefing,Warsaw_COMM_Title_Civ);
            displayName = "Location of the Commander";
            control = "CategoryTitle";
            expression = "true";
            defaultValue = "";
        };
        class EGVAR(Briefing,Warsaw_COMM_LOC_Civ) {
            property = QEGVAR(Briefing,Warsaw_COMM_LOC_Civ);
            displayName = "Location of the Commander";
            tooltip = "Location of the Commander";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,Warsaw_SUCC_Title_Civ) {
            property = QEGVAR(Briefing,Warsaw_SUCC_Title_Civ);
            displayName = "Succession of Command";
            control = "CategoryTitle";
            expression = "true";
            defaultValue = "";
        };
        class EGVAR(Briefing,Warsaw_SUCC_DESC_Civ) {
            property = QEGVAR(Briefing,Warsaw_SUCC_DESC_Civ);
            displayName = "Succession of Command";
            tooltip = "Succession of Command";
            control = "EditMulti5";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
    };
};
class EGVAR(Briefing,Custom_File_Civ) {
    displayName = "Briefing File";
    collapsed = 1;
    class Attributes {
        class EGVAR(Briefing,File_Civ) {
            property = QEGVAR(Briefing,File_Civ);
            displayName = "Briefing File";
            tooltip = "Loads file as briefing";
            control = "CheckboxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(Briefing,File_Path_Civ) {
            property = QEGVAR(Briefing,File_Path_Civ);
            displayName = "Path to briefing file";
            tooltip = "Path to briefing file";
            control = "Edit";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
    };
};
class EGVAR(Briefing,Appendix_Civ) {
    displayName = "Appendix Card File";
    collapsed = 1;
    class Attributes {
        class EGVAR(Briefing,Appendix_Civ) {
            property = QEGVAR(Briefing,Appendix_Civ);
            displayName = "Appendix File";
            tooltip = "Enables Appendix File";
            control = "CheckboxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(Briefing,Appendix_Path_Civ) {
            property = QEGVAR(Briefing,Appendix_Path_Civ);
            displayName = "Path to Appendix file";
            tooltip = "Path to Appendix Briefing File";
            control = "Edit";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
    };
};

class EGVAR(Briefing,PID_Civfor) {
    displayName = "PID Cards";
    collapsed = 1;
    class Attributes {
        class EGVAR(Briefing,PID_Enabled_Civfor) {
            property = QEGVAR(Briefing,PID_Enabled_Civfor);
            displayName = "Enable PID Cards";
            tooltip = "Enables PID cards in the briefing";
            control = "CheckboxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class EGVAR(Briefing,FriendlyPIDCardDescription_Civfor) {
            property = QEGVAR(Briefing,FriendlyPIDCardDescription_Civfor);
            displayName = "Friendly Forces Description";
            tooltip = "Additional information about the friendly forces to be displayed";
            control = "Edit";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,FriendlyPIDCardPath_Civfor) {
            property = QEGVAR(Briefing,FriendlyPIDCardPath_Civfor);
            displayName = "Friendly Forces Path";
            tooltip = "Path to PID Card for friendly forces in the mission folder";
            control = "Edit";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        // class EGVAR(Briefing,FriendlyPIDCard_Civfor) {
        //     displayName = "Friendly Forces PID Card";
        //     tooltip = "PID card for friendly forces";
        //     property = QEGVAR(Briefing,FriendlyPIDCard_Civfor);
        //     control = QEGVAR(Briefing,PIDCardSelectionAttribute);
        //     typeName = "STRING";
        //     expression = SCENARIO_EXPRESSION;
        //     defaultValue = "'None'";
        // };

        class EGVAR(Briefing,EnemyPIDCardDescription_Civfor) {
            property = QEGVAR(Briefing,EnemyPIDCardDescription_Civfor);
            displayName = "Enemy Forces Description";
            tooltip = "Additional information about the enemy forces to be displayed";
            control = "Edit";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,EnemyPIDCardPath_Civfor) {
            property = QEGVAR(Briefing,EnemyPIDCardPath_Civfor);
            displayName = "Enemy Forces Path";
            tooltip = "Path to PID Card for enemy forces in the mission folder";
            control = "Edit";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        // class EGVAR(Briefing,EnemyPIDCard_Civfor) {
        //     displayName = "Enemy Forces PID Card";
        //     tooltip = "PID Card for Enemy Forces";
        //     property = QEGVAR(Briefing,EnemyPIDCard_Civfor);
        //     control = QEGVAR(Briefing,PIDCardSelectionAttribute);
        //     typeName = "STRING";
        //     expression = SCENARIO_EXPRESSION;
        //     defaultValue = "'None'";
        // }; 

        class EGVAR(Briefing,AdditionalPIDCardDescription_Civfor) {
            property = QEGVAR(Briefing,AdditionalPIDCardDescription_Civfor);
            displayName = "Additional Forces Description";
            tooltip = "Additional information about the additional forces to be displayed";
            control = "Edit";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,AdditionalPIDCardPath_Civfor) {
            property = QEGVAR(Briefing,AdditionalPIDCardPath_Civfor);
            displayName = "Additional Forces Path";
            tooltip = "Path to PID Card for additional forces in the mission folder";
            control = "Edit";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        // class EGVAR(Briefing,AdditionalPIDCard_Civfor) {
        //     displayName = "Additional Forces PID Card";
        //     tooltip = "PID Card for additional forces";
        //     property = QEGVAR(Briefing,AdditionalPIDCard_Civfor);
        //     control = QEGVAR(Briefing,PIDCardSelectionAttribute);
        //     typeName = "STRING";
        //     expression = SCENARIO_EXPRESSION;
        //     defaultValue = "'None'";
        // };
        
        class EGVAR(Briefing,CivilianPIDCardDescription_Civfor) {
            property = QEGVAR(Briefing,CivilianPIDCardDescription_Civfor);
            displayName = "Civilian Forces Description";
            tooltip = "Civilian information about the civilian forces to be displayed";
            control = "Edit";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,CivilianPIDCardPath_Civfor) {
            property = QEGVAR(Briefing,CivilianPIDCardPath_Civfor);
            displayName = "Civilian Forces Path";
            tooltip = "Path to PID card for civilian forces in the mission folder";
            control = "Edit";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        // class EGVAR(Briefing,CivilianPIDCard_Civfor) {
        //     displayName = "Civilian Forces PID Card";
        //     tooltip = "PID card for civilian forces";
        //     property = QEGVAR(Briefing,CivilianPIDCard_Civfor);
        //     control = QEGVAR(Briefing,PIDCardSelectionAttribute);
        //     typeName = "STRING";
        //     expression = SCENARIO_EXPRESSION;
        //     defaultValue = "'None'";
        // };

        class EGVAR(Briefing,HVTPIDCardDescription_Civfor) {
            property = QEGVAR(Briefing,HVTPIDCardDescription_Civfor);
            displayName = "HVT Description";
            tooltip = "Additional information about the HVT to be displayed";
            control = "Edit";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        class EGVAR(Briefing,HVTPIDCardPath_Civfor) {
            property = QEGVAR(Briefing,HVTPIDCardPath_Civfor);
            displayName = "HVT Path";
            tooltip = "Path to PID card for HVT in the mission folder";
            control = "Edit";
            validate = "STRING";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "''";
        };
        // class EGVAR(Briefing,HVTPIDCard_Civfor) {
        //     displayName = "HVT PID Card";
        //     tooltip = "PID card for HVT";
        //     property = QEGVAR(Briefing,HVTPIDCard_Civfor);
        //     control = QEGVAR(Briefing,PIDCardSelectionAttribute);
        //     typeName = "STRING";
        //     expression = SCENARIO_EXPRESSION;
        //     defaultValue = "'None'";
        // };
    };
};