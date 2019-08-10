/*#include "..\..\Global\defs.hpp"
#include "\x\UO_FW\addons\Main\script_macros.hpp"

if !(UO_FW_Server_FireMissionModule_Allowed) exitwith {};

if (isServer) then {
    {
        if ((_x getVariable ["UO_FW_ArtilleryFOAIEnabled",false])) then {
            private _guns = _x getVariable ["UO_FW_ArtilleryFOAIGuns",[]];
            private _accuracy = _x getVariable ["UO_FW_ArtilleryFOAIAccuracy",50];
            private _speed = _x getVariable ["UO_FW_ArtilleryFOAISpeed",50];
            [_x,_accuracy,_speed] call EFUNC(Firemission,SetObserverSkill);

            private _guns = _x getVariable ["UO_FW_ArtilleryFOAIGuns",[]];
            private _knowledge = _x getVariable ["UO_FW_ArtilleryFOAIKnowledge",2];
            private _minRange = _x getVariable ["UO_FW_ArtilleryFOAIMinRange",300];
            private _viewRange = _x getVariable ["UO_FW_ArtilleryFOAIViewRange",1000];
            private _dispersion = _x getVariable ["UO_FW_ArtilleryFOAIDispersion",200];
            private _salvoCount = _x getVariable ["UO_FW_ArtilleryFOAISalvoCount",3];
            private _roundsPerSalvo = _x getVariable ["UO_FW_ArtilleryFOAIRoundsPerSalvo",5];
            private _salvoWaitTIme = _x getVariable ["UO_FW_ArtilleryFOAISalvoWaitTime",30];
            private _minSpot = _x getVariable ["UO_FW_ArtilleryFOAIMinSpottedDistance",150];
            private _index = _x getVariable ["UO_FW_ArtilleryFOAIRoundClassName",0];

            [_x,_guns,_knowledge,_minRange,_viewRange,_dispersion,_salvoCount,_roundsPerSalvo,_salvoWaitTIme,_minSpot,_index] call EFUNC(Firemission,RegisterForwardObserver);
        };
    } forEach allUnits;
    {
        if ((_x getVariable ["UO_FW_ArtilleryEnabled",false])) then {
            private _artilleryFireRate = _x getVariable ["UO_FW_ArtilleryFireRate",1];
            private _artilleryAccuracy = _x getVariable ["UO_FW_ArtilleryAccuracy",50];
            private _artillerySpottingAccuracy = _x getVariable ["UO_FW_ArtillerySpottingAccuracy",50];
            private _artilleryAimTime = _x getVariable ["UO_FW_ArtilleryAimTime",20];
            private _artilleryCalculationTime = _x getVariable ["UO_FW_ArtilleryCalculationTime",30];
            private _artilleryCustomName = _x getVariable ["UO_FW_ArtilleryCustomName",""];
            private _artilleryUnlimitedAmmo = _x getVariable ["UO_FW_ArtilleryUnlimitedAmmo",false];
            [_x,_artilleryFireRate,_artilleryAccuracy,_artillerySpottingAccuracy,_artilleryAimTime,_artilleryCalculationTime,_artilleryCustomName,_artilleryUnlimitedAmmo] call EFUNC(Firemission,SetArtilleryData);
        };
    } forEach vehicles;
    [QEGVAR(Firemission,CallCallBracketFiremission), {_this call EFUNC(BracketFiremission,BracketFiremissionFireServer);}] call CBA_fnc_addEventHandler;
    ["CallPolarSpotting", {_this call EFUNC(PolarSpottingFiremission,PolarSpottingFiremissionFireServer);}] call CBA_fnc_addEventHandler;
    ["CallPointFiremission", {_this call EFUNC(PointFiremission,PointFiremissionFireServer);}] call CBA_fnc_addEventHandler;
    ["CallPolarFiremission", {_this call EFUNC(PolarFiremission,PolarFiremissionFireServer);}] call CBA_fnc_addEventHandler;
    ["CallLineFiremission", {_this call EFUNC(LineFiremission,LineFiremissionFireServer);}] call CBA_fnc_addEventHandler;
    ["CallGridSpottingFiremission", {_this call EFUNC(GridSpottingFiremission,GridSpottingFiremissionFireServer);}] call CBA_fnc_addEventHandler;
    ["CallDonutFiremission", {_this call EFUNC(DonutFiremission,DonutFiremissionFireServer);}] call CBA_fnc_addEventHandler;
    ["CallMarkerFiremission", {_this call EFUNC(MarkerFiremission,MarkerFiremissionFireServer);}] call CBA_fnc_addEventHandler;
    ["Event_ArtPlayerJipped", {_this call EFUNC(Firemission,ArtMakePlayerObserverServer);}] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
    [{!isNull player}, {
        ["Event_ArtyReceiveHint", {hint _this;}] call CBA_fnc_addEventHandler;
        ["Event_ReceiveFoGuns", {_this call EFUNC(Firemission,initPlayerFO);}] call CBA_fnc_addEventHandler;
        if (player getVariable ["UO_FW_ArtilleryFOPlayerEnabled",false]) then {
            private _guns = [];
            {
                private _tempUnit = missionNamespace getVariable [_x,objNull];
                if (isNull _tempUnit) then {
                    private _msg = format ["Firemission module:<br></br>Warning Unit ""%1"" does not exist.", _x];
                    FWDEBUG("Firemission Module",_msg);
                };
                _guns pushBackUnique _tempUnit;
            } forEach (player getVariable ["UO_FW_ArtilleryFOPlayerGuns",[]]);
            private _allowBracket = player getVariable ["UO_FW_ArtilleryFOPlayerAllowBracketFiremission",false];
            private _allowDonut = player getVariable ["UO_FW_ArtilleryFOPlayerAllowDonutFiremission",false];
            private _allowGridSpotting = player getVariable ["UO_FW_ArtilleryFOPlayerAllowGridspottingFiremission",false];
            private _allowLine = player getVariable ["UO_FW_ArtilleryFOPlayerAllowLineFiremission",false];
            private _allowMarker = player getVariable ["UO_FW_ArtilleryFOPlayerAllowMarkerFiremission",false];
            private _allowPoint = player getVariable ["UO_FW_ArtilleryFOPlayerAllowPointFiremission",false];
            private _allowPolar = player getVariable ["UO_FW_ArtilleryFOPlayerAllowPolarFiremission",false];
            private _allowPolarspotting = player getVariable ["UO_FW_ArtilleryFOPlayerAllowPolarspottingFiremission",false];
            [_guns,_allowBracket,_allowDonut,_allowGridSpotting,_allowLine,_allowMarker,_allowPoint,_allowPolar,_allowPolarspotting] call EFUNC(Firemission,initPlayerFO);
        };
    }] call CBA_fnc_waitUntilAndExecute;
};
*/