class EGVAR(ACRE,PreInit) {
	clientInit = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\ACREModule\cfgXEH\init\ClientPreInit.sqf';";
	serverInit = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\ACREModule\cfgXEH\init\ServerPreInit.sqf';";
};
