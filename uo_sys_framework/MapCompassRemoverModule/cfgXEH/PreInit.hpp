class EGVAR(MapAndCompassRemover,PreInit) {
    Init = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\MapAndCompassRemoverModule\cfgXEH\init\PreInit.sqf';";
    ClientInit = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\MapAndCompassRemoverModule\cfgXEH\init\ClientPreInit.sqf';";
    ServerInit = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\MapAndCompassRemoverModule\cfgXEH\init\ServerPreInit.sqf';";
};
