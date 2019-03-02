class EGVAR(StartInParachute,PreInit) {
    Init = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\StartInParachuteModule\cfgXEH\init\PreInit.sqf';";
    ClientInit = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\StartInParachuteModule\cfgXEH\init\ClientPreInit.sqf';";
    ServerInit = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\StartInParachuteModule\cfgXEH\init\ServerPreInit.sqf';";
};
