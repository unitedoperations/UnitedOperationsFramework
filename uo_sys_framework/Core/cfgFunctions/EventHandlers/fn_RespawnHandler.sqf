#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

//_thisID _thisArgs
_this params ["_unit", "_corpse"];
private ["_respawnTypeNum"];

UO_FW_SETPLPVAR(Body,_corpse);

//handle respawn delays, Rsc, gear & module settings, location, etc
switch (side player) do {
    case west: {
        _respawnTypeNum = UO_FW_GETMVAR(ActiveRespawnSystem_Blufor,0);
    };
    case east: {
        _respawnTypeNum = UO_FW_GETMVAR(ActiveRespawnSystem_Opfor,0);
    };
    case independent: {
        _respawnTypeNum = UO_FW_GETMVAR(ActiveRespawnSystem_Indfor,0);
    };
    case civilian: {
        _respawnTypeNum = UO_FW_GETMVAR(ActiveRespawnSystem_Civilain,0);
    };
    default {
        _respawnTypeNum = 0;
    };
};
//private _respawnSystemTypeArray = [['None',0],['Unlimited',1],['Individual Tickets',2],['Team Tickets',3],['Wave',4],['Triggered',5]];
private _respawnType = ["ONELIFE","UNLIMITED","INDTICK","TEAMTICK"] select _respawnTypeNum;

switch (_respawnType) do {
    case "ONELIFE": {
        if !(UO_FW_GETPLVAR(Spectating,false)) then {
            ["UO_FW_Specator_StartSpectate_Event", []] call CBA_fnc_localEvent;
        };
    };
    case "UNLIMITED": {
        ["UO_FW_PlayerRespawn_Event", []] call CBA_fnc_localEvent;
    };
    case "INDTICK": {
        ["UO_FW_PlayerRespawn_RequestTicketEvent", [player,"IND"]] call CBA_fnc_serverEvent;
    };
    case "TEAMTICK": {
        ["UO_FW_PlayerRespawn_RequestTicketEvent", [player,"TEAM"]] call CBA_fnc_serverEvent;
    };
    default {
        if !(UO_FW_GETPLVAR(Spectating,false)) then {
            ["UO_FW_Specator_StartSpectate_Event", []] call CBA_fnc_localEvent;
        };
    };
};
