class EGVAR(Firemission,PreInit) {
    Init = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\FiremissionModule\cfgXEH\init\PreInit.sqf';";
    serverInit = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\FiremissionModule\cfgXEH\init\ServerPreInit.sqf';";
    clientInit = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\FiremissionModule\cfgXEH\init\ClientPreInit.sqf';";
};
