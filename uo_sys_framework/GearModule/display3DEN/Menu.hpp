class EGVAR(Gear,Settings) {
    text = "Configure Gear Settings";
    action = "edit3DENMissionAttributes 'UO_FW_Gear_Settings';";
};

class EGVAR(Gear,LoadOnAll) {
    text = "Load Gear On All Entities";
    action = "[] call FUNC(setAllEntityGear);";
};

class EGVAR(Blufor,Gear_Configure) {
    text = "Configure Blufor Gear";
    action = "edit3DENMissionAttributes 'UO_FW_GearSettings_Blufor';";
};

class EGVAR(Opfor,Gear_Configure) {
    text = "Configure Opfor Gear";
    action = "edit3DENMissionAttributes 'UO_FW_GearSettings_Opfor';";
};

class EGVAR(Indfor,Gear_Configure) {
    text = "Configure Indfor Gear";
    action = "edit3DENMissionAttributes 'UO_FW_GearSettings_Indfor';";
};

class EGVAR(CIV,Gear_Configure) {
    text = "Configure Civilian Gear";
    action = "edit3DENMissionAttributes 'UO_FW_GearSettings_Civilian';";
};

class EGVAR(Gear,Folder) {
    text = "Configure Gear";
    items[] = {"UO_FW_Gear_Settings","UO_FW_Gear_LoadOnAll","UO_FW_Blufor_Gear_Configure","UO_FW_Opfor_Gear_Configure","UO_FW_Indfor_Gear_Configure","UO_FW_Civilian_Gear_Configure"};
    picture = "\a3\3DEN\Data\Displays\Display3DEN\EntityMenu\arsenal_ca.paa";
};
