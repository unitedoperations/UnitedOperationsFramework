if (GVAR(File_Civilian)) exitwith {
    if !(GVAR(File_Path_Civilian) isEqualto "") then {
        "" call (compile preprocessFileLineNumbers GVAR(File_Path_Civilian));
    } else {
        ERROR("No briefing found for CIVILIAN!");
    };
};

if (GVAR(NATO_Civilian)) then {
    //Situation
    NEWTAB("I. Situation:")
    "<font color='#5BD527'><h1>Situation:</h1></font color><br/>" + GVAR(NATO_SIT_Main_Civilian) + "<br/><br/>" +
    "<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" + GVAR(NATO_SIT_Terrain_Civilian)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Key Terrain:</h1></font color><br/>" + GVAR(NATO_SIT_KEYTerrain_Civilian)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Weather:</h1></font color><br/>" + GVAR(NATO_SIT_Weather_Civilian)
    ENDTAB
    //Enemy
    NEWTAB("   A. Enemy Forces:")
    "<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + GVAR(NATO_Enemy_DIS_Civilian)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + GVAR(NATO_Enemy_STRENGTH_Civilian)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Equipment:</h1></font color><br/>" + GVAR(NATO_Enemy_EQUIPMENT_Civilian)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + GVAR(NATO_Enemy_APPEARANCE_Civilian)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>MLCOA:</h1></font color><br/>" + GVAR(NATO_Enemy_MLCOA_Civilian)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>MDCOA:</h1></font color><br/>" + GVAR(NATO_Enemy_MDCOA_Civilian)
    ENDTAB
    //Friendly
    NEWTAB("   B. Friendly Forces:")
    "<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + GVAR(NATO_FRIENDLY_DIS_Civilian)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Higher Units:</h1></font color><br/>" + GVAR(NATO_FRIENDLY_Higher_Civilian)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + GVAR(NATO_FRIENDLY_STRENGTH_Civilian)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + GVAR(NATO_FRIENDLY_APPEARANCE_Civilian)  + "<br/><br/>"
    ENDTAB
    //Mission
    NEWTAB("II. Mission:")
    "<font color='#5BD527'><h1>Mission:</h1></font color><br/>" + GVAR(NATO_Mission_Civilian)
    ENDTAB
    NEWTAB("III. Execution:")
    "<font color='#5BD527'><h1>Commanders Intent:</h1></font color><br/>" + GVAR(NATO_EXECUTION_INTENT_Civilian)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Maneuver:</h1></font color><br/>" + GVAR(NATO_EXECUTION_MANEUVER_Civilian)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Timings:</h1></font color><br/>" + GVAR(NATO_EXECUTION_Timings_Civilian)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + GVAR(NATO_EXECUTION_Tasks_Civilian)
    ENDTAB
    NEWTAB("IV. Service Support:")
    ""
    ENDTAB
    NEWTAB("   A. Support:")
    "<font color='#5BD527'><h1>Fires:</h1></font color><br/>" + GVAR(NATO_SANDS_SUPPORT_FIRES_Civilian)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Ammo:</h1></font color><br/>" + GVAR(NATO_SANDS_SUPPORT_AMMO_Civilian)
    ENDTAB
    NEWTAB("   B. Service:")
    "<font color='#5BD527'><h1>General:</h1></font color><br/>" + GVAR(NATO_SANDS_SERVICE_GENERAL_Civilian)
    ENDTAB
    NEWTAB("V. Command & Signal:")
    ""
    ENDTAB
    NEWTAB("   A. Command:")
    "<font color='#5BD527'><h1>General:</h1></font color><br/>" + GVAR(NATO_CANDS_COMMAND_Civilian)
    ENDTAB
    NEWTAB("   B. Signals:")
    "<font color='#5BD527'><h1>Frequencies:</h1></font color><br/>" + GVAR(NATO_CANDS_Signals_FREQ_Civilian)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Codewords:</h1></font color><br/>" + GVAR(NATO_CANDS_Signals_CODEWORDS_Civilian)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Special Signals:</h1></font color><br/>" + GVAR(NATO_CANDS_Signals_SPECIAL_Civilian)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Callsigns:</h1></font color><br/>" + GVAR(NATO_CANDS_Signals_CALLSIGNS_Civilian)  + "<br/><br/>" +
    "<font color='#5BD527'><h1>Passwords:</h1></font color><br/>" + GVAR(NATO_CANDS_Signals_PASSWORDS_Civilian)
    ENDTAB
};

