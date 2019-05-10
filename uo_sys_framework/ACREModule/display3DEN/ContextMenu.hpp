class EGVAR(ACRE,ContextFolder) 
{
	text = "ACRE Settings";
	value = 0;
	items[] = {
		QEGVAR(ACRE,ACREContextMain), QEGVAR(ACRE,ACREContextBlufor), QEGVAR(ACRE,ACREContextOpfor), QEGVAR(ACRE,ACREContextIndfor), QEGVAR(ACRE,ACREContextCivilian)
	};
	picture = "x\UO_FW\addons\Main\ACREModule\resources\RadioIcon_Radio.paa";
};

class EGVAR(ACRE,ACREContextMain)
{
	text = "Open Main ACRE Settings";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,MainSettings)););
};

class EGVAR(ACRE,ACREContextBlufor)
{
	text = "Open BLUFOR ACRE Settings";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Blufor)););
};

class EGVAR(ACRE,ACREContextOpfor)
{
	text = "Open OPFOR ACRE Settings";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Opfor)););
};

class EGVAR(ACRE,ACREContextIndfor)
{
	text = "Open INDFOR ACRE Settings";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Indfor)););
};

class EGVAR(ACRE,ACREContextCivilian)
{
	text = "Open OPFOR ACRE Settings";
	value = 0;
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Civilian)););
};