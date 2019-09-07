#define COMPONENT Respawn
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(CLIENT);

private ["_delay","_templateSettings","_teamRespawnMarker","_newSideSetting","_respawnType","_teamRespawnModule","_teamRespawnMarkerSides","_teamRespawnModuleSides"];
_teamRespawnModuleSides = [ [QEGVAR(Respawn,RespawnModuleMarker_Blufor),QEGVAR(Respawn,RespawnModuleInnerMarker_Blufor)],
                            [QEGVAR(Respawn,RespawnModuleMarker_Opfor),QEGVAR(Respawn,RespawnModuleInnerMarker_Opfor)],
                            [QEGVAR(Respawn,RespawnModuleMarker_Indfor),QEGVAR(Respawn,RespawnModuleInnerMarker_Indfor)],
                            [QEGVAR(Respawn,RespawnModuleMarker_Civ),QEGVAR(Respawn,RespawnModuleInnerMarker_Civ)]];
_teamRespawnMarkerSides = [QMGVAR(RESPAWN_BLUFOR),QMGVAR(RESPAWN_OPFOR),QMGVAR(RESPAWN_Indfor),QMGVAR(RESPAWN_Civ)];
switch (side player) do {
    case west: {
        private _respawnTypeNum = GETMVAR(Type_BLUFOR,0);
        _respawnType = ["ONELIFE","UNLIMITED","INDTICK","TEAMTICK"] select _respawnTypeNum;
        _delay = GETMVAR(Delay_BLUFOR,5);
        _templateSettings = GETMVAR(Templates_BLUFOR,[]);
        private _newSideValue = GETMVAR(NewTeam_BLUFOR,0);
        _newSideSetting = [blufor,opfor,independent,civilian] select _newSideValue;
        _teamRespawnMarker = _teamRespawnMarkerSides select _newSideValue;
        _teamRespawnModule = _teamRespawnModuleSides select _newSideValue;
    };
    case east: {
        private _respawnTypeNum = GETMVAR(Type_OPFOR,0);
        _respawnType = ["ONELIFE","UNLIMITED","INDTICK","TEAMTICK"] select _respawnTypeNum;
        _delay = GETMVAR(Delay_OPFOR,5);
        _templateSettings = GETMVAR(Templates_OPFOR,[]);
        private _newSideValue = GETMVAR(NewTeam_OPFOR,1);
        _newSideSetting = [blufor,opfor,independent,civilian] select _newSideValue;
        _teamRespawnMarker =_teamRespawnMarkerSides select _newSideValue;
        _teamRespawnModule = _teamRespawnModuleSides select _newSideValue;
    };
    case independent: {
        private _respawnTypeNum = GETMVAR(Type_Indfor,0);
        _respawnType = ["ONELIFE","UNLIMITED","INDTICK","TEAMTICK"] select _respawnTypeNum;
        _delay = GETMVAR(Delay_Indfor,5);
        _templateSettings = GETMVAR(Templates_Indfor,[]);
        private _newSideValue = GETMVAR(NewTeam_Indfor,2);
        _newSideSetting = [blufor,opfor,independent,civilian] select _newSideValue;
        _teamRespawnMarker =_teamRespawnMarkerSides select _newSideValue;
        _teamRespawnModule = _teamRespawnModuleSides select _newSideValue;
    };
    case civilian: {
        private _respawnTypeNum = GETMVAR(Type_Civ,0);
        _respawnType = ["ONELIFE","UNLIMITED","INDTICK","TEAMTICK"] select _respawnTypeNum;
        _delay = GETMVAR(Delay_Civ,5);
        _templateSettings = GETMVAR(Templates_Civ,[]);
        private _newSideValue = GETMVAR(NewTeam_Civ,3);
        _newSideSetting = [blufor,opfor,independent,civilian] select _newSideValue;
        _teamRespawnMarker = _teamRespawnMarkerSides select _newSideValue;
        _teamRespawnModule = _teamRespawnModuleSides select _newSideValue;
    };
};

