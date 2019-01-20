#define COMPONENT Firemission
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

["UO_FW_SettingsLoaded", {
	{
		if ((UO_FW_GETVAR(_x,ArtilleryFOAIEnabled,false))) then {
			private _guns = (UO_FW_GETVAR(_x,ArtilleryFOAIGuns,[]));
			private _accuracy = (UO_FW_GETVAR(_x,ArtilleryFOAIAccuracy,50));
			private _speed = (UO_FW_GETVAR(_x,ArtilleryFOAISpeed,50));
			[_x,_accuracy,_speed] call UO_FW_fnc_SetObserverSkill;
			private _guns = (UO_FW_GETVAR(_x,ArtilleryFOAIGuns,[]));
			private _knowledge = (UO_FW_GETVAR(_x,ArtilleryFOAIKnowledge,2));
			private _minRange = (UO_FW_GETVAR(_x,ArtilleryFOAIMinRange,300));
			private _viewRange = (UO_FW_GETVAR(_x,ArtilleryFOAIViewRange,1000));
			private _dispersion = (UO_FW_GETVAR(_x,ArtilleryFOAIDispersion,200));
			private _salvoCount = (UO_FW_GETVAR(_x,ArtilleryFOAISalvoCount,3));
			private _roundsPerSalvo = (UO_FW_GETVAR(_x,ArtilleryFOAIRoundsPerSalvo,5));
			private _salvoWaitTIme = (UO_FW_GETVAR(_x,ArtilleryFOAISalvoWaitTime,30));
			private _minSpot = (UO_FW_GETVAR(_x,ArtilleryFOAIMinSpottedDistance,150));
			private _index = (UO_FW_GETVAR(_x,ArtilleryFOAIRoundIndex,0));
			[_x,_guns,_knowledge,_minRange,_viewRange,_dispersion,_salvoCount,_roundsPerSalvo,_salvoWaitTIme,_minSpot,_index] call UO_FW_fnc_RegisterForwardObserver;
		};
	} forEach (allUnits select {!(isPlayer _x)});
	{
		if ((UO_FW_GETVAR(_x,ArtilleryEnabled,false))) then {
			private _artilleryFireRate = (UO_FW_GETVAR(_x,ArtilleryFireRate,1));
			private _artilleryAccuracy = (UO_FW_GETVAR(_x,ArtilleryAccuracy,50));
			private _artillerySpottingAccuracy = (UO_FW_GETVAR(_x,ArtillerySpottingAccuracy,50));
			private _artilleryAimTime = (UO_FW_GETVAR(_x,ArtilleryAimTime,20));
			private _artilleryCalculationTime = (UO_FW_GETVAR(_x,ArtilleryCalculationTime,30));
			private _artilleryCustomName = (UO_FW_GETVAR(_x,ArtilleryCustomName,""));
			private _artilleryUnlimitedAmmo = (UO_FW_GETVAR(_x,ArtilleryUnlimitedAmmo,false));
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
