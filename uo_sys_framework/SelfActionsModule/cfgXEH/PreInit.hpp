class EGVAR(SelfActions,PreInit) {
    Init = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\SelfActionsModule\cfgXEH\init\PreInit.sqf';";
    clientInit = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\SelfActionsModule\cfgXEH\init\ClientPreInit.sqf';";
};
