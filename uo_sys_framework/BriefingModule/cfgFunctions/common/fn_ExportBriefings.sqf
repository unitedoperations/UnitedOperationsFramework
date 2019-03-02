#define COMPONENT Briefing
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

if !(is3DEN) exitwith {};
startLoadingScreen ["Exporting Briefing to clipboard..."];

LOG("Exporting Briefing");
_br = toString [13,10];//(carriage return & line feed)

_export = "_briefing = [];" + _br +

"#define NEWTAB(NAME) _briefing set [count _briefing, [""Diary"",[NAME,""" + _br +
"#define ENDTAB ""]]];" + _br +

"#define DISPLAYBRIEFING() \" + _br +
"_size = count _briefing - 1; \" + _br +
"for '_i' from 0 to _size do \" + _br +
"{ \" + _br +
"    player createDiaryRecord (_briefing select _size - _i); \" + _br +
"};" + _br + _br +


 "switch (side player) do " + _br +
"{" + _br +
"case west:" + _br +
"{" + _br;
if (GETMVALUE(NATO_BLUFOR,false)) then {
    //Situation
    _export = _export + "NEWTAB(""I. Situation:"")" + _br +
    "<font color='#5BD527'><h1>Situation:</h1></font color><br/>" + _br + (GETMVALUE(NATO_SIT_Main_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" + _br + (GETMVALUE(NATO_SIT_Terrain_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Key Terrain:</h1></font color><br/>" + _br + (GETMVALUE(NATO_SIT_KEYTerrain_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Weather:</h1></font color><br/>" + _br + (GETMVALUE(NATO_SIT_Weather_BLUFOR,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    //Enemy
    "NEWTAB(""   A. Enemy Forces:"")" + _br +
    "<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_DIS_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_STRENGTH_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Equipment:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_EQUIPMENT_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_APPEARANCE_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>MLCOA:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_MLCOA_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>MDCOA:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_MDCOA_BLUFOR,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    //Friendly
    "NEWTAB(""   B. Friendly Forces:"")" + _br +
    "<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + (GETMVALUE(NATO_FRIENDLY_DIS_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Higher Units:</h1></font color><br/>" + (GETMVALUE(NATO_FRIENDLY_Higher_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + (GETMVALUE(NATO_Enemy_STRENGTH_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + (GETMVALUE(NATO_Enemy_APPEARANCE_BLUFOR,"")) + "<br/><br/>" + _br +
    "ENDTAB" +  _br +
    _br +
    //Mission
    "NEWTAB(""II. Mission:"")" +  _br +
    "<font color='#5BD527'><h1>Mission:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Mission_BLUFOR,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""III. Execution:"")" + _br +
    "<font color='#5BD527'><h1>Commanders Intent:</h1></font color><br/>" + _br + (GETMVALUE(NATO_EXECUTION_INTENT_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Maneuver:</h1></font color><br/>" + _br + (GETMVALUE(NATO_EXECUTION_MANEUVER_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Timings:</h1></font color><br/>" + _br + (GETMVALUE(NATO_EXECUTION_Timings_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br + (GETMVALUE(NATO_EXECUTION_Tasks_BLUFOR,"")) +  _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""IV. Service Support:"")" +  _br +
    " "   + _br +
    "ENDTAB" +  _br +
    "NEWTAB(""   A. Support:"")" +  _br +
    "<font color='#5BD527'><h1>Fires:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_SANDS_SUPPORT_FIRES_BLUFOR,"")) + "<br/><br/>" +  _br +
    "<font color='#5BD527'><h1>Ammo:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_SANDS_SUPPORT_AMMO_BLUFOR,"")) +   _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""   B. Support: "")" +  _br +
    "<font color='#5BD527'><h1>General:</h1></font color><br/>" + _br + (GETMVALUE(NATO_SANDS_SERVICE_GENERAL_BLUFOR,"")) +  _br +
    "ENDTAB" +  _br +
    "NEWTAB(""V. Command & Signal:"")" +  _br +
    "" + _br +
    "ENDTAB" +  _br +
    "NEWTAB(""   A. Command:"")" + _br +
    "<font color='#5BD527'><h1>General:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_COMMAND_BLUFOR,"")) +   _br +
    "ENDTAB" +  _br +
    "NEWTAB(""   B. Signals:"")" +  _br +
    "<font color='#5BD527'><h1>Frequencies:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_Signals_FREQ_BLUFOR,"")) + "<br/><br/>" +  _br +
    "<font color='#5BD527'><h1>Codewords:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_Signals_CODEWORDS_BLUFOR,"")) + "<br/><br/>" +  _br +
    "<font color='#5BD527'><h1>Special Signals:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_Signals_SPECIAL_BLUFOR,"")) + "<br/><br/>" +  _br +
    "<font color='#5BD527'><h1>Callsigns:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_Signals_CALLSIGNS_BLUFOR,"")) + "<br/><br/>" +  _br +
    "<font color='#5BD527'><h1>Passwords:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_Signals_PASSWORDS_BLUFOR,"")) +  _br +
    "ENDTAB" +  _br;
};

_export = _export + _br +
_br +
_br +
_br +
_br +
_br;
if (GETMVALUE(Warsaw_BLUFOR,false)) then {
    _export = _export + "NEWTAB(""I. Preliminaries:"")" +  _br +
    "<font color='#5BD527'><h1>Weather:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Preliminaries_Weather_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Preliminaries_Terrain_BLUFOR,"")) +  _br +
    "ENDTAB" +  _br +
    "NEWTAB(""II. Reference Points:"")" + _br +
    "<font color='#5BD527'><h1>Deployment Reference Points:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Reference_DeploymentPoints_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Subsequent Reference Points:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Reference_SubsequentPoints_BLUFOR,"")) +  _br +
    "ENDTAB" +  _br +
    "NEWTAB(""III. Enemy:"")" + _br +
    "<font color='#5BD527'><h1>Enemy Disposition:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Disp_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Enemy Equipment:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Equip_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Probable Enemy HQ Location:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Prob_HQ_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Probable Enemy Main Element Location:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Prob_Line_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Probable Enemy Direction of Attack:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Prob_Dir_Attack_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Probable Enemy Artillery Positions & Capability:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Prob_Arty_BLUFOR,"")) + _br +
    "ENDTAB" +  _br +
    "NEWTAB(""IV. Higher and Adjacent Units:"")" + _br +
    "<font color='#5BD527'><h1>Description:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Higher_Disp_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Boundaries:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Higher_Boundary_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Location and Capability of Artillery:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Higher_Arty_BLUFOR,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""V. Mission:"")" + _br +
    "<font color='#5BD527'><h1>Statement:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Mission_Desc_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>End State Direction:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Mission_DIR_BLUFOR,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""VI. Order:"")" + _br +
    "<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br + (GETMVALUE(Warsaw_Order_Tasks_BLUFOR,"")) + "<br/><br/>" +
    "<font color='#5BD527'><h1>Tasks for Artillery Elements:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Order_Tasks_Arty_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Readiness Timings:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Order_Timings_BLUFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Signals:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Order_Signals_BLUFOR,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""VII. Location of the Commander:"")" + _br +
    "<font color='#5BD527'><h1>Location of the Commander:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_COMM_LOC_BLUFOR,"")) +  _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""VIII. Succession of Command:"")" + _br +
    "<font color='#5BD527'><h1>Succession of Command:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_SUCC_DESC_BLUFOR,"")) + _br +
    "ENDTAB" +  _br;
};

_export = _export + "};" + _br;

progressLoadingScreen 0.25;

_export = _export + "case east:" + _br +
"{" + _br;
if (GETMVALUE(NATO_OPFOR,false)) then {
//Situation
    _export = _export + "NEWTAB(""I. Situation:"")" + _br +
    "<font color='#5BD527'><h1>Situation:</h1></font color><br/>" + _br + (GETMVALUE(NATO_SIT_Main_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" + _br + (GETMVALUE(NATO_SIT_Terrain_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Key Terrain:</h1></font color><br/>" + _br + (GETMVALUE(NATO_SIT_KEYTerrain_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Weather:</h1></font color><br/>" + _br + (GETMVALUE(NATO_SIT_Weather_OPFOR,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    //Enemy
    "NEWTAB(""   A. Enemy Forces:"")" + _br +
    "<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_DIS_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_STRENGTH_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Equipment:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_EQUIPMENT_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_APPEARANCE_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>MLCOA:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_MLCOA_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>MDCOA:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_MDCOA_OPFOR,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    //Friendly
    "NEWTAB(""   B. Friendly Forces:"")" + _br +
    "<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + (GETMVALUE(NATO_FRIENDLY_DIS_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Higher Units:</h1></font color><br/>" + (GETMVALUE(NATO_FRIENDLY_Higher_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + (GETMVALUE(NATO_Enemy_STRENGTH_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + (GETMVALUE(NATO_Enemy_APPEARANCE_OPFOR,"")) + "<br/><br/>" + _br +
    "ENDTAB" +  _br +
    _br +
    //Mission
    "NEWTAB(""II. Mission:"")" +  _br +
    "<font color='#5BD527'><h1>Mission:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Mission_OPFOR,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""III. Execution:"")" + _br +
    "<font color='#5BD527'><h1>Commanders Intent:</h1></font color><br/>" + _br + (GETMVALUE(NATO_EXECUTION_INTENT_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Maneuver:</h1></font color><br/>" + _br + (GETMVALUE(NATO_EXECUTION_MANEUVER_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Timings:</h1></font color><br/>" + _br + (GETMVALUE(NATO_EXECUTION_Timings_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br + (GETMVALUE(NATO_EXECUTION_Tasks_OPFOR,"")) +  _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""IV. Service Support:"")" +  _br +
    " "   + _br +
    "ENDTAB" +  _br +
    "NEWTAB(""   A. Support:"")" +  _br +
    "<font color='#5BD527'><h1>Fires:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_SANDS_SUPPORT_FIRES_OPFOR,"")) + "<br/><br/>" +  _br +
    "<font color='#5BD527'><h1>Ammo:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_SANDS_SUPPORT_AMMO_OPFOR,"")) +   _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""   B. Support: "")" +  _br +
    "<font color='#5BD527'><h1>General:</h1></font color><br/>" + _br + (GETMVALUE(NATO_SANDS_SERVICE_GENERAL_OPFOR,"")) +  _br +
    "ENDTAB" +  _br +
    "NEWTAB(""V. Command & Signal:"")" +  _br +
    "" + _br +
    "ENDTAB" +  _br +
    "NEWTAB(""   A. Command:"")" + _br +
    "<font color='#5BD527'><h1>General:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_COMMAND_OPFOR,"")) +   _br +
    "ENDTAB" +  _br +
    "NEWTAB(""   B. Signals:"")" +  _br +
    "<font color='#5BD527'><h1>Frequencies:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_Signals_FREQ_OPFOR,"")) + "<br/><br/>" +  _br +
    "<font color='#5BD527'><h1>Codewords:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_Signals_CODEWORDS_OPFOR,"")) + "<br/><br/>" +  _br +
    "<font color='#5BD527'><h1>Special Signals:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_Signals_SPECIAL_OPFOR,"")) + "<br/><br/>" +  _br +
    "<font color='#5BD527'><h1>Callsigns:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_Signals_CALLSIGNS_OPFOR,"")) + "<br/><br/>" +  _br +
    "<font color='#5BD527'><h1>Passwords:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_Signals_PASSWORDS_OPFOR,"")) +  _br +
    "ENDTAB" +  _br;
};


_export = _export + _br +
_br +
_br +
_br +
_br +
_br;
if (GETMVALUE(Warsaw_OPFOR,false)) then {
    _export = _export + "NEWTAB(""I. Preliminaries:"")" +  _br +
    "<font color='#5BD527'><h1>Weather:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Preliminaries_Weather_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Preliminaries_Terrain_OPFOR,"")) +  _br +
    "ENDTAB" +  _br +
    "NEWTAB(""II. Reference Points:"")" + _br +
    "<font color='#5BD527'><h1>Deployment Reference Points:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Reference_DeploymentPoints_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Subsequent Reference Points:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Reference_SubsequentPoints_OPFOR,"")) +  _br +
    "ENDTAB" +  _br +
    "NEWTAB(""III. Enemy:"")" + _br +
    "<font color='#5BD527'><h1>Enemy Disposition:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Disp_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Enemy Equipment:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Equip_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Probable Enemy HQ Location:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Prob_HQ_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Probable Enemy Main Element Location:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Prob_Line_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Probable Enemy Direction of Attack:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Prob_Dir_Attack_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Probable Enemy Artillery Positions & Capability:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Prob_Arty_OPFOR,"")) + _br +
    "ENDTAB" +  _br +
    "NEWTAB(""IV. Higher and Adjacent Units:"")" + _br +
    "<font color='#5BD527'><h1>Description:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Higher_Disp_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Boundaries:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Higher_Boundary_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Location and Capability of Artillery:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Higher_Arty_OPFOR,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""V. Mission:"")" + _br +
    "<font color='#5BD527'><h1>Statement:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Mission_Desc_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>End State Direction:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Mission_DIR_OPFOR,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""VI. Order:"")" + _br +
    "<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br + (GETMVALUE(Warsaw_Order_Tasks_OPFOR,"")) + "<br/><br/>" +
    "<font color='#5BD527'><h1>Tasks for Artillery Elements:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Order_Tasks_Arty_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Readiness Timings:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Order_Timings_OPFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Signals:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Order_Signals_OPFOR,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""VII. Location of the Commander:"")" + _br +
    "<font color='#5BD527'><h1>Location of the Commander:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_COMM_LOC_OPFOR,"")) +  _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""VIII. Succession of Command:"")" + _br +
    "<font color='#5BD527'><h1>Succession of Command:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_SUCC_DESC_OPFOR,"")) + _br +
    "ENDTAB" +  _br;
};
_export = _export + "};" + _br;

progressLoadingScreen 0.5;

_export = _export + "case independent:" + _br +
"{" + _br;
if (GETMVALUE(NATO_INDFOR,false)) then {
    //Situation
    _export = _export + "NEWTAB(""I. Situation:"")" + _br +
    "<font color='#5BD527'><h1>Situation:</h1></font color><br/>" + _br + (GETMVALUE(NATO_SIT_Main_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" + _br + (GETMVALUE(NATO_SIT_Terrain_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Key Terrain:</h1></font color><br/>" + _br + (GETMVALUE(NATO_SIT_KEYTerrain_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Weather:</h1></font color><br/>" + _br + (GETMVALUE(NATO_SIT_Weather_INDFOR,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    //Enemy
    "NEWTAB(""   A. Enemy Forces:"")" + _br +
    "<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_DIS_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_STRENGTH_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Equipment:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_EQUIPMENT_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_APPEARANCE_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>MLCOA:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_MLCOA_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>MDCOA:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_MDCOA_INDFOR,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    //Friendly
    "NEWTAB(""   B. Friendly Forces:"")" + _br +
    "<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + (GETMVALUE(NATO_FRIENDLY_DIS_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Higher Units:</h1></font color><br/>" + (GETMVALUE(NATO_FRIENDLY_Higher_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + (GETMVALUE(NATO_Enemy_STRENGTH_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + (GETMVALUE(NATO_Enemy_APPEARANCE_INDFOR,"")) + "<br/><br/>" + _br +
    "ENDTAB" +  _br +
    _br +
    //Mission
    "NEWTAB(""II. Mission:"")" +  _br +
    "<font color='#5BD527'><h1>Mission:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Mission_INDFOR,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""III. Execution:"")" + _br +
    "<font color='#5BD527'><h1>Commanders Intent:</h1></font color><br/>" + _br + (GETMVALUE(NATO_EXECUTION_INTENT_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Maneuver:</h1></font color><br/>" + _br + (GETMVALUE(NATO_EXECUTION_MANEUVER_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Timings:</h1></font color><br/>" + _br + (GETMVALUE(NATO_EXECUTION_Timings_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br + (GETMVALUE(NATO_EXECUTION_Tasks_INDFOR,"")) +  _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""IV. Service Support:"")" +  _br +
    " "   + _br +
    "ENDTAB" +  _br +
    "NEWTAB(""   A. Support:"")" +  _br +
    "<font color='#5BD527'><h1>Fires:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_SANDS_SUPPORT_FIRES_INDFOR,"")) + "<br/><br/>" +  _br +
    "<font color='#5BD527'><h1>Ammo:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_SANDS_SUPPORT_AMMO_INDFOR,"")) +   _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""   B. Support: "")" +  _br +
    "<font color='#5BD527'><h1>General:</h1></font color><br/>" + _br + (GETMVALUE(NATO_SANDS_SERVICE_GENERAL_INDFOR,"")) +  _br +
    "ENDTAB" +  _br +
    "NEWTAB(""V. Command & Signal:"")" +  _br +
    "" + _br +
    "ENDTAB" +  _br +
    "NEWTAB(""   A. Command:"")" + _br +
    "<font color='#5BD527'><h1>General:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_COMMAND_INDFOR,"")) +   _br +
    "ENDTAB" +  _br +
    "NEWTAB(""   B. Signals:"")" +  _br +
    "<font color='#5BD527'><h1>Frequencies:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_Signals_FREQ_INDFOR,"")) + "<br/><br/>" +  _br +
    "<font color='#5BD527'><h1>Codewords:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_Signals_CODEWORDS_INDFOR,"")) + "<br/><br/>" +  _br +
    "<font color='#5BD527'><h1>Special Signals:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_Signals_SPECIAL_INDFOR,"")) + "<br/><br/>" +  _br +
    "<font color='#5BD527'><h1>Callsigns:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_Signals_CALLSIGNS_INDFOR,"")) + "<br/><br/>" +  _br +
    "<font color='#5BD527'><h1>Passwords:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_Signals_PASSWORDS_INDFOR,"")) +  _br +
    "ENDTAB" +  _br;
};


_export = _export + _br +
_br +
_br +
_br +
_br +
_br;
if (GETMVALUE(Warsaw_INDFOR,false)) then {
    _export = _export + "NEWTAB(""I. Preliminaries:"")" +  _br +
    "<font color='#5BD527'><h1>Weather:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Preliminaries_Weather_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Preliminaries_Terrain_INDFOR,"")) +  _br +
    "ENDTAB" +  _br +
    "NEWTAB(""II. Reference Points:"")" + _br +
    "<font color='#5BD527'><h1>Deployment Reference Points:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Reference_DeploymentPoints_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Subsequent Reference Points:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Reference_SubsequentPoints_INDFOR,"")) +  _br +
    "ENDTAB" +  _br +
    "NEWTAB(""III. Enemy:"")" + _br +
    "<font color='#5BD527'><h1>Enemy Disposition:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Disp_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Enemy Equipment:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Equip_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Probable Enemy HQ Location:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Prob_HQ_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Probable Enemy Main Element Location:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Prob_Line_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Probable Enemy Direction of Attack:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Prob_Dir_Attack_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Probable Enemy Artillery Positions & Capability:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Prob_Arty_INDFOR,"")) + _br +
    "ENDTAB" +  _br +
    "NEWTAB(""IV. Higher and Adjacent Units:"")" + _br +
    "<font color='#5BD527'><h1>Description:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Higher_Disp_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Boundaries:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Higher_Boundary_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Location and Capability of Artillery:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Higher_Arty_INDFOR,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""V. Mission:"")" + _br +
    "<font color='#5BD527'><h1>Statement:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Mission_Desc_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>End State Direction:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Mission_DIR_INDFOR,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""VI. Order:"")" + _br +
    "<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br + (GETMVALUE(Warsaw_Order_Tasks_INDFOR,"")) + "<br/><br/>" +
    "<font color='#5BD527'><h1>Tasks for Artillery Elements:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Order_Tasks_Arty_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Readiness Timings:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Order_Timings_INDFOR,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Signals:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Order_Signals_INDFOR,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""VII. Location of the Commander:"")" + _br +
    "<font color='#5BD527'><h1>Location of the Commander:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_COMM_LOC_INDFOR,"")) +  _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""VIII. Succession of Command:"")" + _br +
    "<font color='#5BD527'><h1>Succession of Command:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_SUCC_DESC_INDFOR,"")) + _br +
    "ENDTAB" +  _br;
};

_export = _export + "};" + _br;

progressLoadingScreen 0.75;

_export = _export + "case civilian:" + _br +
"{" + _br;
if (GETMVALUE(NATO_CIV,false)) then {
    //Situation
    _export = _export + "NEWTAB(""I. Situation:"")" + _br +
    "<font color='#5BD527'><h1>Situation:</h1></font color><br/>" + _br + (GETMVALUE(NATO_SIT_Main_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" + _br + (GETMVALUE(NATO_SIT_Terrain_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Key Terrain:</h1></font color><br/>" + _br + (GETMVALUE(NATO_SIT_KEYTerrain_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Weather:</h1></font color><br/>" + _br + (GETMVALUE(NATO_SIT_Weather_CIV,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    //Enemy
    "NEWTAB(""   A. Enemy Forces:"")" + _br +
    "<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_DIS_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_STRENGTH_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Equipment:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_EQUIPMENT_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_APPEARANCE_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>MLCOA:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_MLCOA_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>MDCOA:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Enemy_MDCOA_CIV,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    //Friendly
    "NEWTAB(""   B. Friendly Forces:"")" + _br +
    "<font color='#5BD527'><h1>Disposition:</h1></font color><br/>" + (GETMVALUE(NATO_FRIENDLY_DIS_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Higher Units:</h1></font color><br/>" + (GETMVALUE(NATO_FRIENDLY_Higher_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Strength:</h1></font color><br/>" + (GETMVALUE(NATO_Enemy_STRENGTH_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Appearance:</h1></font color><br/>" + (GETMVALUE(NATO_Enemy_APPEARANCE_CIV,"")) + "<br/><br/>" + _br +
    "ENDTAB" +  _br +
    _br +
    //Mission
    "NEWTAB(""II. Mission:"")" +  _br +
    "<font color='#5BD527'><h1>Mission:</h1></font color><br/>" + _br + (GETMVALUE(NATO_Mission_CIV,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""III. Execution:"")" + _br +
    "<font color='#5BD527'><h1>Commanders Intent:</h1></font color><br/>" + _br + (GETMVALUE(NATO_EXECUTION_INTENT_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Maneuver:</h1></font color><br/>" + _br + (GETMVALUE(NATO_EXECUTION_MANEUVER_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Timings:</h1></font color><br/>" + _br + (GETMVALUE(NATO_EXECUTION_Timings_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br + (GETMVALUE(NATO_EXECUTION_Tasks_CIV,"")) +  _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""IV. Service Support:"")" +  _br +
    " "   + _br +
    "ENDTAB" +  _br +
    "NEWTAB(""   A. Support:"")" +  _br +
    "<font color='#5BD527'><h1>Fires:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_SANDS_SUPPORT_FIRES_CIV,"")) + "<br/><br/>" +  _br +
    "<font color='#5BD527'><h1>Ammo:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_SANDS_SUPPORT_AMMO_CIV,"")) +   _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""   B. Support: "")" +  _br +
    "<font color='#5BD527'><h1>General:</h1></font color><br/>" + _br + (GETMVALUE(NATO_SANDS_SERVICE_GENERAL_CIV,"")) +  _br +
    "ENDTAB" +  _br +
    "NEWTAB(""V. Command & Signal:"")" +  _br +
    "" + _br +
    "ENDTAB" +  _br +
    "NEWTAB(""   A. Command:"")" + _br +
    "<font color='#5BD527'><h1>General:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_COMMAND_CIV,"")) +   _br +
    "ENDTAB" +  _br +
    "NEWTAB(""   B. Signals:"")" +  _br +
    "<font color='#5BD527'><h1>Frequencies:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_Signals_FREQ_CIV,"")) + "<br/><br/>" +  _br +
    "<font color='#5BD527'><h1>Codewords:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_Signals_CODEWORDS_CIV,"")) + "<br/><br/>" +  _br +
    "<font color='#5BD527'><h1>Special Signals:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_Signals_SPECIAL_CIV,"")) + "<br/><br/>" +  _br +
    "<font color='#5BD527'><h1>Callsigns:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_Signals_CALLSIGNS_CIV,"")) + "<br/><br/>" +  _br +
    "<font color='#5BD527'><h1>Passwords:</h1></font color><br/>" +  _br + (GETMVALUE(NATO_CANDS_Signals_PASSWORDS_CIV,"")) +  _br +
    "ENDTAB" +  _br;
};


_export = _export + _br +
_br +
_br +
_br +
_br +
_br;
if (GETMVALUE(Warsaw_CIV,false)) then {
    _export = _export + "NEWTAB(""I. Preliminaries:"")" +  _br +
    "<font color='#5BD527'><h1>Weather:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Preliminaries_Weather_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Terrain:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Preliminaries_Terrain_CIV,"")) +  _br +
    "ENDTAB" +  _br +
    "NEWTAB(""II. Reference Points:"")" + _br +
    "<font color='#5BD527'><h1>Deployment Reference Points:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Reference_DeploymentPoints_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Subsequent Reference Points:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Reference_SubsequentPoints_CIV,"")) +  _br +
    "ENDTAB" +  _br +
    "NEWTAB(""III. Enemy:"")" + _br +
    "<font color='#5BD527'><h1>Enemy Disposition:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Disp_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Enemy Equipment:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Equip_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Probable Enemy HQ Location:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Prob_HQ_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Probable Enemy Main Element Location:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Prob_Line_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Probable Enemy Direction of Attack:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Prob_Dir_Attack_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Probable Enemy Artillery Positions & Capability:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Enemy_Prob_Arty_CIV,"")) + _br +
    "ENDTAB" +  _br +
    "NEWTAB(""IV. Higher and Adjacent Units:"")" + _br +
    "<font color='#5BD527'><h1>Description:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Higher_Disp_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Boundaries:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Higher_Boundary_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Location and Capability of Artillery:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Higher_Arty_CIV,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""V. Mission:"")" + _br +
    "<font color='#5BD527'><h1>Statement:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Mission_Desc_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>End State Direction:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Mission_DIR_CIV,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""VI. Order:"")" + _br +
    "<font color='#5BD527'><h1>Tasks:</h1></font color><br/>" + _br + (GETMVALUE(Warsaw_Order_Tasks_CIV,"")) + "<br/><br/>" +
    "<font color='#5BD527'><h1>Tasks for Artillery Elements:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Order_Tasks_Arty_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Readiness Timings:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Order_Timings_CIV,"")) + "<br/><br/>" + _br +
    "<font color='#5BD527'><h1>Signals:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_Order_Signals_CIV,"")) + _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""VII. Location of the Commander:"")" + _br +
    "<font color='#5BD527'><h1>Location of the Commander:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_COMM_LOC_CIV,"")) +  _br +
    "ENDTAB" +  _br +
    _br +
    "NEWTAB(""VIII. Succession of Command:"")" + _br +
    "<font color='#5BD527'><h1>Succession of Command:</h1></font color><br/>" +  _br + (GETMVALUE(Warsaw_SUCC_DESC_CIV,"")) + _br +
    "ENDTAB" +  _br;
};

_export = _export + "};" + _br +

"};" + _br +
//Mission Notes
"NEWTAB(""Mission Notes:"")" +  _br +
"<font color='#5BD527'><h1>Author:</h1></font color><br/>" + _br + (GETMVALUE(MissionNotes_Author,"")) + "<br/><br/>" + _br +
"<font color='#5BD527'><h1>Testers:</h1></font color><br/>" + _br + (GETMVALUE(MissionNotes_Testers,"")) + "<br/><br/>" + _br +
"<font color='#5BD527'><h1>End Conditions:</h1></font color><br/>" + _br + (GETMVALUE(MissionNotes_Conditions,"")) + "<br/><br/>" + _br +
"<font color='#5BD527'><h1>Mission Specific Notes:</h1></font color><br/>" + _br + (GETMVALUE(MissionNotes_Custom,"")) + "<br/><br/>" + _br +
"<font color='#5BD527'><h1>Mission Changelog:</h1></font color><br/>" + _br + (GETMVALUE(MissionNotes_Changelog,"")) +  _br +
"ENDTAB" +  _br;

private _gamemastermsg = "";

if (GETMVALUE(MissionNotes_GM,false)) then {
    _gamemastermsg = "This mission is designed for game mastering and can be manipulated as per Mission Notes";
} else {
    _gamemastermsg = "This mission is not designed for game mastering and should only be manipulated for technical, administrative or diagnostic purposes.";
};

progressLoadingScreen 0.9;

//Game Mastering
_export = _export +
"NEWTAB(""Game Mastering"")" +  _br +
"<font color='#5BD527'><h1>Game Mastering:</h1></font color><br/>" + _gamemastermsg +  _br +
"ENDTAB" +  _br +

"DISPLAYBRIEFING()";

endLoadingScreen;

copyToClipboard _export;

LOG("Finished Exporting Briefing");
