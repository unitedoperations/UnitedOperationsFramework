#define EH_3DENBASICSETTINGS QUOTE(\
    if !((getMissionConfigValue [ARR_2('UO_FW_Enabled','')]) isEqualTo '') then {\
        if ((getMissionConfigValue [ARR_2('UO_FW_Enabled','false')])) then {\
            [] call (EFUNC(3DEN,BasicSettings3Den));\
        };\
    };\
)

class EGVAR(3DEN,EH) {
    onTerrainNew = EH_3DENBASICSETTINGS;
    onMissionLoad = EH_3DENBASICSETTINGS;
    onMissionNew = EH_3DENBASICSETTINGS;
    onMissionSave = EH_3DENBASICSETTINGS;
    OnMissionPreviewEnd = EH_3DENBASICSETTINGS;
};
