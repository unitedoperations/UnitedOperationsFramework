if (UO_FW_BRIEFING_BLUFOR_FILE) exitwith {
	if !(UO_FW_BRIEFING_BLUFOR_FILE_PATH isEqualto "") then {
		"" call (compile preprocessFileLineNumbers UO_FW_BRIEFING_BLUFOR_FILE_PATH);
	} else {
		UO_FW_DEBUG("No briefing found for BLUFOR!","No briefing found for BLUFOR!")
	};
};

if ((UO_FW_BRIEFING_BLUFOR_NATO) && !(UO_FW_BRIEFING_BLUFOR_FILE)) then {
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
	"<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_ENEMY_STRENGTH + "<br/><br/>" +
	"<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_ENEMY_APPEARANCE + "<br/><br/>"
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
	NEWTAB("   B. Support:")
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
	
if (UO_FW_BRIEFING_BLUFOR_APPENDIX) then {
	if !(UO_FW_BRIEFING_BLUFOR_APPENDIX_PATH isEqualto "") then {
		"" call (compile preprocessFileLineNumbers UO_FW_BRIEFING_BLUFOR_APPENDIX_PATH);
	} else {
		UO_FW_DEBUG("No appendix found for BLUFOR!","No appendix found for BLUFOR!")
	};
};
				
DISPLAYBRIEFING()