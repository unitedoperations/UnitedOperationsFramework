class EGVAR(Briefing,Folder) {
    text = "Configure Briefings";
    items[] = {"UO_FW_Briefing_Configure_Blufor","UO_FW_Briefing_Configure_Opfor","UO_FW_Briefing_Configure_Indfor","UO_FW_Briefing_Configure_Civilian","UO_FW_Mission_Notes_Configure","UO_FW_Mission_Export"};
    picture = "\a3\3DEN\Data\Cfg3DEN\Comment\texture_ca.paa";
};

class EGVAR(Briefing,Configure_Blufor) {
    text = "Configure Blufor Briefing";
    action = "edit3DENMissionAttributes 'UO_FW_Briefing_Blufor';";
};

class EGVAR(Briefing,Configure_Opfor) {
    text = "Configure Opfor Briefing";
    action = "edit3DENMissionAttributes 'UO_FW_Briefing_Opfor';";
};

class EGVAR(Briefing,Configure_Indfor) {
    text = "Configure Indfor Briefing";
    action = "edit3DENMissionAttributes 'UO_FW_Briefing_Indfor';";
};

class EGVAR(Briefing,Configure_Civilian) {
    text = "Configure Civilian Briefing";
    action = "edit3DENMissionAttributes 'UO_FW_Briefing_Civilian';";
};

class EGVAR(Mission,Notes_Configure) {
    text = "Configure Mission Notes";
    action = "edit3DENMissionAttributes 'UO_FW_Mission_Notes';";
};

class EGVAR(Mission,Export) {
    text = "Export Briefing";
    action = "[] call UO_FW_fnc_Briefing_ExportBriefings;";
};
