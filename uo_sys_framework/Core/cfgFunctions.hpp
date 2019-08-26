CFGFUNCFOLDERCORE(3DENInits);
    CFGFUNC(3DEN,setDefaults);
CFGFUNCFOLDEREND;

CFGFUNCFOLDERCORE(3DENControls);
    CFGFUNC(3DEN,attributeLoadCombo);
    CFGFUNC(3DEN,attributeSaveCombo);
CFGFUNCFOLDEREND;

CFGFUNCFOLDERCORE(3DENEventhandlers);
    CFGFUNC(3DEN,checkDuplicates);
CFGFUNCFOLDEREND;

CFGFUNCFOLDERCORE(3DENEditor);
    CFGFUNC(3DEN,BasicSettings3DEN);
CFGFUNCFOLDEREND;

CFGFUNCFOLDERCORE(3DENExportImport);
    CFGFUNC(3DEN,ExportSettings);
    CFGFUNC(3DEN,ExportLoadoutSettings);
    CFGFUNC(3DEN,ImportSettings);
    CFGFUNC(3DEN,ImportLoadoutSettings);
CFGFUNCFOLDEREND;

CFGFUNCFOLDERCORE(Common);
    CFGFUNC(Core,addTeam);
    CFGFUNC(Core,alive);
    CFGFUNC(Core,alivePlayers);
    CFGFUNC(Core,areaCount);
    CFGFUNC(Core,casualtyCount);
    CFGFUNC(Core,casualtyPercentage);
    CFGFUNC(Core,countTeam);
    CFGFUNC(Core,createRespawnMarker);
    CFGFUNC(Core,endMission);
    CFGFUNC(Core,eventDisconnect);
    CFGFUNC(Core,eventKilled);
    CFGFUNC(Core,eventRespawned);
    CFGFUNC(Core,eventSpawned);
    CFGFUNC(Core,forceTerrainGrid);
    CFGFUNC(Core,getDamagedAssets);
    CFGFUNC(Core,getTeamVariable);
    CFGFUNC(Core,hasEmptyPositions);
    CFGFUNC(Core,randomRange);
    CFGFUNC(Core,setTeamVariable);
    CFGFUNC(Core,stackNames);
    CFGFUNC(Core,parsedTextDisplay);
CFGFUNCFOLDEREND;

CFGFUNCFOLDERCORE(JIP);
    CFGFUNC(JIP,GiveActions);
    CFGFUNC(JIP,Teleport);
    CFGFUNC(JIP,Transport);
CFGFUNCFOLDEREND;

CFGFUNCFOLDERCORE(EndConditions);
    CFGFUNC(EndConditions,Init);
    CFGFUNC(EndConditions,hasExtracted);
CFGFUNCFOLDEREND;

CFGFUNCFOLDERCORE(EndScreen);
    CFGFUNC(Core,EndScreen);
CFGFUNCFOLDEREND;

CFGFUNCFOLDERCORE(Attributes);
    CFGFUNC(3DEN,ImportFromProfileAttributeAttrLoad);
    CFGFUNC(3DEN,ImportLoadoutFromProfileAttributeAttrLoad);
    CFGFUNC(Respawn,RespawnCombo_AttrLoad);
    CFGFUNC(Respawn,RespawnCombo_AttrSave);
    CFGFUNC(Respawn,RespawnCombo_onLoad);
    CFGFUNC(Respawn,RespawnCombo_onLBSelChanged);
    CFGFUNC(Respawn,respawntemplates_attr_load);
    CFGFUNC(Respawn,respawntemplates_attr_save);
    CFGFUNC(Respawn,RespawnTemplates_onLBSelChanged);
    CFGFUNC(Respawn,RespawnTemplates_onSetFocus);
CFGFUNCFOLDEREND;

CFGFUNCFOLDERCORE(Respawn);
    CFGFUNC(Respawn,SetRespawnModule);
    CFGFUNC(Respawn,HandlePlayerRespawn);
CFGFUNCFOLDEREND;

CFGFUNCFOLDERCORE(Spectator);
    CFGFUNC(Spectator,Spectate);
    CFGFUNC(Spectator,EndSpectate);
    CFGFUNC(Spectator,keyhandleEG);
    CFGFUNC(Spectator,keyhandle46);
    CFGFUNC(Spectator,KillCamToggleKeyH);
CFGFUNCFOLDEREND;

CFGFUNCFOLDERCORE(EventHandlers);
    CFGFUNC(Core,HitHandler);
    CFGFUNC(Core,KilledHandler);
    CFGFUNC(Core,RespawnHandler);
CFGFUNCFOLDEREND;

CFGFUNCFOLDERCORE(Debug);
    CFGFUNC(Debug,debugMessage);
    CFGFUNC(Debug,debugMessageDetailed);
    CFGFUNC(Debug,debugMessageDisplay);
    CFGFUNC(Debug,refreshDebug);
CFGFUNCFOLDEREND;
