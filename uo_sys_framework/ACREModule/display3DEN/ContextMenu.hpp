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
};

class EGVAR(ACRE,ContextMain)
{
	text = "Open Main ACRE Settings";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,MainSettings)););
};

class EGVAR(ACRE,ContextBlufor)
{
	text = "Open BLUFOR ACRE Settings";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Blufor)););
};

class EGVAR(ACRE,ContextOpfor)
{
	text = "Open OPFOR ACRE Settings";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Opfor)););
};

class EGVAR(ACRE,ContextIndfor)
{
	text = "Open INDFOR ACRE Settings";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Indfor)););
};

class EGVAR(ACRE,ContextCivilian)
{
	text = "Open OPFOR ACRE Settings";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Civilian)););
};