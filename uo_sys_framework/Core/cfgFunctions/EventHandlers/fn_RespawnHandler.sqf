#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

//_thisID _thisArgs
_this params ["_unit", "_corpse"];

UO_FW_SETPLPVAR(Body,_corpse);
UO_FW_SETMVAR(GearReady,false);

//handle respawn delays, Rsc, gear & module settings, location, etc
private ["_respawnType"];

switch (side player) do {
    case west: {
        private _respawnTypeNum = UO_FW_GETMVAR(RespawnSetting_Type_BLUFOR,0);
        _respawnType = ["ONELIFE","UNLIMITED","INDTICK","TEAMTICK"] select _respawnTypeNum;
    };
    case east: {
        private _respawnTypeNum = UO_FW_GETMVAR(RespawnSetting_Type_OPFOR,0);
        _respawnType = ["ONELIFE","UNLIMITED","INDTICK","TEAMTICK"] select _respawnTypeNum;
    };
    case independent: {
        private _respawnTypeNum = UO_FW_GETMVAR(RespawnSetting_Type_INDFOR,0);
        _respawnType = ["ONELIFE","UNLIMITED","INDTICK","TEAMTICK"] select _respawnTypeNum;
    };
    case civilian: {
        private _respawnTypeNum = UO_FW_GETMVAR(RespawnSetting_Type_CIV,0);
        _respawnType = ["ONELIFE","UNLIMITED","INDTICK","TEAMTICK"] select _respawnTypeNum;
    };
};

LOG_1("_respawnType: %1",_respawnType);

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
