if ((missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_File",false])) exitwith {
	if !(UO_FW_Briefing_BLUFOR_File_Path isEqualto "") then {
		"" call (compile preprocessFileLineNumbers UO_FW_Briefing_BLUFOR_File_Path);
	} else {
		ERROR("No briefing found for BLUFOR!");
	};
};

if ((missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO",false])) then {
	//Situation
	NEWTAB("I. Situation:")
	"<font color='#5BD527'><h1>Situation:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_SIT_MAIN",""]) + "<br/><br/>" +
	"<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_SIT_Terrain",""])  + "<br/><br/>" +
	"<font color='#5BD527'><h1>Key Terrain:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_SIT_KEYTerrain",""])  + "<br/><br/>" +
	"<font color='#5BD527'><h1>Weather:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_SIT_Weather",""])
	ENDTAB
	//Enemy
	NEWTAB("   A. Enemy Forces:")
	"<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_Enemy_DIS",""])  + "<br/><br/>" +
	"<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_Enemy_STRENGTH",""])  + "<br/><br/>" +
	"<font color='#5BD527'><h1>Equipment:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_Enemy_EQUIPMENT",""])  + "<br/><br/>" +
	"<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_Enemy_APPEARANCE",""])  + "<br/><br/>" +
	"<font color='#5BD527'><h1>MLCOA:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_Enemy_MLCOA",""])  + "<br/><br/>" +
	"<font color='#5BD527'><h1>MDCOA:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_Enemy_MDCOA",""])
	ENDTAB
	//Friendly
	NEWTAB("   B. Friendly Forces:")
	"<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_FRIENDLY_DIS",""])  + "<br/><br/>" +
	"<font color='#5BD527'><h1>Higher Units:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_FRIENDLY_Higher",""])  + "<br/><br/>" +
	"<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_FRIENDLY_STRENGTH",""])  + "<br/><br/>" +
	"<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_FRIENDLY_APPEARANCE",""])  + "<br/><br/>"
	ENDTAB
	//Mission
	NEWTAB("II. Mission:")
	"<font color='#5BD527'><h1>Mission:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_Mission",""])
	ENDTAB
	NEWTAB("III. Execution:")
	"<font color='#5BD527'><h1>Commanders Intent:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_EXECUTION_INTENT",""])  + "<br/><br/>" +
	"<font color='#5BD527'><h1>Maneuver:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_EXECUTION_MANEUVER",""])  + "<br/><br/>" +
	"<font color='#5BD527'><h1>Timings:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_EXECUTION_Timings",""])  + "<br/><br/>" +
	"<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_EXECUTION_Tasks",""])
	ENDTAB
	NEWTAB("IV. Service Support:")
	""
	ENDTAB
	NEWTAB("   A. Support:")
	"<font color='#5BD527'><h1>Fires:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_SANDS_SUPPORT_FIRES",""])  + "<br/><br/>" +
	"<font color='#5BD527'><h1>Ammo:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_SANDS_SUPPORT_AMMO",""])
	ENDTAB
	NEWTAB("   B. Service:")
	"<font color='#5BD527'><h1>General:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_SANDS_SERVICE_GENERAL",""])
	ENDTAB
	NEWTAB("V. Command & Signal:")
	""
	ENDTAB
	NEWTAB("   A. Command:")
	"<font color='#5BD527'><h1>General:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_CANDS_COMMAND",""])
	ENDTAB
	NEWTAB("   B. Signals:")
	"<font color='#5BD527'><h1>Frequencies:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_CANDS_Signals_FREQ",""])  + "<br/><br/>" +
	"<font color='#5BD527'><h1>Codewords:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_CANDS_Signals_CODEWORDS",""])  + "<br/><br/>" +
	"<font color='#5BD527'><h1>Special Signals:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_CANDS_Signals_SPECIAL",""])  + "<br/><br/>" +
	"<font color='#5BD527'><h1>Callsigns:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_CANDS_Signals_CALLSIGNS",""])  + "<br/><br/>" +
	"<font color='#5BD527'><h1>Passwords:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_NATO_CANDS_Signals_PASSWORDS",""])
	ENDTAB
};

