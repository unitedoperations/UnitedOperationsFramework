class EGVAR(3DEN,EH) {
    onTerrainNew = "\
        if (getMissionConfigValue ['UO_FW_Enabled',false]) then {\
            [] call EFUNC(3DEN,BasicSettings3Den);\
        };\
    ";
    onMissionLoad = "\
        if (getMissionConfigValue ['UO_FW_Enabled',false]) then {\
            [] call EFUNC(3DEN,BasicSettings3Den);\
        };\
    ";
    onMissionNew  = "\
        if (getMissionConfigValue ['UO_FW_Enabled',false]) then {\
            [] call EFUNC(3DEN,BasicSettings3Den);\
        };\
    ";
    onMissionSave  = "\
        if (getMissionConfigValue ['UO_FW_Enabled',false]) then {\
            [] call EFUNC(3DEN,BasicSettings3Den);\
        };\
    ";
    OnMissionPreviewEnd = "\
        if (getMissionConfigValue ['UO_FW_Enabled',false]) then {\
            [] call EFUNC(3DEN,BasicSettings3Den);\
        };\
    ";
};
