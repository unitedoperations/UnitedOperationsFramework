
_br = toString [13,10];//(carriage return & line feed)
_export = "switch(side player) do " + _br +
"{" + _br +
"case west:" + _br + 
"{" + _br +
	//Situation
	 "NEWTAB(""I. Situation:"")" + _br +
	"<font color='#5BD527'><h1>Situation:</h1></font color><br/>" + _br + UO_FW_BRIEFING_BLUFOR_NATO_SIT_MAIN + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" + _br + UO_FW_BRIEFING_BLUFOR_NATO_SIT_TERRAIN + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Key Terrain:</h1></font color><br/>" + _br + UO_FW_BRIEFING_BLUFOR_NATO_SIT_KEYTERRAIN + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Weather:</h1></font color><br/>" + _br + UO_FW_BRIEFING_BLUFOR_NATO_SIT_WEATHER + _br +
	"ENDTAB" +  _br +
	_br +
	//Enemy
	"NEWTAB(""   A. Enemy Forces:"")" + _br +
	"<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + _br + UO_FW_BRIEFING_BLUFOR_NATO_ENEMY_DIS + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + _br + UO_FW_BRIEFING_BLUFOR_NATO_ENEMY_STRENGTH + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Equipment:</h1></font color><br/>" + _br + UO_FW_BRIEFING_BLUFOR_NATO_ENEMY_EQUIPMENT + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + _br + UO_FW_BRIEFING_BLUFOR_NATO_ENEMY_APPEARANCE + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>MLCOA:</h1></font color><br/>" + _br + UO_FW_BRIEFING_BLUFOR_NATO_ENEMY_MLCOA + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>MDCOA:</h1></font color><br/>" + _br + UO_FW_BRIEFING_BLUFOR_NATO_ENEMY_MDCOA + _br +
	"ENDTAB" +  _br +
	_br +
	//Friendly
	"NEWTAB(""   B. Friendly Forces:"")" + _br +
	"<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_FRIENDLY_DIS + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Higher Units:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_FRIENDLY_HIGHER + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_ENEMY_STRENGTH + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + UO_FW_BRIEFING_BLUFOR_NATO_ENEMY_APPEARANCE + "<br/><br/>" + _br +
	"ENDTAB" +  _br +
	 _br +
	//Mission
	"NEWTAB(""II. Mission:"")" +  _br +
	"<font color='#5BD527'><h1>Mission:</h1></font color><br/>" + _br + UO_FW_BRIEFING_BLUFOR_NATO_MISSION + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""III. Execution:"")" + _br +
	"<font color='#5BD527'><h1>Commanders Intent:</h1></font color><br/>" + _br + UO_FW_BRIEFING_BLUFOR_NATO_EXECUTION_INTENT + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Maneuver:</h1></font color><br/>" + _br + UO_FW_BRIEFING_BLUFOR_NATO_EXECUTION_MANEUVER + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Timings:</h1></font color><br/>" + _br + UO_FW_BRIEFING_BLUFOR_NATO_EXECUTION_TIMINGS + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br + UO_FW_BRIEFING_BLUFOR_NATO_EXECUTION_TASKS +  _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""IV. Service Support:"")" +  _br +
	" "   + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   A. Support:"")" +  _br +
	"<font color='#5BD527'><h1>Fires:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_NATO_SANDS_SUPPORT_FIRES + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Ammo:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_NATO_SANDS_SUPPORT_AMMO +   _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""   B. Support: "")" +  _br +
	"<font color='#5BD527'><h1>General:</h1></font color><br/>" + _br + UO_FW_BRIEFING_BLUFOR_NATO_SANDS_SERVICE_GENERAL +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""V. Command & Signal:"")" +  _br +
	"" + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   A. Command:"")" + _br +
	"<font color='#5BD527'><h1>General:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_NATO_CANDS_COMMAND +   _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   B. Signals:"")" +  _br +
	"<font color='#5BD527'><h1>Frequencies:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_NATO_CANDS_SIGNALS_FREQ + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Codewords:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_NATO_CANDS_SIGNALS_CODEWORDS + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Special Signals:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_NATO_CANDS_SIGNALS_SPECIAL + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Callsigns:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_NATO_CANDS_SIGNALS_CALLSIGNS + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Passwords:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_NATO_CANDS_SIGNALS_PASSWORDS +  _br +
	"ENDTAB" +  _br +

	_br +
	_br +
	_br +
	_br +
	_br +
	_br +

	"NEWTAB(""I. Preliminaries:"")" +  _br +
	"<font color='#5BD527'><h1>Weather:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_WARSAW_PRELIMINARIES_WEATHER + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_WARSAW_PRELIMINARIES_TERRAIN +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""II. Reference Points:"")" + _br +
	"<font color='#5BD527'><h1>Deployment Reference Points:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_WARSAW_REFERENCE_DEPLOYMENTPOINTS + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Subsequent Reference Points:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_WARSAW_REFERENCE_SUBSEQUENTPOINTS +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""III. Enemy:"")" + _br +
	"<font color='#5BD527'><h1>Enemy Disposition:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_WARSAW_ENEMY_DISP + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Enemy Equipment:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_WARSAW_ENEMY_EQUIP + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy HQ Location:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_WARSAW_ENEMY_PROB_HQ + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Main Element Location:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_WARSAW_ENEMY_PROB_LINE + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Direction of Attack:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_WARSAW_ENEMY_PROB_DIR_ATTACK + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Artillery Positions & Capability:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_WARSAW_ENEMY_PROB_ARTY + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""IV. Higher and Adjacent Units:"")" + _br +
	"<font color='#5BD527'><h1>Description:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_WARSAW_HIGHER_DISP + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Boundaries:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_WARSAW_HIGHER_BOUNDARY + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Location and Capability of Artillery:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_WARSAW_HIGHER_ARTY + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""V. Mission:"")" + _br +
	"<font color='#5BD527'><h1>Statement:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_WARSAW_MISSION_DESC + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>End State Direction:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_WARSAW_HIGHER_BOUNDARY + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VI. Order:"")" + _br +
	"<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br +UO_FW_BRIEFING_BLUFOR_WARSAW_ORDER_TASKS + "<br/><br/>" +
	"<font color='#5BD527'><h1>Tasks for Artillery Elements:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_WARSAW_ORDER_TASKS_ARTY + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Readiness Timings:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_WARSAW_ORDER_TIMINGS + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Signals:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_WARSAW_ORDER_SIGNALS + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VII. Location of the Commander:"")" + _br +
	"<font color='#5BD527'><h1>Location of the Commander:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_WARSAW_COMM_LOC +  _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VIII. Succession of Command:"")" + _br +
	"<font color='#5BD527'><h1>Succession of Command:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_BLUFOR_WARSAW_SUCC_DESC + _br +
	"ENDTAB" +  _br +





