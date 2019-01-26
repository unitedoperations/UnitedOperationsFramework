class UO_FW_Respawn_Folder {
    text = "Configure Respawn";
    items[] = {"UO_FW_Respawn_Main","UO_FW_Respawn_BLUFOR","UO_FW_Respawn_OPFOR","UO_FW_Respawn_INDFOR","UO_FW_Respawn_CIV"};
    picture = "\a3\3DEN\Data\Cfg3DEN\History\changeAttributes_ca.paa";
};

class UO_FW_Respawn_BLUFOR {
    text = "BLUFOR Respawn Settings";
    action = "edit3DENMissionAttributes 'UO_FW_Respawn_Settings_BLUFOR';";
};

class UO_FW_Respawn_OPFOR {
    text = "OPFOR Respawn Settings";
    action = "edit3DENMissionAttributes 'UO_FW_Respawn_Settings_OPFOR';";
};

class UO_FW_Respawn_INDFOR {
    text = "INDFOR Respawn Settings";
    action = "edit3DENMissionAttributes 'UO_FW_Respawn_Settings_INDFOR';";
};

class UO_FW_Respawn_CIV {
    text = "Civilian Respawn Settings";
    action = "edit3DENMissionAttributes 'UO_FW_Respawn_Settings_CIV';";
};

class UO_FW_Respawn_Main {
    text = "General Respawn Settings";
    action = "edit3DENMissionAttributes 'UO_FW_Respawn_Settings_Main';";
};
