if (UO_FW_BRIEFING_BLUFOR_FILE) exitwith {
	if !(UO_FW_BRIEFING_BLUFOR_FILE_PATH isEqualto "") then {
		"" call (compile preprocessFileLineNumbers UO_FW_BRIEFING_BLUFOR_FILE_PATH);
	} else {
		UO_FW_DEBUG("No briefing found for BLUFOR!","No briefing found for BLUFOR!")
	};
};

if ((UO_FW_BRIEFING_BLUFOR_NATO) && !(UO_FW_BRIEFING_BLUFOR_WARSAW)) then {
	//Situation
	NEWTAB("I. Situation:")
	"<font color='#5BD527'><h1>Situation:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_SIT_MAIN + "<br/><br/>" +
	"<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_SIT_TERRAIN + "<br/><br/>" +
	"<font color='#5BD527'><h1>Key Terrain:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_SIT_KEYTERRAIN + "<br/><br/>" +
	"<font color='#5BD527'><h1>Weather:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_SIT_WEATHER
	ENDTAB
	//Enemy
	NEWTAB("   A. Enemy Forces:")
	"<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_ENEMY_DIS + "<br/><br/>" +
	"<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_ENEMY_STRENGTH + "<br/><br/>" +
	"<font color='#5BD527'><h1>Equipment:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_ENEMY_EQUIPMENT + "<br/><br/>" +
	"<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_ENEMY_APPEARANCE + "<br/><br/>" +
	"<font color='#5BD527'><h1>MLCOA:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_ENEMY_MLCOA + "<br/><br/>" +
	"<font color='#5BD527'><h1>MDCOA:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_ENEMY_MDCOA
	ENDTAB
	//Friendly
	NEWTAB("   B. Friendly Forces:")
	"<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_FRIENDLY_DIS + "<br/><br/>" +
	"<font color='#5BD527'><h1>Higher Units:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_FRIENDLY_HIGHER + "<br/><br/>" +
	"<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_FRIENDLY_STRENGTH + "<br/><br/>" +
	"<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_FRIENDLY_APPEARANCE + "<br/><br/>"
	ENDTAB
	//Mission
	NEWTAB("II. Mission:")
	"<font color='#5BD527'><h1>Mission:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_MISSION
	ENDTAB
	NEWTAB("III. Execution:")
	"<font color='#5BD527'><h1>Commanders Intent:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_EXECUTION_INTENT + "<br/><br/>" +
	"<font color='#5BD527'><h1>Maneuver:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_EXECUTION_MANEUVER + "<br/><br/>" +
	"<font color='#5BD527'><h1>Timings:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_EXECUTION_TIMINGS + "<br/><br/>" +
	"<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_EXECUTION_TASKS
	ENDTAB
	NEWTAB("IV. Service Support:")
	""
	ENDTAB
	NEWTAB("   A. Support:")
	"<font color='#5BD527'><h1>Fires:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_SANDS_SUPPORT_FIRES + "<br/><br/>" +
	"<font color='#5BD527'><h1>Ammo:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_SANDS_SUPPORT_AMMO
	ENDTAB
	NEWTAB("   B. Service:")
	"<font color='#5BD527'><h1>General:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_SANDS_SERVICE_GENERAL
	ENDTAB
	NEWTAB("V. Command & Signal:")
	""
	ENDTAB
	NEWTAB("   A. Command:")
	"<font color='#5BD527'><h1>General:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_CANDS_COMMAND
	ENDTAB
	NEWTAB("   B. Signals:")
	"<font color='#5BD527'><h1>Frequencies:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_CANDS_SIGNALS_FREQ + "<br/><br/>" +
	"<font color='#5BD527'><h1>Codewords:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_CANDS_SIGNALS_CODEWORDS + "<br/><br/>" +
	"<font color='#5BD527'><h1>Special Signals:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_CANDS_SIGNALS_SPECIAL + "<br/><br/>" +
	"<font color='#5BD527'><h1>Callsigns:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_CANDS_SIGNALS_CALLSIGNS + "<br/><br/>" +
	"<font color='#5BD527'><h1>Passwords:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_CANDS_SIGNALS_PASSWORDS
	ENDTAB
};