"}" + _br+ "case east:" + _br + 
"{" + _br +
	//Situation
	 "NEWTAB(""I. Situation:"")" + _br +
	"<font color='#5BD527'><h1>Situation:</h1></font color><br/>" + _br + UO_FW_BRIEFING_OPFOR_NATO_SIT_MAIN + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" + _br + UO_FW_BRIEFING_OPFOR_NATO_SIT_TERRAIN + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Key Terrain:</h1></font color><br/>" + _br + UO_FW_BRIEFING_OPFOR_NATO_SIT_KEYTERRAIN + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Weather:</h1></font color><br/>" + _br + UO_FW_BRIEFING_OPFOR_NATO_SIT_WEATHER + _br +
	"ENDTAB" +  _br +
	_br +
	//Enemy
	"NEWTAB(""   A. Enemy Forces:"")" + _br +
	"<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + _br + UO_FW_BRIEFING_OPFOR_NATO_ENEMY_DIS + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + _br + UO_FW_BRIEFING_OPFOR_NATO_ENEMY_STRENGTH + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Equipment:</h1></font color><br/>" + _br + UO_FW_BRIEFING_OPFOR_NATO_ENEMY_EQUIPMENT + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + _br + UO_FW_BRIEFING_OPFOR_NATO_ENEMY_APPEARANCE + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>MLCOA:</h1></font color><br/>" + _br + UO_FW_BRIEFING_OPFOR_NATO_ENEMY_MLCOA + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>MDCOA:</h1></font color><br/>" + _br + UO_FW_BRIEFING_OPFOR_NATO_ENEMY_MDCOA + _br +
	"ENDTAB" +  _br +
	_br +
	//Friendly
	"NEWTAB(""   B. Friendly Forces:"")" + _br +
	"<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + UO_FW_BRIEFING_OPFOR_NATO_FRIENDLY_DIS + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Higher Units:</h1></font color><br/>" + UO_FW_BRIEFING_OPFOR_NATO_FRIENDLY_HIGHER + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + UO_FW_BRIEFING_OPFOR_NATO_ENEMY_STRENGTH + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + UO_FW_BRIEFING_OPFOR_NATO_ENEMY_APPEARANCE + "<br/><br/>" + _br +
	"ENDTAB" +  _br +
	 _br +
	//Mission
	"NEWTAB(""II. Mission:"")" +  _br +
	"<font color='#5BD527'><h1>Mission:</h1></font color><br/>" + _br + UO_FW_BRIEFING_OPFOR_NATO_MISSION + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""III. Execution:"")" + _br +
	"<font color='#5BD527'><h1>Commanders Intent:</h1></font color><br/>" + _br + UO_FW_BRIEFING_OPFOR_NATO_EXECUTION_INTENT + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Maneuver:</h1></font color><br/>" + _br + UO_FW_BRIEFING_OPFOR_NATO_EXECUTION_MANEUVER + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Timings:</h1></font color><br/>" + _br + UO_FW_BRIEFING_OPFOR_NATO_EXECUTION_TIMINGS + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br + UO_FW_BRIEFING_OPFOR_NATO_EXECUTION_TASKS +  _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""IV. Service Support:"")" +  _br +
	" "   + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   A. Support:"")" +  _br +
	"<font color='#5BD527'><h1>Fires:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_NATO_SANDS_SUPPORT_FIRES + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Ammo:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_NATO_SANDS_SUPPORT_AMMO +   _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""   B. Support: "")" +  _br +
	"<font color='#5BD527'><h1>General:</h1></font color><br/>" + _br + UO_FW_BRIEFING_OPFOR_NATO_SANDS_SERVICE_GENERAL +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""V. Command & Signal:"")" +  _br +
	"" + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   A. Command:"")" + _br +
	"<font color='#5BD527'><h1>General:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_NATO_CANDS_COMMAND +   _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   B. Signals:"")" +  _br +
	"<font color='#5BD527'><h1>Frequencies:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_NATO_CANDS_SIGNALS_FREQ + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Codewords:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_NATO_CANDS_SIGNALS_CODEWORDS + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Special Signals:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_NATO_CANDS_SIGNALS_SPECIAL + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Callsigns:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_NATO_CANDS_SIGNALS_CALLSIGNS + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Passwords:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_NATO_CANDS_SIGNALS_PASSWORDS +  _br +
	"ENDTAB" +  _br +

	_br +
	_br +
	_br +
	_br +
	_br +
	_br +

	"NEWTAB(""I. Preliminaries:"")" +  _br +
	"<font color='#5BD527'><h1>Weather:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_WARSAW_PRELIMINARIES_WEATHER + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_WARSAW_PRELIMINARIES_TERRAIN +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""II. Reference Points:"")" + _br +
	"<font color='#5BD527'><h1>Deployment Reference Points:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_WARSAW_REFERENCE_DEPLOYMENTPOINTS + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Subsequent Reference Points:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_WARSAW_REFERENCE_SUBSEQUENTPOINTS +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""III. Enemy:"")" + _br +
	"<font color='#5BD527'><h1>Enemy Disposition:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_WARSAW_ENEMY_DISP + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Enemy Equipment:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_WARSAW_ENEMY_EQUIP + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy HQ Location:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_WARSAW_ENEMY_PROB_HQ + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Main Element Location:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_WARSAW_ENEMY_PROB_LINE + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Direction of Attack:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_WARSAW_ENEMY_PROB_DIR_ATTACK + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Artillery Positions & Capability:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_WARSAW_ENEMY_PROB_ARTY + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""IV. Higher and Adjacent Units:"")" + _br +
	"<font color='#5BD527'><h1>Description:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_WARSAW_HIGHER_DISP + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Boundaries:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_WARSAW_HIGHER_BOUNDARY + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Location and Capability of Artillery:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_WARSAW_HIGHER_ARTY + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""V. Mission:"")" + _br +
	"<font color='#5BD527'><h1>Statement:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_WARSAW_MISSION_DESC + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>End State Direction:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_WARSAW_HIGHER_BOUNDARY + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VI. Order:"")" + _br +
	"<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br +UO_FW_BRIEFING_OPFOR_WARSAW_ORDER_TASKS + "<br/><br/>" +
	"<font color='#5BD527'><h1>Tasks for Artillery Elements:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_WARSAW_ORDER_TASKS_ARTY + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Readiness Timings:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_WARSAW_ORDER_TIMINGS + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Signals:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_WARSAW_ORDER_SIGNALS + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VII. Location of the Commander:"")" + _br +
	"<font color='#5BD527'><h1>Location of the Commander:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_WARSAW_COMM_LOC +  _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VIII. Succession of Command:"")" + _br +
	"<font color='#5BD527'><h1>Succession of Command:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_OPFOR_WARSAW_SUCC_DESC + _br +
	"ENDTAB" +  _br +





