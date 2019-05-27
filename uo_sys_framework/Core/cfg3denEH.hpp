#define EH_3DENBASICSETTINGS QUOTE(\
    if !((getMissionConfigValue [ARR_2('EGVAR(Core,Enabled)','')]) isEqualTo '') then {\
        if ((getMissionConfigValue [ARR_2('EGVAR(Core,Enabled)','false')])) then {\
            [] call (EFUNC(3DEN,BasicSettings3DEN));\
        };\
    };\
)

#define EH_3DENBASICSETTINGSCHECK QUOTE(\
    if !((getMissionConfigValue [ARR_2('EGVAR(Core,Enabled)','')]) isEqualTo '') then {\
        if ((getMissionConfigValue [ARR_2('EGVAR(Core,Enabled)','false')])) then {\
            [] call (EFUNC(3DEN,BasicSettings3Den));\
			[] call (EFUNC(3DEN,displayHCSlotRequired));\
        };\
    };\
)

class EGVAR(3DEN,EH) {
    onTerrainNew = EH_3DENBASICSETTINGS;
    onMissionLoad = EH_3DENBASICSETTINGS;
    onMissionNew = EH_3DENBASICSETTINGS;
    onMissionSave = EH_3DENBASICSETTINGSCHECK;
    OnMissionPreviewEnd = EH_3DENBASICSETTINGSCHECK;
};
