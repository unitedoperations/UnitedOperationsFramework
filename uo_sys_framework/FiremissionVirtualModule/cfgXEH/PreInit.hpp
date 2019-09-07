class EGVAR(FiremissionVirtual,PreInit) {
    Init = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\FiremissionVirtualModule\cfgXEH\init\PreInit.sqf';";
    serverInit = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\FiremissionVirtualModule\cfgXEH\init\ServerPreInit.sqf';";
};
