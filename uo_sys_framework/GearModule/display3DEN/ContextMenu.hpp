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
};

class EGVAR(Gear,SettingsContext)
{
	text = "Configure Gear Settings";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Gear,Settings)););
};

class EGVAR(Gear,LoadOnAllContext)
{
	text = "Load Gear - All Units";
	value = 0;
	action = QUOTE([] call EFUNC(Gear,setAllEntityGear););
};

// class EGVAR(Gear,ContextLoadOnUnit)
// {
// 	text = "Load Gear - This Unit";
// 	value = 0;
// 	action = QUOTE([] call EFUNC(Gear,setEntityGear););
// };

class EGVAR(Gear,BluforContext)
{
	text = "Configure BLUFOR Gear";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Gear,Menu_Blufor)););
};

class EGVAR(Gear,OpforContext)
{
	text = "Configure OPFOR Gear";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Gear,Menu_Opfor)););
};

class EGVAR(Gear,IndforContext)
{
	text = "Configure INDFOR Gear";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Gear,Menu_Indfor)););
};

class EGVAR(Gear,CivilianContext)
{
	text = "Configure Civilian Gear";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Gear,Menu_Civ)););
};