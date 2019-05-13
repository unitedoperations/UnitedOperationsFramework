class EGVAR(Briefing,ContextFolder) 
{
	text = "Briefing Settings";
	value = 0;
	items[] = {
		QEGVAR(Briefing,MissionContext),
		QEGVAR(Briefing,BluforContext),
		QEGVAR(Briefing,OpforContext),
		QEGVAR(Briefing,IndforContext),
		QEGVAR(Briefing,CivilianContext),
		QEGVAR(Briefing,ExportContext)
	};
    picture = "\a3\3DEN\Data\Cfg3DEN\Comment\texture_ca.paa";
	conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
};

class EGVAR(Briefing,MissionContext)
{
	text = "Configure Mission Notes";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Briefing,MissionNotes)););
	picture = "\a3\modules_f\data\portraitModule_ca.paa";
	conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
};

class EGVAR(Briefing,BluforContext)
{
	text = "Configure BLUFOR Briefing";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Briefing,Blufor)););
	picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa";
	conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
};

class EGVAR(Briefing,OpforContext)
{
	text = "Configure OPFOR Briefing";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Briefing,Opfor)););
	picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa";
	conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
};

class EGVAR(Briefing,IndforContext)
{
	text = "Configure INDFOR Briefing";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Briefing,Indfor)););
	picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa";
	conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
};

class EGVAR(Briefing,CivilianContext)
{
	text = "Configure Civilian Briefing";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Briefing,Civilian)););
	picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa";
	conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
};

class EGVAR(Briefing,ExportContext)
{
	text = "Export Briefing to Clipboard";
	value = 0;
	action = QUOTE([] call EFUNC(Briefing,ExportBriefings););
	picture = "\a3\3DEN\Data\Displays\Display3DEN\EntityMenu\moveFlying_ca.paa";
	conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
};
