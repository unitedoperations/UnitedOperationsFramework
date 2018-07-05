class UO_FW_Briefing_Folder
{
    text = "Configure Briefings";
	items[] = {"UO_FW_Blufor_Briefing_Configure","UO_FW_Opfor_Briefing_Configure","UO_FW_Indfor_Briefing_Configure","UO_FW_CIV_Briefing_Configure","UO_FW_Mission_Notes_Configure"};
    picture = "\a3\3DEN\Data\Cfg3DEN\Comment\texture_ca.paa";
};

class UO_FW_Blufor_Briefing_Configure
{
    text = "Configure Blufor Briefing";
	action = "edit3DENMissionAttributes 'UO_FW_Blufor_Briefing';";
};

class UO_FW_Opfor_Briefing_Configure
{
    text = "Configure Opfor Briefing";
	action = "edit3DENMissionAttributes 'UO_FW_Opfor_Briefing';";
};

class UO_FW_Indfor_Briefing_Configure
{
    text = "Configure Indfor Briefing";
	action = "edit3DENMissionAttributes 'UO_FW_Indfor_Briefing';";
};

class UO_FW_CIV_Briefing_Configure
{
    text = "Configure Civilian Briefing";
	action = "edit3DENMissionAttributes 'UO_FW_CIV_Briefing';";
};

class UO_FW_Mission_Notes_Configure
{
    text = "Configure Mission Notes";
	action = "edit3DENMissionAttributes 'UO_FW_Mission_Notes';";
};