"}" + _br + 
"case independent:" + _br + 
"{" + _br +
	//Situation
	 "NEWTAB(""I. Situation:"")" + _br +
	"<font color='#5BD527'><h1>Situation:</h1></font color><br/>" + _br + UO_FW_BRIEFING_INDFOR_NATO_SIT_MAIN + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" + _br + UO_FW_BRIEFING_INDFOR_NATO_SIT_TERRAIN + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Key Terrain:</h1></font color><br/>" + _br + UO_FW_BRIEFING_INDFOR_NATO_SIT_KEYTERRAIN + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Weather:</h1></font color><br/>" + _br + UO_FW_BRIEFING_INDFOR_NATO_SIT_WEATHER + _br +
	"ENDTAB" +  _br +
	_br +
	//Enemy
	"NEWTAB(""   A. Enemy Forces:"")" + _br +
	"<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + _br + UO_FW_BRIEFING_INDFOR_NATO_ENEMY_DIS + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + _br + UO_FW_BRIEFING_INDFOR_NATO_ENEMY_STRENGTH + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Equipment:</h1></font color><br/>" + _br + UO_FW_BRIEFING_INDFOR_NATO_ENEMY_EQUIPMENT + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + _br + UO_FW_BRIEFING_INDFOR_NATO_ENEMY_APPEARANCE + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>MLCOA:</h1></font color><br/>" + _br + UO_FW_BRIEFING_INDFOR_NATO_ENEMY_MLCOA + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>MDCOA:</h1></font color><br/>" + _br + UO_FW_BRIEFING_INDFOR_NATO_ENEMY_MDCOA + _br +
	"ENDTAB" +  _br +
	_br +
	//Friendly
	"NEWTAB(""   B. Friendly Forces:"")" + _br +
	"<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + UO_FW_BRIEFING_INDFOR_NATO_FRIENDLY_DIS + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Higher Units:</h1></font color><br/>" + UO_FW_BRIEFING_INDFOR_NATO_FRIENDLY_HIGHER + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + UO_FW_BRIEFING_INDFOR_NATO_ENEMY_STRENGTH + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + UO_FW_BRIEFING_INDFOR_NATO_ENEMY_APPEARANCE + "<br/><br/>" + _br +
	"ENDTAB" +  _br +
	 _br +
	//Mission
	"NEWTAB(""II. Mission:"")" +  _br +
	"<font color='#5BD527'><h1>Mission:</h1></font color><br/>" + _br + UO_FW_BRIEFING_INDFOR_NATO_MISSION + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""III. Execution:"")" + _br +
	"<font color='#5BD527'><h1>Commanders Intent:</h1></font color><br/>" + _br + UO_FW_BRIEFING_INDFOR_NATO_EXECUTION_INTENT + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Maneuver:</h1></font color><br/>" + _br + UO_FW_BRIEFING_INDFOR_NATO_EXECUTION_MANEUVER + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Timings:</h1></font color><br/>" + _br + UO_FW_BRIEFING_INDFOR_NATO_EXECUTION_TIMINGS + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br + UO_FW_BRIEFING_INDFOR_NATO_EXECUTION_TASKS +  _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""IV. Service Support:"")" +  _br +
	" "   + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   A. Support:"")" +  _br +
	"<font color='#5BD527'><h1>Fires:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_NATO_SANDS_SUPPORT_FIRES + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Ammo:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_NATO_SANDS_SUPPORT_AMMO +   _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""   B. Support: "")" +  _br +
	"<font color='#5BD527'><h1>General:</h1></font color><br/>" + _br + UO_FW_BRIEFING_INDFOR_NATO_SANDS_SERVICE_GENERAL +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""V. Command & Signal:"")" +  _br +
	"" + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   A. Command:"")" + _br +
	"<font color='#5BD527'><h1>General:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_NATO_CANDS_COMMAND +   _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   B. Signals:"")" +  _br +
	"<font color='#5BD527'><h1>Frequencies:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_FREQ + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Codewords:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_CODEWORDS + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Special Signals:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_SPECIAL + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Callsigns:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_CALLSIGNS + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Passwords:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_NATO_CANDS_SIGNALS_PASSWORDS +  _br +
	"ENDTAB" +  _br +

	_br +
	_br +
	_br +
	_br +
	_br +
	_br +

	"NEWTAB(""I. Preliminaries:"")" +  _br +
	"<font color='#5BD527'><h1>Weather:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_WARSAW_PRELIMINARIES_WEATHER + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_WARSAW_PRELIMINARIES_TERRAIN +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""II. Reference Points:"")" + _br +
	"<font color='#5BD527'><h1>Deployment Reference Points:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_WARSAW_REFERENCE_DEPLOYMENTPOINTS + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Subsequent Reference Points:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_WARSAW_REFERENCE_SUBSEQUENTPOINTS +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""III. Enemy:"")" + _br +
	"<font color='#5BD527'><h1>Enemy Disposition:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_WARSAW_ENEMY_DISP + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Enemy Equipment:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_WARSAW_ENEMY_EQUIP + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy HQ Location:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_WARSAW_ENEMY_PROB_HQ + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Main Element Location:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_WARSAW_ENEMY_PROB_LINE + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Direction of Attack:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_WARSAW_ENEMY_PROB_DIR_ATTACK + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Artillery Positions & Capability:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_WARSAW_ENEMY_PROB_ARTY + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""IV. Higher and Adjacent Units:"")" + _br +
	"<font color='#5BD527'><h1>Description:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_WARSAW_HIGHER_DISP + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Boundaries:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_WARSAW_HIGHER_BOUNDARY + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Location and Capability of Artillery:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_WARSAW_HIGHER_ARTY + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""V. Mission:"")" + _br +
	"<font color='#5BD527'><h1>Statement:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_WARSAW_MISSION_DESC + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>End State Direction:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_WARSAW_HIGHER_BOUNDARY + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VI. Order:"")" + _br +
	"<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br +UO_FW_BRIEFING_INDFOR_WARSAW_ORDER_TASKS + "<br/><br/>" +
	"<font color='#5BD527'><h1>Tasks for Artillery Elements:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_WARSAW_ORDER_TASKS_ARTY + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Readiness Timings:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_WARSAW_ORDER_TIMINGS + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Signals:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_WARSAW_ORDER_SIGNALS + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VII. Location of the Commander:"")" + _br +
	"<font color='#5BD527'><h1>Location of the Commander:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_WARSAW_COMM_LOC +  _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VIII. Succession of Command:"")" + _br +
	"<font color='#5BD527'><h1>Succession of Command:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_INDFOR_WARSAW_SUCC_DESC + _br +
	"ENDTAB" +  _br +





