class EGVAR(Gear,Settings) {
    text = "Configure Gear Settings";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Gear,Settings)););
    picture = "\a3\modules_f\data\portraitModule_ca.paa";
};

class EGVAR(Gear,LoadOnAll) {
    text = "Load Gear On All Entities";
    action = QUOTE([] call EFUNC(Gear,setAllEntityGear););
    picture = "\a3\3DEN\Data\Attributes\ComboPreview\play_ca.paa";
};

class EGVAR(Gear,Configure_Blufor) {
    text = "Configure Blufor Gear";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Gear,Menu_Blufor)));
    picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa";
};

class EGVAR(Gear,Configure_Opfor) {
    text = "Configure Opfor Gear";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Gear,Menu_Opfor)));
	picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa";
};

class EGVAR(Gear,Configure_Indfor) {
    text = "Configure Indfor Gear";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Gear,Menu_Indfor)));
	picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa";
};

class EGVAR(Gear,Configure_Civ) {
    text = "Configure Civilian Gear";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Gear,Menu_Civ)));
	picture = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa";
};

class EGVAR(Gear,Folder) {
    text = "Configure Gear";
    items[] = {
        QEGVAR(Gear,Settings),
        QEGVAR(Gear,LoadOnAll),
        QEGVAR(Gear,Configure_Blufor),
        QEGVAR(Gear,Configure_Opfor),
        QEGVAR(Gear,Configure_Indfor),
        QEGVAR(Gear,Configure_Civ)
    };
    picture = "\a3\3DEN\Data\Displays\Display3DEN\EntityMenu\arsenal_ca.paa";
};
