#define COMPONENT Firemission
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(SERVER);

[QEGVAR(Core,SettingsLoaded), {
    {
        if ((MGETVAR(_x,ArtilleryFOAIEnabled,false))) then {
            private _guns = (MGETVAR(_x,ArtilleryFOAIGuns,[]));
            private _accuracy = (MGETVAR(_x,ArtilleryFOAIAccuracy,50));
            private _speed = (MGETVAR(_x,ArtilleryFOAISpeed,50));
            [_x,_accuracy,_speed] call UO_FW_fnc_SetObserverSkill;
            private _guns = (MGETVAR(_x,ArtilleryFOAIGuns,[]));
            private _knowledge = (MGETVAR(_x,ArtilleryFOAIKnowledge,2));
            private _minRange = (MGETVAR(_x,ArtilleryFOAIMinRange,300));
            private _viewRange = (MGETVAR(_x,ArtilleryFOAIViewRange,1000));
            private _dispersion = (MGETVAR(_x,ArtilleryFOAIDispersion,200));
            private _salvoCount = (MGETVAR(_x,ArtilleryFOAISalvoCount,3));
            private _roundsPerSalvo = (MGETVAR(_x,ArtilleryFOAIRoundsPerSalvo,5));
            private _salvoWaitTIme = (MGETVAR(_x,ArtilleryFOAISalvoWaitTime,30));
            private _minSpot = (MGETVAR(_x,ArtilleryFOAIMinSpottedDistance,150));
            private _index = (MGETVAR(_x,ArtilleryFOAIRoundIndex,0));
            [_x,_guns,_knowledge,_minRange,_viewRange,_dispersion,_salvoCount,_roundsPerSalvo,_salvoWaitTIme,_minSpot,_index] call UO_FW_fnc_RegisterForwardObserver;
        };
    } forEach (allUnits select {!(isPlayer _x)});
    {
        if ((MGETVAR(_x,ArtilleryEnabled,false))) then {
            private _artilleryFireRate = (MGETVAR(_x,ArtilleryFireRate,1));
            private _artilleryAccuracy = (MGETVAR(_x,ArtilleryAccuracy,50));
            private _artillerySpottingAccuracy = (MGETVAR(_x,ArtillerySpottingAccuracy,50));
            private _artilleryAimTime = (MGETVAR(_x,ArtilleryAimTime,20));
            private _artilleryCalculationTime = (MGETVAR(_x,ArtilleryCalculationTime,30));
            private _artilleryCustomName = (MGETVAR(_x,ArtilleryCustomName,""));
            private _artilleryUnlimitedAmmo = (MGETVAR(_x,ArtilleryUnlimitedAmmo,false));
            [_x,_artilleryFireRate,_artilleryAccuracy,_artillerySpottingAccuracy,_artilleryAimTime,_artilleryCalculationTime,_artilleryCustomName,_artilleryUnlimitedAmmo] call UO_FW_fnc_SetArtilleryData;
        };
    } forEach vehicles;
    ["CallBracketFiremission", {_this call UO_FW_fnc_DIA_BracketFiremissionFireServer;}] call CBA_fnc_addEventHandler;
    ["CallPolarSpotting", {_this call UO_FW_fnc_DIA_PolarSpottingFiremissionFireServer;}] call CBA_fnc_addEventHandler;
    ["CallPointFiremission", {_this call UO_FW_fnc_DIA_PointFiremissionFireServer;}] call CBA_fnc_addEventHandler;
    ["CallPolarFiremission", {_this call UO_FW_fnc_DIA_PolarFiremissionFireServer;}] call CBA_fnc_addEventHandler;
    ["CallLineFiremission", {_this call UO_FW_fnc_DIA_LineFiremissionFireServer;}] call CBA_fnc_addEventHandler;
    ["CallGridSpottingFiremission", {_this call UO_FW_fnc_DIA_GridSpottingFiremissionFireServer;}] call CBA_fnc_addEventHandler;
    ["CallDonutFiremission", {_this call UO_FW_fnc_DIA_DonutFiremissionFireServer;}] call CBA_fnc_addEventHandler;
    ["CallMarkerFiremission", {_this call UO_FW_fnc_DIA_MarkerFiremissionFireServer;}] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;
