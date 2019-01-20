#define COMPONENT Briefing
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

if !(is3DEN) exitwith {};

LOG("Exporting Briefing");
_br = toString [13,10];//(carriage return & line feed)

_export = "_briefing = [];" + _br +

"#define NEWTAB(NAME) _briefing set [count _briefing, [""Diary"",[NAME,""" + _br +
"#define ENDTAB ""]]];" + _br +

"#define DISPLAYBRIEFING() \" + _br +
"_size = count _briefing - 1; \" + _br +
"for '_i' from 0 to _size do \" + _br +
"{ \" + _br +
"	player createDiaryRecord (_briefing select _size - _i); \" + _br +
"};" + _br + _br +


 "switch (side player) do " + _br +
"{" + _br +
"case west:" + _br +
"{" + _br;
if (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO,false)) then {
	//Situation
	_export = _export + "NEWTAB(""I. Situation:"")" + _br +
	"<font color='#5BD527'><h1>Situation:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_SIT_Main,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_SIT_Terrain,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Key Terrain:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_SIT_KEYTerrain,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Weather:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_SIT_Weather,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	//Enemy
	"NEWTAB(""   A. Enemy Forces:"")" + _br +
	"<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_Enemy_DIS,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_Enemy_STRENGTH,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Equipment:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_Enemy_EQUIPMENT,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_Enemy_APPEARANCE,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>MLCOA:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_Enemy_MLCOA,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>MDCOA:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_Enemy_MDCOA,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	//Friendly
	"NEWTAB(""   B. Friendly Forces:"")" + _br +
	"<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_FRIENDLY_DIS,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Higher Units:</h1></font color><br/>" + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_FRIENDLY_Higher,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_Enemy_STRENGTH,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_Enemy_APPEARANCE,"")) + "<br/><br/>" + _br +
	"ENDTAB" +  _br +
	_br +
	//Mission
	"NEWTAB(""II. Mission:"")" +  _br +
	"<font color='#5BD527'><h1>Mission:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_Mission,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""III. Execution:"")" + _br +
	"<font color='#5BD527'><h1>Commanders Intent:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_EXECUTION_INTENT,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Maneuver:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_EXECUTION_MANEUVER,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Timings:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_EXECUTION_Timings,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_EXECUTION_Tasks,"")) +  _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""IV. Service Support:"")" +  _br +
	" "   + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   A. Support:"")" +  _br +
	"<font color='#5BD527'><h1>Fires:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_SANDS_SUPPORT_FIRES,"")) + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Ammo:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_SANDS_SUPPORT_AMMO,"")) +   _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""   B. Support: "")" +  _br +
	"<font color='#5BD527'><h1>General:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_SANDS_SERVICE_GENERAL,"")) +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""V. Command & Signal:"")" +  _br +
	"" + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   A. Command:"")" + _br +
	"<font color='#5BD527'><h1>General:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_CANDS_COMMAND,"")) +   _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   B. Signals:"")" +  _br +
	"<font color='#5BD527'><h1>Frequencies:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_CANDS_Signals_FREQ,"")) + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Codewords:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_CANDS_Signals_CODEWORDS,"")) + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Special Signals:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_CANDS_Signals_SPECIAL,"")) + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Callsigns:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_CANDS_Signals_CALLSIGNS,"")) + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Passwords:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_NATO_CANDS_Signals_PASSWORDS,"")) +  _br +
	"ENDTAB" +  _br;
};

