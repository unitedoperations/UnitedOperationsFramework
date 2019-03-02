class EGVAR(ACRE,Folder) {
    text = "Configure ACRE";
    //items[] = {QEGVAR(Configure_Blufor),QEGVAR(Configure_Opfor),QEGVAR(Configure_Indfor),"UO_FW_ACRE_Configure_CIV","UO_FW_ACRE_MainSettings_Configure"};
    items[] = {QEGVAR(Configure_Blufor),QEGVAR(Configure_Opfor),QEGVAR(Configure_Indfor),"UO_FW_ACRE_Configure_CIV","UO_FW_ACRE_MainSettings_Configure"};
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

class EGVAR(ACRE,MainSettings_Configure) {
    text = "Configure ACRE Settings";
    action = "edit3DENMissionAttributes 'UO_FW_ACRE_MainSettings';";
};
