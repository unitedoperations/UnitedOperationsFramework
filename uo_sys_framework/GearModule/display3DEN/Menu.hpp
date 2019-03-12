class EGVAR(Gear,Settings) {
    text = "Configure Gear Settings";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Gear,Settings)););
};

class EGVAR(Gear,LoadOnAll) {
    text = "Load Gear On All Entities";
    action = QUOTE([] call EFUNC(Gear,setAllEntityGear););
};

class EGVAR(Gear,Configure_Blufor) {
    text = "Configure Blufor Gear";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Gear,Menu_Blufor)));
};

class EGVAR(Gear,Configure_Opfor) {
    text = "Configure Opfor Gear";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Gear,Menu_Opfor)));
};

class EGVAR(Gear,Configure_Indfor) {
    text = "Configure Indfor Gear";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Gear,Menu_Indfor)));
};

class EGVAR(Gear,Configure_Civilian) {
    text = "Configure Civilian Gear";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(Gear,Menu_Civilian)));
};

class EGVAR(Gear,Folder) {
    text = "Configure Gear";
    items[] = {
        QEGVAR(Gear,Settings),
        QEGVAR(Gear,LoadOnAll),
        QEGVAR(Gear,Configure_Blufor),
        QEGVAR(Gear,Configure_Opfor),
        QEGVAR(Gear,Configure_Indfor),
        QEGVAR(Gear,Configure_Civilian)
    };
    picture = "\a3\3DEN\Data\Displays\Display3DEN\EntityMenu\arsenal_ca.paa";
};