_export = _export + _br +
_br +
_br +
_br +
_br +
_br;
if (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw,false)) then {
	_export = _export + "NEWTAB(""I. Preliminaries:"")" +  _br +
	"<font color='#5BD527'><h1>Weather:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw_Preliminaries_Weather,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw_Preliminaries_Terrain,"")) +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""II. Reference Points:"")" + _br +
	"<font color='#5BD527'><h1>Deployment Reference Points:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw_Reference_DeploymentPoints,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Subsequent Reference Points:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw_Reference_SubsequentPoints,"")) +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""III. Enemy:"")" + _br +
	"<font color='#5BD527'><h1>Enemy Disposition:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw_Enemy_Disp,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Enemy Equipment:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw_Enemy_Equip,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy HQ Location:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw_Enemy_Prob_HQ,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Main Element Location:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw_Enemy_Prob_Line,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Direction of Attack:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw_Enemy_Prob_Dir_Attack,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Artillery Positions & Capability:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw_Enemy_Prob_Arty,"")) + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""IV. Higher and Adjacent Units:"")" + _br +
	"<font color='#5BD527'><h1>Description:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw_Higher_Disp,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Boundaries:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw_Higher_Boundary,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Location and Capability of Artillery:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw_Higher_Arty,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""V. Mission:"")" + _br +
	"<font color='#5BD527'><h1>Statement:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw_Mission_Desc,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>End State Direction:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw_Higher_Boundary,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VI. Order:"")" + _br +
	"<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw_Order_Tasks,"")) + "<br/><br/>" +
	"<font color='#5BD527'><h1>Tasks for Artillery Elements:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw_Order_Tasks_Arty,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Readiness Timings:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw_Order_Timings,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Signals:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw_Order_Signals,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VII. Location of the Commander:"")" + _br +
	"<font color='#5BD527'><h1>Location of the Commander:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw_COMM_LOC,"")) +  _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VIII. Succession of Command:"")" + _br +
	"<font color='#5BD527'><h1>Succession of Command:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_BLUFOR_Warsaw_SUCC_DESC,"")) + _br +
	"ENDTAB" +  _br;
};

_export = _export + "};" + _br+

"case east:" + _br +
"{" + _br;
if (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO,false)) then {
//Situation
	_export = _export + "NEWTAB(""I. Situation:"")" + _br +
	"<font color='#5BD527'><h1>Situation:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_SIT_Main,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_SIT_Terrain,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Key Terrain:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_SIT_KEYTerrain,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Weather:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_SIT_Weather,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	//Enemy
	"NEWTAB(""   A. Enemy Forces:"")" + _br +
	"<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_Enemy_DIS,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_Enemy_STRENGTH,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Equipment:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_Enemy_EQUIPMENT,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_Enemy_APPEARANCE,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>MLCOA:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_Enemy_MLCOA,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>MDCOA:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_Enemy_MDCOA,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	//Friendly
	"NEWTAB(""   B. Friendly Forces:"")" + _br +
	"<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_FRIENDLY_DIS,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Higher Units:</h1></font color><br/>" + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_FRIENDLY_Higher,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_Enemy_STRENGTH,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_Enemy_APPEARANCE,"")) + "<br/><br/>" + _br +
	"ENDTAB" +  _br +
	_br +
	//Mission
	"NEWTAB(""II. Mission:"")" +  _br +
	"<font color='#5BD527'><h1>Mission:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_Mission,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""III. Execution:"")" + _br +
	"<font color='#5BD527'><h1>Commanders Intent:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_EXECUTION_INTENT,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Maneuver:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_EXECUTION_MANEUVER,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Timings:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_EXECUTION_Timings,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_EXECUTION_Tasks,"")) +  _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""IV. Service Support:"")" +  _br +
	" "   + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   A. Support:"")" +  _br +
	"<font color='#5BD527'><h1>Fires:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_SANDS_SUPPORT_FIRES,"")) + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Ammo:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_SANDS_SUPPORT_AMMO,"")) +   _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""   B. Support: "")" +  _br +
	"<font color='#5BD527'><h1>General:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_SANDS_SERVICE_GENERAL,"")) +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""V. Command & Signal:"")" +  _br +
	"" + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   A. Command:"")" + _br +
	"<font color='#5BD527'><h1>General:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_CANDS_COMMAND,"")) +   _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   B. Signals:"")" +  _br +
	"<font color='#5BD527'><h1>Frequencies:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_CANDS_Signals_FREQ,"")) + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Codewords:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_CANDS_Signals_CODEWORDS,"")) + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Special Signals:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_CANDS_Signals_SPECIAL,"")) + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Callsigns:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_CANDS_Signals_CALLSIGNS,"")) + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Passwords:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_NATO_CANDS_Signals_PASSWORDS,"")) +  _br +
	"ENDTAB" +  _br;
};


