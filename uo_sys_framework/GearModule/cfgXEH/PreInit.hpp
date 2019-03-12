class EGVAR(Gear,PreInit) {
    Init = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\GearModule\cfgXEH\init\PreInit.sqf';";
    serverInit = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\GearModule\cfgXEH\init\ServerPreInit.sqf';";
    clientInit = "call compile preProcessFileLineNumbers '\x\UO_FW\addons\Main\GearModule\cfgXEH\init\ClientPreInit.sqf';";
};
