class EGVAR(Briefing,ContextFolder) 
{
	text = "Briefing Settings";
	value = 0;
	items[] = {
		QEGVAR(Briefing,BluforContext),
		QEGVAR(Briefing,OpforContext),
		QEGVAR(Briefing,IndforContext),
		QEGVAR(Briefing,CivilianContext),
		QEGVAR(Briefing,MissionContext),
		QEGVAR(Briefing,ExportContext)
	};
    picture = "\a3\3DEN\Data\Cfg3DEN\Comment\texture_ca.paa";
};

class EGVAR(Briefing,BluforContext)
{
	text = "Configure BLUFOR Briefing";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Briefing,Blufor)););
};

class EGVAR(Briefing,OpforContext)
{
	text = "Configure OPFOR Briefing";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Briefing,Opfor)););
};

class EGVAR(Briefing,IndforContext)
{
	text = "Configure INDFOR Briefing";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Briefing,Indfor)););
};

class EGVAR(Briefing,CivilianContext)
{
	text = "Configure Civilian Briefing";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Briefing,Civilian)););
};

class EGVAR(Briefing,MissionContext)
{
	text = "Configure Mission Notes";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Briefing,MissionNotes)););
};

class EGVAR(Briefing,ExportContext)
{
	text = "Export Briefing";
	value = 0;
	action = QUOTE([] call EFUNC(Briefing,ExportBriefings););
};