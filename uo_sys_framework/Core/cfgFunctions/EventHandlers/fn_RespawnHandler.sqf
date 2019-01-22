#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

//_thisID _thisArgs
_this params ["_unit", "_corpse"];

UO_FW_SETPLPVAR(Body,_corpse);

//handle respawn delays, Rsc, gear & module settings, location, etc
private ["_respawnTypeNum"];

switch (side player) do {
    case west: {
        _respawnTypeNum = UO_FW_GETMVAR(RespawnSetting_Type_BLUFOR,0);
    };
    case east: {
        _respawnTypeNum = UO_FW_GETMVAR(RespawnSetting_Type_OPFOR,0);
    };
    case independent: {
        _respawnTypeNum = UO_FW_GETMVAR(RespawnSetting_Type_INDFOR,0);
    };
    case civilian: {
        _respawnTypeNum = UO_FW_GETMVAR(RespawnSetting_Type_CIV,0);
    };
};

private _respawnType = ["ONELIFE","UNLIMITED","INDTICK","TEAMTICK"] select _respawnTypeNum;

switch (_respawnType) do {
    case "ONELIFE": {
        ["UO_FW_Specator_StartSpectate_Event", []] call CBA_fnc_localEvent;
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
        ["UO_FW_Specator_StartSpectate_Event", []] call CBA_fnc_localEvent;
    };
};
