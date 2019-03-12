CFGFUNCFOLDER(CaptureZone,modules);
    CFGFUNC(CaptureZone,CaptureZone);
CFGFUNCFOLDEREND;

CFGFUNCFOLDER(CaptureZone,common);
    CFGFUNC(CaptureZone,CaptureZoneLoop);
    CFGFUNC(CaptureZone,ValidateCaptureZone);
CFGFUNCFOLDEREND;

CFGFUNCFOLDER(CaptureZone,Attributes);
    CFGFUNC(CaptureZone,ColourComboAttribute_AttrLoad);
    CFGFUNC(CaptureZone,ColourComboAttribute_AttrSave);
    CFGFUNC(CaptureZone,ColourComboAttribute_onSelChange);
CFGFUNCFOLDEREND;
