class EGVAR(EndConditions,Folder) {
    text = "Configure End Conditions";
    items[] = {    EGVAR(EndConditions,Settings),
        EGVAR(EndConditions,Settings_Category1),
        EGVAR(EndConditions,Settings_Category2),
        EGVAR(EndConditions,Settings_Category3),
        EGVAR(EndConditions,Settings_Category4),
        EGVAR(EndConditions,Settings_Category5),
        EGVAR(EndConditions,Settings_Category6)
    };
    picture = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
};

class EGVAR(EndConditions,Settings) {
    text = "Configure End Conditions";
    action = "edit3DENMissionAttributes 'UO_FW_EndConditions_Settings_Menu';";
    picture = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
};

class EGVAR(EndConditions,Settings_Category1) {
    text = "Configure Condition Category 1";
    action = "edit3DENMissionAttributes 'UO_FW_EndConditions_Category_1_Menu';";
};

class EGVAR(EndConditions,Settings_Category2) {
    text = "Configure Condition Category 2";
    action = "edit3DENMissionAttributes 'UO_FW_EndConditions_Category_2_Menu';";
};

class EGVAR(EndConditions,Settings_Category3) {
    text = "Configure Condition Category 3";
    action = "edit3DENMissionAttributes 'UO_FW_EndConditions_Category_3_Menu';";
};

class EGVAR(EndConditions,Settings_Category4) {
    text = "Configure Condition Category 4";
    action = "edit3DENMissionAttributes 'UO_FW_EndConditions_Category_4_Menu';";
};

class EGVAR(EndConditions,Settings_Category5) {
    text = "Configure Condition Category 5";
    action = "edit3DENMissionAttributes 'UO_FW_EndConditions_Category_5_Menu';";
};

class EGVAR(EndConditions,Settings_Category6) {
    text = "Configure Condition Category 6";
    action = "edit3DENMissionAttributes 'UO_FW_EndConditions_Category_6_Menu';";
};
