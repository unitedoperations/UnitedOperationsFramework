class EGVAR(3DEN,EH) {
    onTerrainNew = QUOTE(\
        if ((call compile (getMissionConfigValue [ARR_2('UO_FW_Enabled','false')]))) then {\
            [] call (EFUNC(3DEN,BasicSettings3Den));\
        };\
    );
    onMissionLoad = QUOTE(\
        if ((call compile (getMissionConfigValue [ARR_2('UO_FW_Enabled','false')]))) then {\
            [] call (EFUNC(3DEN,BasicSettings3Den));\
        };\
    );
    onMissionNew = QUOTE(\
        if ((call compile (getMissionConfigValue [ARR_2('UO_FW_Enabled','false')]))) then {\
            [] call (EFUNC(3DEN,BasicSettings3Den));\
        };\
    );
    onMissionSave = QUOTE(\
        if ((call compile (getMissionConfigValue [ARR_2('UO_FW_Enabled','false')]))) then {\
            [] call (EFUNC(3DEN,BasicSettings3Den));\
        };\
    );
    OnMissionPreviewEnd = QUOTE(\
        if ((call compile (getMissionConfigValue [ARR_2('UO_FW_Enabled','false')]))) then {\
            [] call (EFUNC(3DEN,BasicSettings3Den));\
        };\
    );
};
