class EGVAR(ACRE,Folder) {
    text = "Configure ACRE";
    items[] = {
        QEGVAR(ACRE,Configure_MainSettings),
        QEGVAR(ACRE,Configure_Blufor),
        QEGVAR(ACRE,Configure_Opfor),
        QEGVAR(ACRE,Configure_Indfor),
        QEGVAR(ACRE,Configure_Civ),
    };
    //picture = "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\talk_ca.paa";
    picture = "x\UO_FW\addons\Main\ACREModule\resources\RadioIcon_Radio.paa";
};

class EGVAR(ACRE,Configure_MainSettings) {
    text = "Configure ACRE Settings";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,MainSettings)));
    picture = "\a3\modules_f\data\portraitModule_ca.paa";
};

class EGVAR(ACRE,Configure_Blufor) {
    text = "Configure Blufor ACRE";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Blufor)));
    picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa";
};

class EGVAR(ACRE,Configure_Opfor) {
    text = "Configure Opfor ACRE";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Opfor)));
    picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa";
};

class EGVAR(ACRE,Configure_Indfor) {
    text = "Configure Indfor ACRE";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Indfor)));
    picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa";
};

class EGVAR(ACRE,Configure_Civ) {
    text = "Configure Civilian ACRE";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(ACRE,Civilian)));
    picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa";
};
