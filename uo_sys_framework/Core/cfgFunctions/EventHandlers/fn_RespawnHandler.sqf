#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(CLIENT);

//_thisID _thisArgs
_this params ["_unit", "_corpse"];

SETPLPVAR(Body,_corpse);

//handle respawn delays, Rsc, gear & module settings, location, etc
private ["_respawnType"];

switch (side player) do {
    case west: {
        private _respawnTypeNum = MGETMVAR(Respawn_Type_BLUFOR,0);
        _respawnType = ["ONELIFE","UNLIMITED","INDTICK","TEAMTICK"] select _respawnTypeNum;
    };
    case east: {
        private _respawnTypeNum = MGETMVAR(Respawn_Type_OPFOR,0);
        _respawnType = ["ONELIFE","UNLIMITED","INDTICK","TEAMTICK"] select _respawnTypeNum;
    };
    case independent: {
        private _respawnTypeNum = MGETMVAR(Respawn_Type_Indfor,0);
        _respawnType = ["ONELIFE","UNLIMITED","INDTICK","TEAMTICK"] select _respawnTypeNum;
    };
    case civilian: {
        private _respawnTypeNum = MGETMVAR(Respawn_Type_Civ,0);
        _respawnType = ["ONELIFE","UNLIMITED","INDTICK","TEAMTICK"] select _respawnTypeNum;
    };
};

LOG_1("_respawnType: %1",_respawnType);

switch (_respawnType) do {
    case "ONELIFE": {
        [QEGVAR(Spectator,StartSpectateEvent), []] call CBA_fnc_localEvent;
    };
    case "UNLIMITED": {
        [QEGVAR(Core,PlayerRespawnEvent), []] call CBA_fnc_localEvent;
    };
    case "INDTICK": {
        [QEGVAR(Core,PlayerRespawnRequestTicketEvent), [player,"IND"]] call CBA_fnc_serverEvent;
    };
    case "TEAMTICK": {
        [QEGVAR(Core,PlayerRespawnRequestTicketEvent), [player,"TEAM"]] call CBA_fnc_serverEvent;
    };
    default {
        [QEGVAR(Spectator,StartSpectateEvent), []] call CBA_fnc_localEvent;
    };
};
