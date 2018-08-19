#include "..\..\Global\defs.hpp"
#include "\x\UO_FW\addons\main\script_macros.hpp"

UO_FW_EXEC_CHECK(ALL)

if(isServer) then 
{

	{	
		

		_vehicle = vehicle _x;
		if((_vehicle getVariable ["UO_FW_ArtilleryEnabled",false])) then
		{
			_artilleryFireRate = _vehicle getVariable ["UO_FW_ArtilleryFireRate",1];
			_artilleryAccuracy = _vehicle getVariable ["UO_FW_ArtilleryAccuracy",50];
			_artillerySpottingAccuracy = _vehicle getVariable ["UO_FW_ArtillerySpottingAccuracy",50];
			_artilleryAimTime = _vehicle getVariable ["UO_FW_ArtilleryAimTime",20];
			_artilleryCalculationTime = _vehicle getVariable ["UO_FW_ArtilleryCalculationTime",30];
			_artilleryCustomName = _vehicle getVariable ["UO_FW_ArtilleryCustomName",""];
			_artilleryUnlimitedAmmo = _vehicle getVariable ["UO_FW_ArtilleryUnlimitedAmmo",1];
			[_vehicle,_artilleryFireRate,_artilleryAccuracy,_artillerySpottingAccuracy,_artilleryAimTime,_artilleryCalculationTime,_artilleryCustomName,_artilleryUnlimitedAmmo] call UO_FW_FNC_SetArtilleryData;
		};

		if((_x getVariable ["UO_FW_ArtilleryFOAIEnabled",false])) then
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
			_salvoCount = _x getVariable ["UO_FW_ArtilleryFOAISalvoCount",3];
			_roundsPerSalvo = _x getVariable ["UO_FW_ArtilleryFOAIRoundsPerSalvo",5];
			_salvoWaitTIme = _x getVariable ["UO_FW_ArtilleryFOAISalvoWaitTime",30];
			_minSpot = _x getVariable ["UO_FW_ArtilleryFOAIMinSpottedDistance",150];
			_index = _x getVariable ["UO_FW_ArtilleryFOAIRoundIndex",0];

			[_x,_guns,_knowledge,_minRange,_viewRange,_dispersion,_salvoCount,_roundsPerSalvo,_salvoWaitTIme,_minSpot,_index] call UO_FW_FNC_RegisterForwardObserver;
		};
		
		
	}forEach allUnits;

	_id = ["CallBracketFiremission", {_this call UO_FW_FNC_DIA_BracketFiremissionFireServer;}] call CBA_fnc_addEventHandler;
	_id = ["CallPolarSpotting", {_this call UO_FW_FNC_DIA_PolarSpottingFiremissionFireServer;}] call CBA_fnc_addEventHandler;
	_id = ["CallPointFiremission", {_this call UO_FW_FNC_DIA_PointFiremissionFireServer;}] call CBA_fnc_addEventHandler;
	_id = ["CallPolarFiremission", {_this call UO_FW_FNC_DIA_PolarFiremissionFireServer;}] call CBA_fnc_addEventHandler;
	_id = ["CallLineFiremission", {_this call UO_FW_FNC_DIA_LineFiremissionFireServer;}] call CBA_fnc_addEventHandler;
	_id = ["CallGridSpottingFiremission", {_this call UO_FW_FNC_DIA_GridSpottingFiremissionFireServer;}] call CBA_fnc_addEventHandler;
	_id = ["CallDonutFiremission", {_this call UO_FW_FNC_DIA_DonutFiremissionFireServer;}] call CBA_fnc_addEventHandler;
	_id = ["CallMarkerFiremission", {_this call UO_FW_FNC_DIA_MarkerFiremissionFireServer;}] call CBA_fnc_addEventHandler;
	_id = ["Event_ArtPlayerJipped", {_this call UO_FW_FNC_ArtMakePlayerObserverServer}] call CBA_fnc_addEventHandler;
};
//expected [paths aviable,units aviable,min ammount of Units spawned, max ammount of units spawned,max ammount of units in the field,delay from mission start,delay between spawns,should clean]
waitUntil{player == player};
_id = ["Event_ArtyReceiveHint", {hint _this;}] call CBA_fnc_addEventHandler;
_id = ["Event_ReceiveFoGuns", {_this call UO_FW_FNC_initPlayerFO;}] call CBA_fnc_addEventHandler;
if(player getVariable ["UO_FW_ArtilleryFOPlayerEnabled",false]) then
{
	private	_guns = [];
	{
		_tempUnit = missionNamespace getVariable [_x,objNull];
		if(isNull _tempUnit) then 
		{
			UO_FW_DEBUG("Firemission Module",format ["Firemission module:<br></br>Warning Unit ""%1"" does not exist.", _x]);
		};
		_guns pushBackUnique _tempUnit;
	}forEach (player getVariable ["UO_FW_ArtilleryFOPlayerGuns",[]]);
	private	_allowBracket = player getVariable ["UO_FW_ArtilleryFOPlayerAllowBracketFiremission",false];
	private	_allowDonut = player getVariable ["UO_FW_ArtilleryFOPlayerAllowDonutFiremission",false];
	private	_allowGridSpotting = player getVariable ["UO_FW_ArtilleryFOPlayerAllowGridspottingFiremission",false];
	private	_allowLine = player getVariable ["UO_FW_ArtilleryFOPlayerAllowLineFiremission",false];
	private	_allowMarker = player getVariable ["UO_FW_ArtilleryFOPlayerAllowMarkerFiremission",false];
	private	_allowPoint = player getVariable ["UO_FW_ArtilleryFOPlayerAllowPointFiremission",false];
	private	_allowPolar = player getVariable ["UO_FW_ArtilleryFOPlayerAllowPolarFiremission",false];
	private	_allowPolarspotting = player getVariable ["UO_FW_ArtilleryFOPlayerAllowPolarspottingFiremission",false];
	[_guns,_allowBracket,_allowDonut,_allowGridSpotting,_allowLine,_allowMarker,_allowPoint,_allowPolar,_allowPolarspotting] call UO_FW_FNC_initPlayerFO;
};
