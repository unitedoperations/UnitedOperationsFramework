class EGVAR(ACRE,ContextFolder) 
{
	text = "ACRE Settings";
	value = 0;
	items[] = {
		QEGVAR(ACRE,ContextMain), 
		QEGVAR(ACRE,ContextBlufor), 
		QEGVAR(ACRE,ContextOpfor), 
		QEGVAR(ACRE,ContextIndfor), 
		QEGVAR(ACRE,ContextCivilian)
	};
	picture = "x\UO_FW\addons\Main\ACREModule\resources\RadioIcon_Radio.paa";
	conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
};

class EGVAR(ACRE,ContextMain)
{
	text = "Open ACRE Settings";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,MainSettings)););
	picture = "\a3\modules_f\data\portraitModule_ca.paa";
	conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
};

class EGVAR(ACRE,ContextBlufor)
{
	text = "Open BLUFOR ACRE Settings";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Blufor)););
	picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa";
	conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
};

class EGVAR(ACRE,ContextOpfor)
{
	text = "Open OPFOR ACRE Settings";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Opfor)););
	picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa";
	conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
};

class EGVAR(ACRE,ContextIndfor)
{
	text = "Open INDFOR ACRE Settings";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Indfor)););
	picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa";
	conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
};

class EGVAR(ACRE,ContextCivilian)
{
	text = "Open Civilian ACRE Settings";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Civilian)););
	picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa";
	conditionShow = "(1-selected)*(1-selectedObject)*(1-hoverObject)*(1-hoverObjectVehicle)";
};