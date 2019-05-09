// class Edit
// {
// 	//picture = "someLogo.paa";//Icon used for the entry called '''Log'''
// 	items[] +=
// 	{
// 		QEGVAR(ACRE,ACREContextMain), QEGVAR(ACRE,ACREContextBlufor), QEGVAR(ACRE,ACREContextOpfor), QEGVAR(ACRE,ACREContextIndfor), QEGVAR(ACRE,ACREContextCivilian)
// 	};
// };

items[] = {
	QEGVAR(ACRE,ACREContextMain),
	QEGVAR(ACRE,ACREContextBlufor),
	QEGVAR(ACRE,ACREContextOpfor),
	QEGVAR(ACRE,ACREContextIndfor), 
	QEGVAR(ACRE,ACREContextCivilian)
};

class EGVAR(ACRE,ACREContextMain)
{
	text = "Open Main ACRE Settings";
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,MainSettings)););
	conditionShow = "";
};

class EGVAR(ACRE,ACREContextBlufor)
	text = "Open BLUFOR ACRE Settings";
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Blufor)););
	conditionShow = "";
};

class EGVAR(ACRE,ACREContextOpfor)
{
	text = "Open OPFOR ACRE Settings";
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Opfor)););
	conditionShow = "";
};

class EGVAR(ACRE,ACREContextIndfor)
{
	text = "Open BLUFOR ACRE Settings";
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Indfor)););
	conditionShow = "";
};

class EGVAR(ACRE,ACREContextCivilian)
{
	text = "Open OPFOR ACRE Settings";
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Civilian)););
	conditionShow = "";
};