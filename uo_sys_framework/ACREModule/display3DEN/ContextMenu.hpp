// class EGVAR(ACRE,ContextFolder) {
// 	items[] = {
// 		QEGVAR(ACRE,ACREContextMain),
// 		QEGVAR(ACRE,ACREContextBlufor), 
// 		QEGVAR(ACRE,ACREContextOpfor), 
// 		QEGVAR(ACRE,ACREContextIndfor), 
// 		QEGVAR(ACRE,ACREContextCivilian)
// 	};
// };



class EGVAR(ACRE,ACREContextMain)
{
	text = "Open Main ACRE Settings";
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,MainSettings)););
};

class EGVAR(ACRE,ACREContextBlufor)
{
	text = "Open BLUFOR ACRE Settings";
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Blufor)););
};

class EGVAR(ACRE,ACREContextOpfor)
{
	text = "Open OPFOR ACRE Settings";
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Opfor)););
};

class EGVAR(ACRE,ACREContextIndfor)
{
	text = "Open BLUFOR ACRE Settings";
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Indfor)););
};

class EGVAR(ACRE,ACREContextCivilian)
{
	text = "Open OPFOR ACRE Settings";
	action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Civilian)););
};