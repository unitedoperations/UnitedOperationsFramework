class EGVAR(Gear,ContextFolder) 
{
	text = "Gear Settings";
	value = 0;
	items[] = {
		QEGVAR(Gear,SettingsContext),
		QEGVAR(Gear,LoadOnAllContext),
		QEGVAR(Gear,BluforContext),
		QEGVAR(Gear,OpforContext),
		QEGVAR(Gear,IndforContext),
		QEGVAR(Gear,CivilianContext)
	};
	picture = "\a3\3DEN\Data\Displays\Display3DEN\EntityMenu\arsenal_ca.paa";
	conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
};

class EGVAR(Gear,SettingsContext)
{
	text = "Configure Gear Settings";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Gear,Settings)););
	picture = "\a3\modules_f\data\portraitModule_ca.paa";
	conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
};

class EGVAR(Gear,LoadOnAllContext)
{
	text = "Load Gear - All Units";
	value = 0;
	action = QUOTE([] call EFUNC(Gear,setAllEntityGear););
	picture = "\a3\3DEN\Data\Attributes\ComboPreview\play_ca.paa";
	conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
};

// class EGVAR(Gear,ContextLoadOnUnit)
// {
// 	text = "Load Gear - This Unit";
// 	value = 0;
// 	action = QUOTE([] call EFUNC(Gear,setEntityGear););
//	conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
// };

class EGVAR(Gear,BluforContext)
{
	text = "Configure BLUFOR Gear";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Gear,Menu_Blufor)););
	picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa";
	conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
};

class EGVAR(Gear,OpforContext)
{
	text = "Configure OPFOR Gear";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Gear,Menu_Opfor)););
	picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa";
	conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
};

class EGVAR(Gear,IndforContext)
{
	text = "Configure INDFOR Gear";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Gear,Menu_Indfor)););
	picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa";
	conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
};

class EGVAR(Gear,CivilianContext)
{
	text = "Configure Civilian Gear";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Gear,Menu_Civ)););
	picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa";
	conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
};