if (GVAR(Warsaw_Civilian)) then {
    NEWTAB("I. Preliminaries:")
    "<font color='#5BD527'><h1>Weather:</h1></font color><br/>" + GVAR(Warsaw_Preliminaries_Weather_Civilian)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" + GVAR(Warsaw_Preliminaries_Terrain_Civilian)
    ENDTAB
    NEWTAB("II. Reference Points:")
    "<font color='#5BD527'><h1>Deployment Reference Points:</h1></font color><br/>" + GVAR(Warsaw_Reference_DeploymentPoints_Civilian)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Subsequent Reference Points:</h1></font color><br/>" + GVAR(Warsaw_Reference_SubsequentPoints_Civilian)
    ENDTAB
    NEWTAB("III. Enemy:")
    "<font color='#5BD527'><h1>Enemy Disposition:</h1></font color><br/>" + GVAR(Warsaw_Enemy_Disp_Civilian)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Enemy Equipment:</h1></font color><br/>" + GVAR(Warsaw_Enemy_Equip_Civilian)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Probable Enemy HQ Location:</h1></font color><br/>" + GVAR(Warsaw_Enemy_Prob_HQ_Civilian)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Probable Enemy Main Element Location:</h1></font color><br/>" + GVAR(Warsaw_Enemy_Prob_Line_Civilian)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Probable Enemy Direction of Attack:</h1></font color><br/>" + GVAR(Warsaw_Enemy_Prob_Dir_Attack_Civilian)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Probable Enemy Artillery Positions & Capability:</h1></font color><br/>" + GVAR(Warsaw_Enemy_Prob_Arty_Civilian)
    ENDTAB
    NEWTAB("IV. Higher and Adjacent Units:")
    "<font color='#5BD527'><h1>Description:</h1></font color><br/>" + GVAR(Warsaw_Higher_Disp_Civilian)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Boundaries:</h1></font color><br/>" + GVAR(Warsaw_Higher_Boundary_Civilian)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Location and Capability of Artillery:</h1></font color><br/>" + GVAR(Warsaw_Higher_Arty_Civilian)
    ENDTAB
    NEWTAB("V. Mission:")
    "<font color='#5BD527'><h1>Statement:</h1></font color><br/>" + GVAR(Warsaw_Mission_Desc_Civilian)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>End State Direction:</h1></font color><br/>" + GVAR(Warsaw_Mission_DIR_Civilian)
    ENDTAB
    NEWTAB("VI. Order:")
    "<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + GVAR(Warsaw_Order_Tasks_Civilian)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Tasks for Artillery Elements:</h1></font color><br/>" + GVAR(Warsaw_Order_Tasks_Arty_Civilian)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Readiness Timings:</h1></font color><br/>" + GVAR(Warsaw_Order_Timings_Civilian)   + "<br/><br/>" +
    "<font color='#5BD527'><h1>Signals:</h1></font color><br/>" + GVAR(Warsaw_Order_Signals_Civilian)
    ENDTAB
    NEWTAB("VII. Location of the Commander:")
    "<font color='#5BD527'><h1>Location of the Commander:</h1></font color><br/>" + GVAR(Warsaw_COMM_LOC_Civilian)
    ENDTAB
    NEWTAB("VIII. Succession of Command:")
    "<font color='#5BD527'><h1>Succession of Command:</h1></font color><br/>" + GVAR(Warsaw_SUCC_DESC_Civilian)
    ENDTAB
};

if (GVAR(Appendix_Civilian)) then {
    if !(GVAR(Appendix_Path_Civilian) isEqualto "") then {
        "" call (compile preprocessFileLineNumbers GVAR(Appendix_Path_Civilian));
    } else {
        ERROR("No appendix found for CIVILIAN!");
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