// Reports Event & Function execution, confirm removed from queues.
if ((_respawnType isEqualto "INDTICK") || (_respawnType isEqualto "TEAMTICK") || (_respawnType isEqualto "UNLIMITED")) then {
    [{
        params ["_templateSettings","_teamRespawnMarker","_newSideSetting","_teamRespawnModule"];

        // Re call player init event
        [QEGVAR(Core,PlayerInitEvent), []] call CBA_fnc_localEvent;

        // Remove Killed Displays
        if (GETMVAR(InstantDeath,true)) then {
            (QEGVAR(Core,KilledLayer)) cutText ["","BLACK IN", 5];
            [QEGVAR(Core,DeathHearing), 0, false] call ace_common_fnc_setHearingCapability;
            0 fadeSound 1;
        } else {
            0 fadeSound 1;
            playSound ("Transition" + str (1 + floor random 3));
            [] call BIS_fnc_VRFadeIn;
        };

        // Handle Group Join
        if ((QEGVAR(RTemplatesS,JoinGroup)) in _templateSettings) then {
            private _oldGroup = EGETMVAR(Core,OLDGROUP,grpnull);
            [player] joinSilent _oldGroup;
            TRACE_1("Respawnside joingroup:",_newSideSetting);
        } else {
            if !(_newSideSetting == (side player)) then {
                [player] joinSilent (createGroup _newSideSetting);
                
            };
            TRACE_1("Respawnside:",_newSideSetting);
        };
        if !((markerShape  (_teamRespawnModule select 0)) isEqualTo "") then {
            private _rePos = (EGVAR(Core,SpawnPos));
            if !((markerShape  (_teamRespawnModule select 1)) isEqualTo "") then {
                _rePos = [[(_teamRespawnModule select 0)],[(_teamRespawnModule select 1)]] call BIS_fnc_randomPos;
            }
            else{
                _rePos = [[(_teamRespawnModule select 0),(_teamRespawnModule select 0)]] call BIS_fnc_randomPos;
            };
            if(_rePos select 0 == 0 ||_rePos select 1 == 0) then {
                [player,(EGVAR(Core,SpawnPos)),30] call CBA_fnc_setPos;
                FWDEBUG("Something went wrong with the respawn Module","Something went wrong with the respawn Module");
            } else {
                 [player,_rePos,10] call CBA_fnc_setPos;
            };
            TRACE_1("Respawn position",_rePos);
           

        } else {
            // Handle Teleport Locations
            if !(isNull (missionNamespace getVariable [_teamRespawnMarker, objNull])) then {
                [player,(getpos(missionNamespace getVariable _teamRespawnMarker)),10] call CBA_fnc_setPos;
            } else {
                [player,(EGVAR(Core,SpawnPos)),30] call CBA_fnc_setPos;
            };
        };
        

        // Handle Module and Gear Settings
        //CoverMap
        if ((QEGVAR(RTemplatesS,CoverMap)) in _templateSettings) then {
            [QEGVAR(CoverMap,InitEvent), []] call CBA_fnc_localEvent;
        };
        //SafeStart
        if ((QEGVAR(RTemplatesS,SafeStart)) in _templateSettings) then {
            [QEGVAR(SafeStart,Event), []] call CBA_fnc_localEvent;
        };
        //Team Colour
        if ((QEGVAR(RTemplatesS,TeamColour)) in _templateSettings) then {
            [QEGVAR(TeamColour,Event), []] call CBA_fnc_localEvent;
        };
        //Map and Compass Remover
        if ((QEGVAR(RTemplatesS,MapAndCompassRemover)) in _templateSettings) then {
            [QEGVAR(MapAndCompassRemover,PlayerEvent), []] call CBA_fnc_localEvent;
        };
        //Gear
        if ((QEGVAR(RTemplatesS,Gear)) in _templateSettings) then {
            [QEGVAR(Gear,PlayerGearLoad), []] call CBA_fnc_localEvent;
        };
        //Acre
        if ((QEGVAR(RTemplatesS,Acre)) in _templateSettings) then {
            [QEGVAR(Acre,AddRadio_Event), []] call CBA_fnc_localEvent;
        };
        //StartInParachute
        if ((QEGVAR(RTemplatesS,StartInParachute)) in _templateSettings) then {
            [QEGVAR(StartInParachute,LocalEvent), []] call CBA_fnc_localEvent;
        };

    }, [_templateSettings,_teamRespawnMarker,_newSideSetting,_teamRespawnModule], _delay] call CBA_fnc_waitAndExecute;
};