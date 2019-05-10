class EGVAR(Core,ContextFolder) 
{
	text = "UOF Settings";
	value = 0;
	items[] = {
		QEGVAR(Core,CoreContext),
		QEGVAR(Core,ModulesContext)
	};
	picture = "\a3\3DEN\Data\Cfg3DEN\History\changeAttributes_ca.paa";
};

class EGVAR(Core,CoreContext)
{
	text = "Open UO Framework Settings";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Core,SettingsMenu)););
	picture = "\a3\3DEN\Data\Cfg3DEN\History\changeAttributes_ca.paa";
};

class EGVAR(Core,ModulesContext)
{
	text = "Open Module Settings";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Module,SettingsMenu)););
	picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\modeModules_ca.paa";
};