"}" + _br+ 
"case civilian:" + _br + 
"{" + _br +
	//Situation
	 "NEWTAB(""I. Situation:"")" + _br +
	"<font color='#5BD527'><h1>Situation:</h1></font color><br/>" + _br + UO_FW_BRIEFING_CIVILIAN_NATO_SIT_MAIN + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" + _br + UO_FW_BRIEFING_CIVILIAN_NATO_SIT_TERRAIN + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Key Terrain:</h1></font color><br/>" + _br + UO_FW_BRIEFING_CIVILIAN_NATO_SIT_KEYTERRAIN + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Weather:</h1></font color><br/>" + _br + UO_FW_BRIEFING_CIVILIAN_NATO_SIT_WEATHER + _br +
	"ENDTAB" +  _br +
	_br +
	//Enemy
	"NEWTAB(""   A. Enemy Forces:"")" + _br +
	"<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + _br + UO_FW_BRIEFING_CIVILIAN_NATO_ENEMY_DIS + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + _br + UO_FW_BRIEFING_CIVILIAN_NATO_ENEMY_STRENGTH + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Equipment:</h1></font color><br/>" + _br + UO_FW_BRIEFING_CIVILIAN_NATO_ENEMY_EQUIPMENT + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + _br + UO_FW_BRIEFING_CIVILIAN_NATO_ENEMY_APPEARANCE + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>MLCOA:</h1></font color><br/>" + _br + UO_FW_BRIEFING_CIVILIAN_NATO_ENEMY_MLCOA + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>MDCOA:</h1></font color><br/>" + _br + UO_FW_BRIEFING_CIVILIAN_NATO_ENEMY_MDCOA + _br +
	"ENDTAB" +  _br +
	_br +
	//Friendly
	"NEWTAB(""   B. Friendly Forces:"")" + _br +
	"<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + UO_FW_BRIEFING_CIVILIAN_NATO_FRIENDLY_DIS + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Higher Units:</h1></font color><br/>" + UO_FW_BRIEFING_CIVILIAN_NATO_FRIENDLY_HIGHER + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + UO_FW_BRIEFING_CIVILIAN_NATO_ENEMY_STRENGTH + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + UO_FW_BRIEFING_CIVILIAN_NATO_ENEMY_APPEARANCE + "<br/><br/>" + _br +
	"ENDTAB" +  _br +
	 _br +
	//Mission
	"NEWTAB(""II. Mission:"")" +  _br +
	"<font color='#5BD527'><h1>Mission:</h1></font color><br/>" + _br + UO_FW_BRIEFING_CIVILIAN_NATO_MISSION + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""III. Execution:"")" + _br +
	"<font color='#5BD527'><h1>Commanders Intent:</h1></font color><br/>" + _br + UO_FW_BRIEFING_CIVILIAN_NATO_EXECUTION_INTENT + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Maneuver:</h1></font color><br/>" + _br + UO_FW_BRIEFING_CIVILIAN_NATO_EXECUTION_MANEUVER + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Timings:</h1></font color><br/>" + _br + UO_FW_BRIEFING_CIVILIAN_NATO_EXECUTION_TIMINGS + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br + UO_FW_BRIEFING_CIVILIAN_NATO_EXECUTION_TASKS +  _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""IV. Service Support:"")" +  _br +
	" "   + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   A. Support:"")" +  _br +
	"<font color='#5BD527'><h1>Fires:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_NATO_SANDS_SUPPORT_FIRES + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Ammo:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_NATO_SANDS_SUPPORT_AMMO +   _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""   B. Support: "")" +  _br +
	"<font color='#5BD527'><h1>General:</h1></font color><br/>" + _br + UO_FW_BRIEFING_CIVILIAN_NATO_SANDS_SERVICE_GENERAL +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""V. Command & Signal:"")" +  _br +
	"" + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   A. Command:"")" + _br +
	"<font color='#5BD527'><h1>General:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_NATO_CANDS_COMMAND +   _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   B. Signals:"")" +  _br +
	"<font color='#5BD527'><h1>Frequencies:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_NATO_CANDS_SIGNALS_FREQ + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Codewords:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_NATO_CANDS_SIGNALS_CODEWORDS + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Special Signals:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_NATO_CANDS_SIGNALS_SPECIAL + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Callsigns:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_NATO_CANDS_SIGNALS_CALLSIGNS + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Passwords:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_NATO_CANDS_SIGNALS_PASSWORDS +  _br +
	"ENDTAB" +  _br +

	_br +
	_br +
	_br +
	_br +
	_br +
	_br +

	"NEWTAB(""I. Preliminaries:"")" +  _br +
	"<font color='#5BD527'><h1>Weather:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_WARSAW_PRELIMINARIES_WEATHER + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_WARSAW_PRELIMINARIES_TERRAIN +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""II. Reference Points:"")" + _br +
	"<font color='#5BD527'><h1>Deployment Reference Points:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_WARSAW_REFERENCE_DEPLOYMENTPOINTS + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Subsequent Reference Points:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_WARSAW_REFERENCE_SUBSEQUENTPOINTS +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""III. Enemy:"")" + _br +
	"<font color='#5BD527'><h1>Enemy Disposition:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_WARSAW_ENEMY_DISP + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Enemy Equipment:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_WARSAW_ENEMY_EQUIP + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy HQ Location:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_WARSAW_ENEMY_PROB_HQ + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Main Element Location:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_WARSAW_ENEMY_PROB_LINE + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Direction of Attack:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_WARSAW_ENEMY_PROB_DIR_ATTACK + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Artillery Positions & Capability:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_WARSAW_ENEMY_PROB_ARTY + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""IV. Higher and Adjacent Units:"")" + _br +
	"<font color='#5BD527'><h1>Description:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_WARSAW_HIGHER_DISP + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Boundaries:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_WARSAW_HIGHER_BOUNDARY + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Location and Capability of Artillery:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_WARSAW_HIGHER_ARTY + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""V. Mission:"")" + _br +
	"<font color='#5BD527'><h1>Statement:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_WARSAW_MISSION_DESC + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>End State Direction:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_WARSAW_HIGHER_BOUNDARY + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VI. Order:"")" + _br +
	"<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br +UO_FW_BRIEFING_CIVILIAN_WARSAW_ORDER_TASKS + "<br/><br/>" +
	"<font color='#5BD527'><h1>Tasks for Artillery Elements:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_WARSAW_ORDER_TASKS_ARTY + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Readiness Timings:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_WARSAW_ORDER_TIMINGS + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Signals:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_WARSAW_ORDER_SIGNALS + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VII. Location of the Commander:"")" + _br +
	"<font color='#5BD527'><h1>Location of the Commander:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_WARSAW_COMM_LOC +  _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VIII. Succession of Command:"")" + _br +
	"<font color='#5BD527'><h1>Succession of Command:</h1></font color><br/>" +  _br + UO_FW_BRIEFING_CIVILIAN_WARSAW_SUCC_DESC + _br +
	"ENDTAB" +  _br +





