CFGFUNCFOLDER(CaptureZone,modules);
    CFGFUNC(CaptureZone,CaptureZone);
CFGFUNCFOLDEREND;

CFGFUNCFOLDER(CaptureZone,common);
    CFGFUNC(CaptureZone,Init);
    CFGFUNC(CaptureZone,Loop);
    CFGFUNC(CaptureZone,Validate);
CFGFUNCFOLDEREND;

CFGFUNCFOLDER(CaptureZone,Attributes);
    CFGFUNC(CaptureZone,ColourComboAttribute_AttrLoad);
    CFGFUNC(CaptureZone,ColourComboAttribute_AttrSave);
    CFGFUNC(CaptureZone,ColourComboAttribute_onSelChange);
CFGFUNCFOLDEREND;