_export = _export + _br +
_br +
_br +
_br +
_br +
_br;
if (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw,false)) then {
	_export = _export + "NEWTAB(""I. Preliminaries:"")" +  _br +
	"<font color='#5BD527'><h1>Weather:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw_Preliminaries_Weather,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw_Preliminaries_Terrain,"")) +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""II. Reference Points:"")" + _br +
	"<font color='#5BD527'><h1>Deployment Reference Points:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw_Reference_DeploymentPoints,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Subsequent Reference Points:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw_Reference_SubsequentPoints,"")) +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""III. Enemy:"")" + _br +
	"<font color='#5BD527'><h1>Enemy Disposition:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw_Enemy_Disp,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Enemy Equipment:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw_Enemy_Equip,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy HQ Location:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw_Enemy_Prob_HQ,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Main Element Location:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw_Enemy_Prob_Line,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Direction of Attack:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw_Enemy_Prob_Dir_Attack,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Artillery Positions & Capability:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw_Enemy_Prob_Arty,"")) + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""IV. Higher and Adjacent Units:"")" + _br +
	"<font color='#5BD527'><h1>Description:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw_Higher_Disp,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Boundaries:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw_Higher_Boundary,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Location and Capability of Artillery:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw_Higher_Arty,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""V. Mission:"")" + _br +
	"<font color='#5BD527'><h1>Statement:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw_Mission_Desc,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>End State Direction:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw_Higher_Boundary,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VI. Order:"")" + _br +
	"<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw_Order_Tasks,"")) + "<br/><br/>" +
	"<font color='#5BD527'><h1>Tasks for Artillery Elements:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw_Order_Tasks_Arty,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Readiness Timings:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw_Order_Timings,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Signals:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw_Order_Signals,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VII. Location of the Commander:"")" + _br +
	"<font color='#5BD527'><h1>Location of the Commander:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw_COMM_LOC,"")) +  _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VIII. Succession of Command:"")" + _br +
	"<font color='#5BD527'><h1>Succession of Command:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_OPFOR_Warsaw_SUCC_DESC,"")) + _br +
	"ENDTAB" +  _br;
};
_export = _export + "};" + _br +


"case independent:" + _br +
"{" + _br;
if (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO,false)) then {
	//Situation
	_export = _export + "NEWTAB(""I. Situation:"")" + _br +
	"<font color='#5BD527'><h1>Situation:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_SIT_Main,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_SIT_Terrain,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Key Terrain:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_SIT_KEYTerrain,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Weather:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_SIT_Weather,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	//Enemy
	"NEWTAB(""   A. Enemy Forces:"")" + _br +
	"<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_Enemy_DIS,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_Enemy_STRENGTH,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Equipment:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_Enemy_EQUIPMENT,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_Enemy_APPEARANCE,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>MLCOA:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_Enemy_MLCOA,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>MDCOA:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_Enemy_MDCOA,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	//Friendly
	"NEWTAB(""   B. Friendly Forces:"")" + _br +
	"<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_FRIENDLY_DIS,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Higher Units:</h1></font color><br/>" + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_FRIENDLY_Higher,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_Enemy_STRENGTH,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_Enemy_APPEARANCE,"")) + "<br/><br/>" + _br +
	"ENDTAB" +  _br +
	_br +
	//Mission
	"NEWTAB(""II. Mission:"")" +  _br +
	"<font color='#5BD527'><h1>Mission:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_Mission,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""III. Execution:"")" + _br +
	"<font color='#5BD527'><h1>Commanders Intent:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_EXECUTION_INTENT,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Maneuver:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_EXECUTION_MANEUVER,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Timings:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_EXECUTION_Timings,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_EXECUTION_Tasks,"")) +  _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""IV. Service Support:"")" +  _br +
	" "   + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   A. Support:"")" +  _br +
	"<font color='#5BD527'><h1>Fires:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_SANDS_SUPPORT_FIRES,"")) + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Ammo:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_SANDS_SUPPORT_AMMO,"")) +   _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""   B. Support: "")" +  _br +
	"<font color='#5BD527'><h1>General:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_SANDS_SERVICE_GENERAL,"")) +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""V. Command & Signal:"")" +  _br +
	"" + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   A. Command:"")" + _br +
	"<font color='#5BD527'><h1>General:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_CANDS_COMMAND,"")) +   _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   B. Signals:"")" +  _br +
	"<font color='#5BD527'><h1>Frequencies:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_CANDS_Signals_FREQ,"")) + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Codewords:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_CANDS_Signals_CODEWORDS,"")) + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Special Signals:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_CANDS_Signals_SPECIAL,"")) + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Callsigns:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_CANDS_Signals_CALLSIGNS,"")) + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Passwords:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_NATO_CANDS_Signals_PASSWORDS,"")) +  _br +
	"ENDTAB" +  _br;
};