"};" + _br +


//Mission Notes
"NEWTAB(""Mission Notes:"")" +  _br +
"<font color='#5BD527'><h1>Author:</h1></font color><br/>" + _br + UO_FW_BRIEFING_MISSIONNOTES_AUTHOR + "<br/><br/>" + _br +
"<font color='#5BD527'><h1>Testers:</h1></font color><br/>" + _br + UO_FW_BRIEFING_MISSIONNOTES_TESTERS + "<br/><br/>" + _br +
"<font color='#5BD527'><h1>End Conditions:</h1></font color><br/>" + _br + UO_FW_BRIEFING_MISSIONNOTES_CONDITIONS + "<br/><br/>" + _br +
"<font color='#5BD527'><h1>Mission Specific Notes:</h1></font color><br/>" + _br + UO_FW_BRIEFING_MISSIONNOTES_CUSTOM + "<br/><br/>" + _br +
"<font color='#5BD527'><h1>Mission Changelog:</h1></font color><br/>" + _br + UO_FW_BRIEFING_MISSIONNOTES_CHANGELOG +  _br +
"ENDTAB" +  _br;

private _gamemastermsg = "";

if (getMissionConfigValue ["UO_FW_BRIEFING_MISSIONNOTES_GM",false]) then {
	_gamemastermsg = "This mission is designed for game mastering and can be manipulated as per Mission Notes";
} else {
	_gamemastermsg = "This mission is not designed for game mastering and should only be manipulated for technical, administrative or diagnostic purposes.";
};

//Game Mastering
_export = _export +
"NEWTAB(""Game Mastering"")" +  _br +
"<font color='#5BD527'><h1>Game Mastering:</h1></font color><br/>" + _gamemastermsg +  _br +
"ENDTAB" +  _br +
"};" + _br;
"DISPLAYBRIEFING()";



copyToClipboard _export;
