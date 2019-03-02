if (GVAR(File_Indfor)) exitwith {
    if !(GVAR(File_Path_Indfor) isEqualto "") then {
        "" call (compile preprocessFileLineNumbers GVAR(File_Path_Indfor));
    } else {
        ERROR("No briefing found for Indfor!");
    };
};

if (GVAR(NATO_Indfor)) then {
    //Situation
    NEWTAB("I. Situation:")
    "<font color='#5BD527'><h1>Situation:</h1></font color><br/>" + GVAR(NATO_SIT_Main_Indfor) + "<br/><br/>" +
    "<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" + GVAR(NATO_SIT_Terrain_Indfor)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Key Terrain:</h1></font color><br/>" + GVAR(NATO_SIT_KEYTerrain_Indfor)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Weather:</h1></font color><br/>" + GVAR(NATO_SIT_Weather_Indfor)
    ENDTAB
    //Enemy
    NEWTAB("   A. Enemy Forces:")
    "<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + GVAR(NATO_Enemy_DIS_Indfor)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + GVAR(NATO_Enemy_STRENGTH_Indfor)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Equipment:</h1></font color><br/>" + GVAR(NATO_Enemy_EQUIPMENT_Indfor)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + GVAR(NATO_Enemy_APPEARANCE_Indfor)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>MLCOA:</h1></font color><br/>" + GVAR(NATO_Enemy_MLCOA_Indfor)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>MDCOA:</h1></font color><br/>" + GVAR(NATO_Enemy_MDCOA_Indfor)
    ENDTAB
    //Friendly
    NEWTAB("   B. Friendly Forces:")
    "<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + GVAR(NATO_FRIENDLY_DIS_Indfor)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Higher Units:</h1></font color><br/>" + GVAR(NATO_FRIENDLY_Higher_Indfor)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + GVAR(NATO_FRIENDLY_STRENGTH_Indfor)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + GVAR(NATO_FRIENDLY_APPEARANCE_Indfor)  + "<br/><br/>"
    ENDTAB
    //Mission
    NEWTAB("II. Mission:")
    "<font color='#5BD527'><h1>Mission:</h1></font color><br/>" + GVAR(NATO_Mission_Indfor)
    ENDTAB
    NEWTAB("III. Execution:")
    "<font color='#5BD527'><h1>Commanders Intent:</h1></font color><br/>" + GVAR(NATO_EXECUTION_INTENT_Indfor)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Maneuver:</h1></font color><br/>" + GVAR(NATO_EXECUTION_MANEUVER_Indfor)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Timings:</h1></font color><br/>" + GVAR(NATO_EXECUTION_Timings_Indfor)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + GVAR(NATO_EXECUTION_Tasks_Indfor)
    ENDTAB
    NEWTAB("IV. Service Support:")
    ""
    ENDTAB
    NEWTAB("   A. Support:")
    "<font color='#5BD527'><h1>Fires:</h1></font color><br/>" + GVAR(NATO_SANDS_SUPPORT_FIRES_Indfor)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Ammo:</h1></font color><br/>" + GVAR(NATO_SANDS_SUPPORT_AMMO_Indfor)
    ENDTAB
    NEWTAB("   B. Service:")
    "<font color='#5BD527'><h1>General:</h1></font color><br/>" + GVAR(NATO_SANDS_SERVICE_GENERAL_Indfor)
    ENDTAB
    NEWTAB("V. Command & Signal:")
    ""
    ENDTAB
    NEWTAB("   A. Command:")
    "<font color='#5BD527'><h1>General:</h1></font color><br/>" + GVAR(NATO_CANDS_COMMAND_Indfor)
    ENDTAB
    NEWTAB("   B. Signals:")
    "<font color='#5BD527'><h1>Frequencies:</h1></font color><br/>" + GVAR(NATO_CANDS_Signals_FREQ_Indfor)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Codewords:</h1></font color><br/>" + GVAR(NATO_CANDS_Signals_CODEWORDS_Indfor)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Special Signals:</h1></font color><br/>" + GVAR(NATO_CANDS_Signals_SPECIAL_Indfor)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Callsigns:</h1></font color><br/>" + GVAR(NATO_CANDS_Signals_CALLSIGNS_Indfor)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Passwords:</h1></font color><br/>" + GVAR(NATO_CANDS_Signals_PASSWORDS_Indfor)
    ENDTAB
};

