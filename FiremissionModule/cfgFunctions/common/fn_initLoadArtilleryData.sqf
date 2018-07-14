#include "..\..\Global\defs.hpp"
#include "\x\UO_FW\addons\main\script_macros.hpp"


if(isServer) then 
{
	{	
		if((_x getVariable ["UO_FW_ArtilleryEnabled",false])) exitWith
		{
			_artilleryFireRate = _x getVariable ["UO_FW_ArtilleryFireRate",1];
			_artilleryAccuracy = _x getVariable ["UO_FW_ArtilleryAccuracy",50];
			_artillerySpottingAccuracy = _x getVariable ["UO_FW_ArtillerySpottingAccuracy",50];
			_artilleryAimTime = _x getVariable ["UO_FW_ArtilleryAimTime",20];
			_artilleryCalculationTime = _x getVariable ["UO_FW_ArtilleryCalculationTime",30];
			_artilleryCustomName = _x getVariable ["UO_FW_ArtilleryCustomName",1];
			_artilleryUnlimitedAmmo = _x getVariable ["UO_FW_ArtilleryUnlimitedAmmo",1];
			[_x,_artilleryFireRate,_artilleryAccuracy,_artillerySpottingAccuracy,_artilleryAimTime,_artilleryCalculationTime,_artilleryCustomName,_artilleryUnlimitedAmmo] call UO_FW_FNC_SetArtilleryData;
		};


		if((_x getVariable ["UO_FW_ArtilleryFOAIEnabled",false])) exitWith
		{
			_guns = _x getVariable ["UO_FW_ArtilleryFOAIGuns",[]];
			_accuracy = _x getVariable ["UO_FW_ArtilleryFOAIAccuracy",50];
			_speed = _x getVariable ["UO_FW_ArtilleryFOAISpeed",50];
			[_x,_accuracy,_speed] call UO_FW_FNC_SetObserverSkill;

			_guns = _x getVariable ["UO_FW_ArtilleryFOAIGuns",[]];
			_knowledge = _x getVariable ["UO_FW_ArtilleryFOAIKnowledge",2];
			_minRange = _x getVariable ["UO_FW_ArtilleryFOAIMinRange",300];
			_viewRange = _x getVariable ["UO_FW_ArtilleryFOAIViewRange",1000];
			_dispersion = _x getVariable ["UO_FW_ArtilleryFOAIDispersion",200];
			_burstCount = _x getVariable ["UO_FW_ArtilleryFOAIBurstCount",3];
			_roundsPerBurst = _x getVariable ["UO_FW_ArtilleryFOAIRoundsPerBurst",5];
			_burstWaitTIme = _x getVariable ["UO_FW_ArtilleryFOAIBurstWaitTime",30];
			_minSpot = _x getVariable ["UO_FW_ArtilleryFOAIMinSpottedDistance",150];
			_index = _x getVariable ["UO_FW_ArtilleryFOAIRoundIndex",0];

			[_x,_guns,_knowledge,_minRange,_viewRange,_dispersion,_burstCount,_roundsPerBurst,_burstWaitTIme,_minSpot,_index] call UO_FW_FNC_RegisterForwardObserver;
		};
		
		
	}forEach allUnits;

	_id = ["CallBracketFiremission", {_this call UO_FW_FNC_DIA_BracketFiremissionFireServer;}] call CBA_fnc_addEventHandler;
	_id = ["CallPolarSpotting", {_this call UO_FW_FNC_DIA_Server_PolarSpottingFiremissionFire;}] call CBA_fnc_addEventHandler;
	_id = ["CallPointFiremission", {_this call UO_FW_FNC_DIA_Server_PointFiremissionFire;}] call CBA_fnc_addEventHandler;
	_id = ["CallPolarFiremission", {_this call UO_FW_FNC_DIA_Server_PolarFiremissionFire;}] call CBA_fnc_addEventHandler;
	_id = ["CallLineFiremission", {_this call UO_FW_FNC_DIA_Server_LineFiremissionFire;}] call CBA_fnc_addEventHandler;
	_id = ["CallGridSpottingFiremission", {_this call UO_FW_FNC_DIA_Server_GridSpottingFiremissionFire;}] call CBA_fnc_addEventHandler;
	_id = ["CallDonutFiremission", {_this call UO_FW_FNC_DIA_Server_DonutFiremissionFire;}] call CBA_fnc_addEventHandler;
	_id = ["CallMarkerFiremission", {_this call UO_FW_FNC_DIA_Server_MarkerFiremissionFire;}] call CBA_fnc_addEventHandler;
	_id = ["Event_ArtPlayerJipped", {_this call UO_FW_FNC_ArtMakePlayerObserverServer}] call CBA_fnc_addEventHandler;
};
//expected [paths aviable,units aviable,min ammount of Units spawned, max ammount of units spawned,max ammount of units in the field,delay from mission start,delay between spawns,should clean]
waitUntil{player == player};
_id = ["Event_ArtyReceiveHint", {hint _this;}] call CBA_fnc_addEventHandler;
_id = ["Event_ReceiveFoGuns", {_this call UO_FW_FNC_initPlayerFO;}] call CBA_fnc_addEventHandler;
if(player getVariable [UO_FW_ArtilleryFOPlayerEnabled,false]) then
{
	private	_allowBracket = player getVariable [UO_FW_ArtilleryFOPlayerAllowBracketFiremission,false];
	private	_allowDonut = player getVariable [UO_FW_ArtilleryFOPlayerAllowDonutFiremission,false];
	private	_allowGridSpotting = player getVariable [UO_FW_ArtilleryFOPlayerAllowGridspottingFiremission,false];
	private	_allowLine = player getVariable [UO_FW_ArtilleryFOPlayerAllowLineFiremission,false];
	private	_allowMarker = player getVariable [UO_FW_ArtilleryFOPlayerAllowMarkerFiremission,false];
	private	_allowPoint = player getVariable [UO_FW_ArtilleryFOPlayerAllowPointFiremission,false];
	private	_allowPolar = player getVariable [UO_FW_ArtilleryFOPlayerAllowPolarFiremission,false];
	private	_allowPolarspotting = player getVariable [UO_FW_ArtilleryFOPlayerAllowPolarspottingFiremission,false];
	[player,_allowBracket,_allowDonut,_allowGridSpotting,_allowLine,_allowMarker,_allowPoint,_allowPolar,_allowPolarspotting] call UO_FW_fnc_ArtMakePlayerObserver;
};
