class EGVAR(ShotCount,PreInit) {
    serverInit = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\ShotCountModule\cfgXEH\init\ServerPreInit.sqf';";
    clientInit = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\ShotCountModule\cfgXEH\init\ClientPreInit.sqf';";
};