if (GVAR(Warsaw_Indfor)) then {
    NEWTAB("I. Preliminaries:")
    "<font color='#5BD527'><h1>Weather:</h1></font color><br/>" + GVAR(Warsaw_Preliminaries_Weather_Indfor)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" + GVAR(Warsaw_Preliminaries_Terrain_Indfor)
    ENDTAB
    NEWTAB("II. Reference Points:")
    "<font color='#5BD527'><h1>Deployment Reference Points:</h1></font color><br/>" + GVAR(Warsaw_Reference_DeploymentPoints_Indfor)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Subsequent Reference Points:</h1></font color><br/>" + GVAR(Warsaw_Reference_SubsequentPoints_Indfor)
    ENDTAB
    NEWTAB("III. Enemy:")
    "<font color='#5BD527'><h1>Enemy Disposition:</h1></font color><br/>" + GVAR(Warsaw_Enemy_Disp_Indfor)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Enemy Equipment:</h1></font color><br/>" + GVAR(Warsaw_Enemy_Equip_Indfor)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Probable Enemy HQ Location:</h1></font color><br/>" + GVAR(Warsaw_Enemy_Prob_HQ_Indfor)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Probable Enemy Main Element Location:</h1></font color><br/>" + GVAR(Warsaw_Enemy_Prob_Line_Indfor)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Probable Enemy Direction of Attack:</h1></font color><br/>" + GVAR(Warsaw_Enemy_Prob_Dir_Attack_Indfor)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Probable Enemy Artillery Positions & Capability:</h1></font color><br/>" + GVAR(Warsaw_Enemy_Prob_Arty_Indfor)
    ENDTAB
    NEWTAB("IV. Higher and Adjacent Units:")
    "<font color='#5BD527'><h1>Description:</h1></font color><br/>" + GVAR(Warsaw_Higher_Disp_Indfor)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Boundaries:</h1></font color><br/>" + GVAR(Warsaw_Higher_Boundary_Indfor)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Location and Capability of Artillery:</h1></font color><br/>" + GVAR(Warsaw_Higher_Arty_Indfor)
    ENDTAB
    NEWTAB("V. Mission:")
    "<font color='#5BD527'><h1>Statement:</h1></font color><br/>" + GVAR(Warsaw_Mission_Desc_Indfor)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>End State Direction:</h1></font color><br/>" + GVAR(Warsaw_Mission_DIR_Indfor)
    ENDTAB
    NEWTAB("VI. Order:")
    "<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + GVAR(Warsaw_Order_Tasks_Indfor)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Tasks for Artillery Elements:</h1></font color><br/>" + GVAR(Warsaw_Order_Tasks_Arty_Indfor)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Readiness Timings:</h1></font color><br/>" + GVAR(Warsaw_Order_Timings_Indfor)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Signals:</h1></font color><br/>" + GVAR(Warsaw_Order_Signals_Indfor)
    ENDTAB
    NEWTAB("VII. Location of the Commander:")
    "<font color='#5BD527'><h1>Location of the Commander:</h1></font color><br/>" + GVAR(Warsaw_COMM_LOC_Indfor)
    ENDTAB
    NEWTAB("VIII. Succession of Command:")
    "<font color='#5BD527'><h1>Succession of Command:</h1></font color><br/>" + GVAR(Warsaw_SUCC_DESC_Indfor)
    ENDTAB
};

if (GVAR(Appendix_Indfor)) then {
    if !(GVAR(Appendix_Path_Indfor) isEqualto "") then {
        "" call (compile preprocessFileLineNumbers (GVAR(Appendix_Path_Indfor)));
    } else {
        ERROR("No appendix found for Indfor!");
    };
};

if (GVAR(MissionNotes_Enable)) then {
    //Mission Notes
    NEWTAB("Mission Notes:")
    "<font color='#5BD527'><h1>Author:</h1></font color><br/>" + GVAR(MissionNotes_Author) + "<br/><br/>" +
    "<font color='#5BD527'><h1>Testers:</h1></font color><br/>" + GVAR(MissionNotes_Testers) + "<br/><br/>" +
    "<font color='#5BD527'><h1>End Conditions:</h1></font color><br/>" + GVAR(MissionNotes_Conditions) + "<br/><br/>" +
    "<font color='#5BD527'><h1>Mission Specific Notes:</h1></font color><br/>" + GVAR(MissionNotes_Custom) + "<br/><br/>" +
    "<font color='#5BD527'><h1>Mission Changelog:</h1></font color><br/>" + GVAR(MissionNotes_Changelog)
    ENDTAB
};

private _gamemastermsg = "";

if (GVAR(MissionNotes_GM)) then {
    _gamemastermsg = "This mission is designed for game mastering and can be manipulated as per Mission Notes";
} else {
    _gamemastermsg = "This mission is not designed for game mastering and should only be manipulated for technical, administrative or diagnostic purposes.";
};

//Game Mastering
NEWTAB("Game Mastering")
    "<font color='#5BD527'><h1>Game Mastering:</h1></font color><br/>" + _gamemastermsg
ENDTAB

DISPLAYBRIEFING()
