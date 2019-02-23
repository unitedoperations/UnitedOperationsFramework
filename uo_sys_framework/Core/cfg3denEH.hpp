class UO_FW_3DEN_EH {
    onTerrainNew = "\
        if (getMissionConfigValue ['UO_FW_Enabled',false]) then {\
            [] call UO_FW_fnc_BasicSettings3Den;\
        };\
    ";
    onMissionLoad = "\
        if (getMissionConfigValue ['UO_FW_Enabled',false]) then {\
            [] call UO_FW_fnc_BasicSettings3Den;\
        };\
    ";
    onMissionNew  = "\
        if (getMissionConfigValue ['UO_FW_Enabled',false]) then {\
            [] call UO_FW_fnc_BasicSettings3Den;\
        };\
    ";
    onMissionSave  = "\
        if (getMissionConfigValue ['UO_FW_Enabled',false]) then {\
            [] call UO_FW_fnc_BasicSettings3Den;\
        };\
    ";
    OnMissionPreviewEnd = "\
        if (getMissionConfigValue ['UO_FW_Enabled',false]) then {\
            [] call UO_FW_fnc_BasicSettings3Den;\
        };\
    ";
};
