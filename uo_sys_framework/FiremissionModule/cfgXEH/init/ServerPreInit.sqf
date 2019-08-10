#define COMPONENT Firemission
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(SERVER);

[QEGVAR(Core,SettingsLoaded), {
    {
        if ((GETVAR(_x,ArtilleryFOAIEnabled,false))) then {
            private _guns = (GETVAR(_x,ArtilleryFOAIGuns,[]));
            private _accuracy = (GETVAR(_x,ArtilleryFOAIAccuracy,50));
            private _speed = (GETVAR(_x,ArtilleryFOAISpeed,50));
            [_x,_accuracy,_speed] call EFUNC(Firemission,SetObserverSkill);
            private _guns = (GETVAR(_x,ArtilleryFOAIGuns,[]));
            private _knowledge = (GETVAR(_x,ArtilleryFOAIKnowledge,2));
            private _minRange = (GETVAR(_x,ArtilleryFOAIMinRange,300));
            private _viewRange = (GETVAR(_x,ArtilleryFOAIViewRange,1000));
            private _dispersion = (GETVAR(_x,ArtilleryFOAIDispersion,200));
            private _salvoCount = (GETVAR(_x,ArtilleryFOAISalvoCount,3));
            private _roundsPerSalvo = (GETVAR(_x,ArtilleryFOAIRoundsPerSalvo,5));
            private _salvoWaitTIme = (GETVAR(_x,ArtilleryFOAISalvoWaitTime,30));
            private _minSpot = (GETVAR(_x,ArtilleryFOAIMinSpottedDistance,150));
            private _index = (GETVAR(_x,ArtilleryFOAIRoundClassName,0));
            [_x,_guns,_knowledge,_minRange,_viewRange,_dispersion,_salvoCount,_roundsPerSalvo,_salvoWaitTIme,_minSpot,_index] call EFUNC(Firemission,RegisterForwardObserver);
        };
    } forEach (allUnits select {!(isPlayer _x)});
    {
        if ((GETVAR(_x,ArtilleryEnabled,false))) then {
            private _artilleryAccuracy = (GETVAR(_x,ArtilleryAccuracy,50));
            private _artillerySpottingAccuracy = (GETVAR(_x,ArtillerySpottingAccuracy,50));
            private _artilleryAimTime = (GETVAR(_x,ArtilleryAimTime,5));
            private _artilleryCalculationTime = (GETVAR(_x,ArtilleryCalculationTime,5));
            private _artilleryCustomName = (GETVAR(_x,ArtilleryCustomName,""));
            private _artilleryUnlimitedAmmo = (GETVAR(_x,ArtilleryUnlimitedAmmo,false));
            private _allowChat = (GETVAR(_x,AllowChatMessage,true));
            [_x,_artilleryAccuracy,_artillerySpottingAccuracy,_artilleryAimTime,_artilleryCalculationTime,_artilleryCustomName,_artilleryUnlimitedAmmo,_allowChat] call EFUNC(Firemission,SetArtilleryData);
        };
    } forEach vehicles;
    [QEGVAR(Firemission,CallCallBracketFiremission), {_this call EFUNC(BracketFiremission,DIA_BracketFiremissionFireServer);}] call CBA_fnc_addEventHandler;
    [QEGVAR(Firemission,CallPolarSpottingFiremission), {_this call EFUNC(PolarSpottingFiremission,DIA_PolarSpottingFiremissionFireServer);}] call CBA_fnc_addEventHandler;
    [QEGVAR(Firemission,CallPointFiremission), {_this call EFUNC(PointFiremission,DIA_PointFiremissionFireServer);}] call CBA_fnc_addEventHandler;
    [QEGVAR(Firemission,CallPolarFiremission), {_this call EFUNC(PolarFiremission,DIA_PolarFiremissionFireServer);}] call CBA_fnc_addEventHandler;
    [QEGVAR(Firemission,CallLineFiremission), {_this call EFUNC(LineFiremission,DIA_LineFiremissionFireServer);}] call CBA_fnc_addEventHandler;
    [QEGVAR(Firemission,CallGridSpottingFiremission), {_this call EFUNC(GridSpottingFiremission,DIA_GridSpottingFiremissionFireServer);}] call CBA_fnc_addEventHandler;
    [QEGVAR(Firemission,CallDonutFiremission), {_this call EFUNC(DonutFiremission,DIA_DonutFiremissionFireServer);}] call CBA_fnc_addEventHandler;
    [QEGVAR(Firemission,CallMarkerFiremission), {_this call EFUNC(MarkerFiremission,DIA_MarkerFiremissionFireServer);}] call CBA_fnc_addEventHandler;
    
    SETMPVAR(NetBusy_WEST,false);
    SETMPVAR(NetBusy_EAST,false);
    SETMPVAR(NetBusy_GUER,false);
    SETMPVAR(NetBusy_CIV,false);

    [{time > 5}, 
	{   
        [QGVAR(SettingsLoaded),[]] call CBA_fnc_globalEventJIP;
    }, [player]] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;