_export = _export + _br +
_br +
_br +
_br +
_br +
_br;
if (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw,false)) then {
	_export = _export + "NEWTAB(""I. Preliminaries:"")" +  _br +
	"<font color='#5BD527'><h1>Weather:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw_Preliminaries_Weather,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw_Preliminaries_Terrain,"")) +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""II. Reference Points:"")" + _br +
	"<font color='#5BD527'><h1>Deployment Reference Points:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw_Reference_DeploymentPoints,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Subsequent Reference Points:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw_Reference_SubsequentPoints,"")) +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""III. Enemy:"")" + _br +
	"<font color='#5BD527'><h1>Enemy Disposition:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw_Enemy_Disp,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Enemy Equipment:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw_Enemy_Equip,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy HQ Location:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw_Enemy_Prob_HQ,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Main Element Location:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw_Enemy_Prob_Line,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Direction of Attack:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw_Enemy_Prob_Dir_Attack,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Artillery Positions & Capability:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw_Enemy_Prob_Arty,"")) + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""IV. Higher and Adjacent Units:"")" + _br +
	"<font color='#5BD527'><h1>Description:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw_Higher_Disp,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Boundaries:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw_Higher_Boundary,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Location and Capability of Artillery:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw_Higher_Arty,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""V. Mission:"")" + _br +
	"<font color='#5BD527'><h1>Statement:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw_Mission_Desc,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>End State Direction:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw_Higher_Boundary,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VI. Order:"")" + _br +
	"<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw_Order_Tasks,"")) + "<br/><br/>" +
	"<font color='#5BD527'><h1>Tasks for Artillery Elements:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw_Order_Tasks_Arty,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Readiness Timings:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw_Order_Timings,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Signals:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw_Order_Signals,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VII. Location of the Commander:"")" + _br +
	"<font color='#5BD527'><h1>Location of the Commander:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw_COMM_LOC,"")) +  _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VIII. Succession of Command:"")" + _br +
	"<font color='#5BD527'><h1>Succession of Command:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_INDFOR_Warsaw_SUCC_DESC,"")) + _br +
	"ENDTAB" +  _br;
};

_export = _export + "};" + _br+


"case civilian:" + _br +
"{" + _br;
if (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO,false)) then {
	//Situation
	_export = _export + "NEWTAB(""I. Situation:"")" + _br +
	"<font color='#5BD527'><h1>Situation:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_SIT_Main,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_SIT_Terrain,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Key Terrain:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_SIT_KEYTerrain,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Weather:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_SIT_Weather,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	//Enemy
	"NEWTAB(""   A. Enemy Forces:"")" + _br +
	"<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_Enemy_DIS,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_Enemy_STRENGTH,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Equipment:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_Enemy_EQUIPMENT,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_Enemy_APPEARANCE,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>MLCOA:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_Enemy_MLCOA,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>MDCOA:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_Enemy_MDCOA,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	//Friendly
	"NEWTAB(""   B. Friendly Forces:"")" + _br +
	"<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_FRIENDLY_DIS,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Higher Units:</h1></font color><br/>" + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_FRIENDLY_Higher,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_Enemy_STRENGTH,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_Enemy_APPEARANCE,"")) + "<br/><br/>" + _br +
	"ENDTAB" +  _br +
	_br +
	//Mission
	"NEWTAB(""II. Mission:"")" +  _br +
	"<font color='#5BD527'><h1>Mission:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_Mission,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""III. Execution:"")" + _br +
	"<font color='#5BD527'><h1>Commanders Intent:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_EXECUTION_INTENT,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Maneuver:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_EXECUTION_MANEUVER,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Timings:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_EXECUTION_Timings,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_EXECUTION_Tasks,"")) +  _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""IV. Service Support:"")" +  _br +
	" "   + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   A. Support:"")" +  _br +
	"<font color='#5BD527'><h1>Fires:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_SANDS_SUPPORT_FIRES,"")) + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Ammo:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_SANDS_SUPPORT_AMMO,"")) +   _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""   B. Support: "")" +  _br +
	"<font color='#5BD527'><h1>General:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_SANDS_SERVICE_GENERAL,"")) +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""V. Command & Signal:"")" +  _br +
	"" + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   A. Command:"")" + _br +
	"<font color='#5BD527'><h1>General:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_CANDS_COMMAND,"")) +   _br +
	"ENDTAB" +  _br +
	"NEWTAB(""   B. Signals:"")" +  _br +
	"<font color='#5BD527'><h1>Frequencies:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_CANDS_Signals_FREQ,"")) + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Codewords:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_CANDS_Signals_CODEWORDS,"")) + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Special Signals:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_CANDS_Signals_SPECIAL,"")) + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Callsigns:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_CANDS_Signals_CALLSIGNS,"")) + "<br/><br/>" +  _br +
	"<font color='#5BD527'><h1>Passwords:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_NATO_CANDS_Signals_PASSWORDS,"")) +  _br +
	"ENDTAB" +  _br;
};


