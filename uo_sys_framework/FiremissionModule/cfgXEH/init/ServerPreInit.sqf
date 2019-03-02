#define COMPONENT Firemission
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

["UO_FW_SettingsLoaded", {
    {
        if ((GETVARUO(_x,ArtilleryFOAIEnabled,false))) then {
            private _guns = (GETVARUO(_x,ArtilleryFOAIGuns,[]));
            private _accuracy = (GETVARUO(_x,ArtilleryFOAIAccuracy,50));
            private _speed = (GETVARUO(_x,ArtilleryFOAISpeed,50));
            [_x,_accuracy,_speed] call UO_FW_fnc_SetObserverSkill;
            private _guns = (GETVARUO(_x,ArtilleryFOAIGuns,[]));
            private _knowledge = (GETVARUO(_x,ArtilleryFOAIKnowledge,2));
            private _minRange = (GETVARUO(_x,ArtilleryFOAIMinRange,300));
            private _viewRange = (GETVARUO(_x,ArtilleryFOAIViewRange,1000));
            private _dispersion = (GETVARUO(_x,ArtilleryFOAIDispersion,200));
            private _salvoCount = (GETVARUO(_x,ArtilleryFOAISalvoCount,3));
            private _roundsPerSalvo = (GETVARUO(_x,ArtilleryFOAIRoundsPerSalvo,5));
            private _salvoWaitTIme = (GETVARUO(_x,ArtilleryFOAISalvoWaitTime,30));
            private _minSpot = (GETVARUO(_x,ArtilleryFOAIMinSpottedDistance,150));
            private _index = (GETVARUO(_x,ArtilleryFOAIRoundIndex,0));
            [_x,_guns,_knowledge,_minRange,_viewRange,_dispersion,_salvoCount,_roundsPerSalvo,_salvoWaitTIme,_minSpot,_index] call UO_FW_fnc_RegisterForwardObserver;
        };
    } forEach (allUnits select {!(isPlayer _x)});
    {
        if ((GETVARUO(_x,ArtilleryEnabled,false))) then {
            private _artilleryFireRate = (GETVARUO(_x,ArtilleryFireRate,1));
            private _artilleryAccuracy = (GETVARUO(_x,ArtilleryAccuracy,50));
            private _artillerySpottingAccuracy = (GETVARUO(_x,ArtillerySpottingAccuracy,50));
            private _artilleryAimTime = (GETVARUO(_x,ArtilleryAimTime,20));
            private _artilleryCalculationTime = (GETVARUO(_x,ArtilleryCalculationTime,30));
            private _artilleryCustomName = (GETVARUO(_x,ArtilleryCustomName,""));
            private _artilleryUnlimitedAmmo = (GETVARUO(_x,ArtilleryUnlimitedAmmo,false));
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
