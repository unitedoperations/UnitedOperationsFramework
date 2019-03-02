class EGVAR(Gear,Settings) {
    text = "Configure Gear Settings";
    action = "edit3DENMissionAttributes 'UO_FW_Gear_Settings';";
};

class EGVAR(Gear,LoadOnAll) {
    text = "Load Gear On All Entities";
    action = "[] call FUNC(setAllEntityGear);";
};

class EGVAR(Gear,Configure_Blufor) {
    text = "Configure Blufor Gear";
    action = "edit3DENMissionAttributes 'UO_FW_GearSettings_Blufor';";
};

class EGVAR(Gear,Configure_Opfor) {
    text = "Configure Opfor Gear";
    action = "edit3DENMissionAttributes 'UO_FW_GearSettings_Opfor';";
};

class EGVAR(Gear,Configure_Indfor) {
    text = "Configure Indfor Gear";
    action = "edit3DENMissionAttributes 'UO_FW_GearSettings_Indfor';";
};

class EGVAR(Gear,_Configure_Civilian) {
    text = "Configure Civilian Gear";
    action = "edit3DENMissionAttributes 'UO_FW_GearSettings_Civilian';";
};

class EGVAR(Gear,Folder) {
    text = "Configure Gear";
    items[] = {
        QEGVAR(Gear,Settings),
        QEGVAR(Gear,LoadOnAll),
        QEGVAR(Gear,Configure_Blufor),
        QEGVAR(Gear,Configure_Opfor),
        QEGVAR(Gear,Configure_Indfor),
        QEGVAR(Gear,_Configure_Civilian)
    };
    picture = "\a3\3DEN\Data\Displays\Display3DEN\EntityMenu\arsenal_ca.paa";
};