_export = _export + _br +
_br +
_br +
_br +
_br +
_br;
if (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw,false)) then {
	_export = _export + "NEWTAB(""I. Preliminaries:"")" +  _br +
	"<font color='#5BD527'><h1>Weather:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw_Preliminaries_Weather,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw_Preliminaries_Terrain,"")) +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""II. Reference Points:"")" + _br +
	"<font color='#5BD527'><h1>Deployment Reference Points:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw_Reference_DeploymentPoints,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Subsequent Reference Points:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw_Reference_SubsequentPoints,"")) +  _br +
	"ENDTAB" +  _br +
	"NEWTAB(""III. Enemy:"")" + _br +
	"<font color='#5BD527'><h1>Enemy Disposition:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw_Enemy_Disp,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Enemy Equipment:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw_Enemy_Equip,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy HQ Location:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw_Enemy_Prob_HQ,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Main Element Location:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw_Enemy_Prob_Line,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Direction of Attack:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw_Enemy_Prob_Dir_Attack,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Probable Enemy Artillery Positions & Capability:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw_Enemy_Prob_Arty,"")) + _br +
	"ENDTAB" +  _br +
	"NEWTAB(""IV. Higher and Adjacent Units:"")" + _br +
	"<font color='#5BD527'><h1>Description:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw_Higher_Disp,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Boundaries:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw_Higher_Boundary,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Location and Capability of Artillery:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw_Higher_Arty,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""V. Mission:"")" + _br +
	"<font color='#5BD527'><h1>Statement:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw_Mission_Desc,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>End State Direction:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw_Higher_Boundary,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VI. Order:"")" + _br +
	"<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw_Order_Tasks,"")) + "<br/><br/>" +
	"<font color='#5BD527'><h1>Tasks for Artillery Elements:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw_Order_Tasks_Arty,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Readiness Timings:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw_Order_Timings,"")) + "<br/><br/>" + _br +
	"<font color='#5BD527'><h1>Signals:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw_Order_Signals,"")) + _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VII. Location of the Commander:"")" + _br +
	"<font color='#5BD527'><h1>Location of the Commander:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw_COMM_LOC,"")) +  _br +
	"ENDTAB" +  _br +
	_br +
	"NEWTAB(""VIII. Succession of Command:"")" + _br +
	"<font color='#5BD527'><h1>Succession of Command:</h1></font color><br/>" +  _br + (UO_FW_GETMVALUE(UO_FW_Briefing_CIVILIAN_Warsaw_SUCC_DESC,"")) + _br +
	"ENDTAB" +  _br;
};

_export = _export + "};" + _br +


"};" + _br +
//Mission Notes
"NEWTAB(""Mission Notes:"")" +  _br +
"<font color='#5BD527'><h1>Author:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_MissionNotes_Author,"")) + "<br/><br/>" + _br +
"<font color='#5BD527'><h1>Testers:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_MissionNotes_Testers,"")) + "<br/><br/>" + _br +
"<font color='#5BD527'><h1>End Conditions:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_MissionNotes_Conditions,"")) + "<br/><br/>" + _br +
"<font color='#5BD527'><h1>Mission Specific Notes:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_MissionNotes_Custom,"")) + "<br/><br/>" + _br +
"<font color='#5BD527'><h1>Mission Changelog:</h1></font color><br/>" + _br + (UO_FW_GETMVALUE(UO_FW_Briefing_MissionNotes_Changelog,"")) +  _br +
"ENDTAB" +  _br;

private _gamemastermsg = "";

if (UO_FW_GETMVALUE(UO_FW_Briefing_MissionNotes_GM,false)) then {
	_gamemastermsg = "This mission is designed for game mastering and can be manipulated as per Mission Notes";
} else {
	_gamemastermsg = "This mission is not designed for game mastering and should only be manipulated for technical, administrative or diagnostic purposes.";
};

//Game Mastering
_export = _export +
"NEWTAB(""Game Mastering"")" +  _br +
"<font color='#5BD527'><h1>Game Mastering:</h1></font color><br/>" + _gamemastermsg +  _br +
"ENDTAB" +  _br +

"DISPLAYBRIEFING()";

copyToClipboard _export;

LOG("Finished Exporting Briefing");
