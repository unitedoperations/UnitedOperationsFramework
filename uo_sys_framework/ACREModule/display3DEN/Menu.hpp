class EGVAR(ACRE,Folder) {
    text = "Configure ACRE";
    items[] = {QEGVAR(Acre,Configure_Blufor),QEGVAR(Acre,Configure_Opfor),QEGVAR(Acre,Configure_Indfor),QEGVAR(Acre,Configure_Civilian),QEGVAR(Acre,Configure_MainSettings)};
    //picture = "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\talk_ca.paa";
    picture = "x\UO_FW\addons\Main\ACREModule\resources\RadioIcon_Radio.paa";
};

class EGVAR(Acre,Configure_Blufor) {
    text = "Configure Blufor ACRE";
    action = "edit3DENMissionAttributes 'UO_FW_ACRE_Blufor';";
};

class EGVAR(Acre,Configure_Opfor) {
    text = "Configure Opfor ACRE";
    action = "edit3DENMissionAttributes 'UO_FW_ACRE_Opfor';";
};

class EGVAR(Acre,Configure_Indfor) {
    text = "Configure Indfor ACRE";
    action = "edit3DENMissionAttributes 'UO_FW_ACRE_Indfor';";
};

class EGVAR(ACRE,Configure_Civilian) {
    text = "Configure Civilian ACRE";
    action = "edit3DENMissionAttributes 'UO_FW_ACRE_Civilian';";
};

class EGVAR(ACRE,Configure_MainSettings) {
    text = "Configure ACRE Settings";
    action = "edit3DENMissionAttributes 'UO_FW_ACRE_MainSettings';";
};