if ((missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw",false])) then {
	NEWTAB("I. Preliminaries:")
	"<font color='#5BD527'><h1>Weather:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw_Preliminaries_Weather",""])   + "<br/><br/>" +
	"<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw_Preliminaries_Terrain",""])
	ENDTAB
	NEWTAB("II. Reference Points:")
	"<font color='#5BD527'><h1>Deployment Reference Points:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw_Reference_DeploymentPoints",""])   + "<br/><br/>" +
	"<font color='#5BD527'><h1>Subsequent Reference Points:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw_Reference_SubsequentPoints",""])
	ENDTAB
	NEWTAB("III. Enemy:")
	"<font color='#5BD527'><h1>Enemy Disposition:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw_Enemy_Disp,""])   + "<br/><br/>" +
	"<font color='#5BD527'><h1>Enemy Equipment:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw_Enemy_Equip,""])   + "<br/><br/>" +
	"<font color='#5BD527'><h1>Probable Enemy HQ Location:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw_Enemy_Prob_HQ",""])   + "<br/><br/>" +
	"<font color='#5BD527'><h1>Probable Enemy Main Element Location:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw_Enemy_Prob_Line",""])   + "<br/><br/>" +
	"<font color='#5BD527'><h1>Probable Enemy Direction of Attack:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw_Enemy_Prob_Dir_Attack",""])   + "<br/><br/>" +
	"<font color='#5BD527'><h1>Probable Enemy Artillery Positions & Capability:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw_Enemy_Prob_Arty",""])
	ENDTAB
	NEWTAB("IV. Higher and Adjacent Units:")
	"<font color='#5BD527'><h1>Description:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw_Higher_Disp,""])   + "<br/><br/>" +
	"<font color='#5BD527'><h1>Boundaries:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw_Higher_Boundary",""])   + "<br/><br/>" +
	"<font color='#5BD527'><h1>Location and Capability of Artillery:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw_Higher_Arty",""])
	ENDTAB
	NEWTAB("V. Mission:")
	"<font color='#5BD527'><h1>Statement:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw_Mission_Desc",""])   + "<br/><br/>" +
	"<font color='#5BD527'><h1>End State Direction:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw_Higher_Boundary",""])
	ENDTAB
	NEWTAB("VI. Order:")
	"<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw_Order_Tasks",""])   + "<br/><br/>" +
	"<font color='#5BD527'><h1>Tasks for Artillery Elements:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw_Order_Tasks_Arty",""])   + "<br/><br/>" +
	"<font color='#5BD527'><h1>Readiness Timings:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw_Order_Timings",""])   + "<br/><br/>" +
	"<font color='#5BD527'><h1>Signals:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw_Order_Signals",""])
	ENDTAB
	NEWTAB("VII. Location of the Commander:")
	"<font color='#5BD527'><h1>Location of the Commander:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw_COMM_LOC",""])
	ENDTAB
	NEWTAB("VIII. Succession of Command:")
	"<font color='#5BD527'><h1>Succession of Command:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Warsaw_SUCC_DESC",""])
	ENDTAB
};

if ((missionNamespace getVariable ["UO_FW_Briefing_BLUFOR_Appendix",false])) then {
	if !(UO_FW_Briefing_BLUFOR_Appendix_Path isEqualto "") then {
		"" call (compile preprocessFileLineNumbers UO_FW_Briefing_BLUFOR_Appendix_Path);
	} else {
		ERROR("No appendix found for BLUFOR!");
	};
};
if ((missionNamespace getVariable ["UO_FW_Briefing_MissionNotes_Enable",false])) then
{
//Mission Notes
NEWTAB("Mission Notes:")
"<font color='#5BD527'><h1>Author:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_MissionNotes_Author",""]) + "<br/><br/>" +
"<font color='#5BD527'><h1>Testers:</h1></font color><br/>" +(missionNamespace getVariable ["UO_FW_Briefing_MissionNotes_Testers",""])  + "<br/><br/>" +
"<font color='#5BD527'><h1>End Conditions:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_MissionNotes_Conditions",""]) + "<br/><br/>" +
"<font color='#5BD527'><h1>Mission Specific Notes:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_MissionNotes_Custom",""]) + "<br/><br/>" +
"<font color='#5BD527'><h1>Mission Changelog:</h1></font color><br/>" + (missionNamespace getVariable ["UO_FW_Briefing_MissionNotes_Changelog",""])
ENDTAB

private _gamemastermsg = "";

if (missionNamespace getVariable ["UO_FW_Briefing_MissionNotes_GM",false]) then {
	_gamemastermsg = "This mission is designed for game mastering and can be manipulated as per Mission Notes";
} else {
	_gamemastermsg = "This mission is not designed for game mastering and should only be manipulated for technical, administrative or diagnostic purposes.";
};

//Game Mastering
NEWTAB("Game Mastering")
"<font color='#5BD527'><h1>Game Mastering:</h1></font color><br/>" + _gamemastermsg
ENDTAB;
};
DISPLAYBRIEFING()