if ((UO_FW_BRIEFING_BLUFOR_WARSAW) && !(UO_FW_BRIEFING_BLUFOR_NATO)) then {
	NEWTAB("I. Preliminaries:")
	"<font color='#5BD527'><h1>Weather:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_WARSAW_PRELIMINARIES_WEATHER + "<br/><br/>" +
	"<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_WARSAW_PRELIMINARIES_TERRAIN
	ENDTAB
	NEWTAB("II. Reference Points:")
	"<font color='#5BD527'><h1>Deployment Reference Points:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_WARSAW_REFERENCE_DEPLOYMENTPOINTS + "<br/><br/>" +
	"<font color='#5BD527'><h1>Subsequent Reference Points:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_WARSAW_REFERENCE_SUBSEQUENTPOINTS
	ENDTAB
	NEWTAB("III. Enemy:")
	"<font color='#5BD527'><h1>Enemy Disposition:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_WARSAW_ENEMY_DISP + "<br/><br/>" +
	"<font color='#5BD527'><h1>Enemy Equipment:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_WARSAW_ENEMY_EQUIP + "<br/><br/>" +
	"<font color='#5BD527'><h1>Probable Enemy HQ Location:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_WARSAW_ENEMY_PROB_HQ + "<br/><br/>" +
	"<font color='#5BD527'><h1>Probable Enemy Main Element Location:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_WARSAW_ENEMY_PROB_LINE + "<br/><br/>" +
	"<font color='#5BD527'><h1>Probable Enemy Direction of Attack:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_WARSAW_ENEMY_PROB_DIR_ATTACK + "<br/><br/>" +
	"<font color='#5BD527'><h1>Probable Enemy Artillery Positions & Capability:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_WARSAW_ENEMY_PROB_ARTY
	ENDTAB
	NEWTAB("IV. Higher and Adjacent Units:")
	"<font color='#5BD527'><h1>Description:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_WARSAW_HIGHER_DISP + "<br/><br/>" +
	"<font color='#5BD527'><h1>Boundaries:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_WARSAW_HIGHER_BOUNDARY + "<br/><br/>" +
	"<font color='#5BD527'><h1>Location and Capability of Artillery:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_WARSAW_HIGHER_ARTY
	ENDTAB
	NEWTAB("V. Mission:")
	"<font color='#5BD527'><h1>Statement:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_WARSAW_MISSION_DESC + "<br/><br/>" +
	"<font color='#5BD527'><h1>End State Direction:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_WARSAW_HIGHER_BOUNDARY
	ENDTAB
	NEWTAB("VI. Order:")
	"<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_WARSAW_ORDER_TASKS + "<br/><br/>" +
	"<font color='#5BD527'><h1>Tasks for Artillery Elements:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_WARSAW_ORDER_TASKS_ARTY + "<br/><br/>" +
	"<font color='#5BD527'><h1>Readiness Timings:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_WARSAW_ORDER_TIMINGS + "<br/><br/>" +
	"<font color='#5BD527'><h1>Signals:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_WARSAW_ORDER_SIGNALS
	ENDTAB
	NEWTAB("VII. Location of the Commander:")
	"<font color='#5BD527'><h1>Location of the Commander:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_WARSAW_COMM_LOC
	ENDTAB
	NEWTAB("VIII. Succession of Command:")
	"<font color='#5BD527'><h1>Succession of Command:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_WARSAW_SUCC_DESC
	ENDTAB
};
	
if (UO_FW_BRIEFING_BLUFOR_APPENDIX) then {
	if !(UO_FW_BRIEFING_BLUFOR_APPENDIX_PATH isEqualto "") then {
		"" call (compile preprocessFileLineNumbers UO_FW_BRIEFING_BLUFOR_APPENDIX_PATH);
	} else {
		UO_FW_DEBUG("No appendix found for BLUFOR!","No appendix found for BLUFOR!")
	};
};

//Mission Notes
NEWTAB("Mission Notes:")
"<font color='#5BD527'><h1>Author:</h1></font color><br/>" + UO_FW_BRIEFING_MISSIONNOTES_AUTHOR + "<br/><br/>" +
"<font color='#5BD527'><h1>Testers:</h1></font color><br/>" + UO_FW_BRIEFING_MISSIONNOTES_TESTERS + "<br/><br/>" +
"<font color='#5BD527'><h1>End Conditions:</h1></font color><br/>" + UO_FW_BRIEFING_MISSIONNOTES_CONDITIONS + "<br/><br/>" +
"<font color='#5BD527'><h1>Mission Specific Notes:</h1></font color><br/>" + UO_FW_BRIEFING_MISSIONNOTES_CUSTOM + "<br/><br/>" +
"<font color='#5BD527'><h1>Mission Changelog:</h1></font color><br/>" + UO_FW_BRIEFING_MISSIONNOTES_CHANGELOG
ENDTAB

private _gamemastermsg = "";

if (getMissionConfigValue ["UO_FW_BRIEFING_MISSIONNOTES_GM",false]) then {
	_gamemastermsg = "This mission is designed for game mastering and can be manipulated as per Mission Notes";
} else {
	_gamemastermsg = "This mission is not designed for game mastering and should only be manipulated for technical, administrative or diagnostic purposes.";
};

//Game Mastering
NEWTAB("Game Mastering")
"<font color='#5BD527'><h1>Game Mastering:</h1></font color><br/>" + _gamemastermsg
ENDTAB;

DISPLAYBRIEFING()