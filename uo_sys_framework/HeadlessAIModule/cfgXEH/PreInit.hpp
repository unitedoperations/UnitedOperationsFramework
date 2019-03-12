class EGVAR(AI,PreInit) {
    Init = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\HeadlessAIModule\cfgXEH\init\GlobalPreInit.sqf';";
    serverInit = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\HeadlessAIModule\cfgXEH\init\ServerPreInit.sqf';";
    clientInit = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\HeadlessAIModule\cfgXEH\init\ClientPreInit.sqf';";
};
