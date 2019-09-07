class EGVAR(FiremissionVirtual,Settings) {
    text = "Configure Firemission Virtual Settings";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(FiremissionVirtual,Menu_Settings)););
};
class EGVAR(FiremissionVirtual,Settings_FM_1) {
    text = "Configure Firemission 1 Settings";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(FiremissionVirtual,Menu_1)););
};
class EGVAR(FiremissionVirtual,Settings_FM_2) {
    text = "Configure Firemission 2 Settings";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(FiremissionVirtual,Menu_2)););
};
class EGVAR(FiremissionVirtual,Settings_FM_3) {
    text = "Configure Firemission 3 Settings";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(FiremissionVirtual,Menu_3)););
};
class EGVAR(FiremissionVirtual,Settings_FM_4) {
    text = "Configure Firemission 4 Settings";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(FiremissionVirtual,Menu_4)););
};
class EGVAR(FiremissionVirtual,Settings_FM_5) {
    text = "Configure Firemission 5 Settings";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(FiremissionVirtual,Menu_5)););
};
class EGVAR(FiremissionVirtual,Settings_FM_6) {
    text = "Configure Firemission 6 Settings";
    action = QUOTE(edit3DENMissionAttributes QN(EGVAR(FiremissionVirtual,Menu_6)););
};


class EGVAR(FiremissionVirtual,Folder) {
    text = "Configure Firemission Virtual";
    items[] = {
        QEGVAR(FiremissionVirtual,Settings),
        QEGVAR(FiremissionVirtual,Settings_FM_1),
        QEGVAR(FiremissionVirtual,Settings_FM_2),
        QEGVAR(FiremissionVirtual,Settings_FM_3),
        QEGVAR(FiremissionVirtual,Settings_FM_4),
        QEGVAR(FiremissionVirtual,Settings_FM_5),
        QEGVAR(FiremissionVirtual,Settings_FM_6)
    };
    picture = "\a3\3DEN\Data\Displays\Display3DEN\EntityMenu\arsenal_ca.paa";
};
