#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(SERVER);

LOG("Server Pre Init");

["UO_FW_TeamsInitEvent", {
    EGVAR(Core,Teams) = [];
    {
        _x params ["_side","_namevar","_teamTypeNum"];
        private _teamType = ["player","ai","both"] select _teamTypeNum;
        [_side,_namevar,_teamType] call FUNC(AddTeam);
        _side call FUNC(CreateRespawnMarker);
        createCenter _side;
    } foreach [[west,GVAR(TeamName_Blufor),GVAR(TeamType_Blufor)],[east,GVAR(TeamName_Opfor),GVAR(TeamType_Opfor)],[independent,GVAR(TeamName_Indfor),GVAR(TeamType_Indfor)],[civilian,GVAR(TeamName_Civilian),GVAR(TeamType_Civilian)]];
}] call CBA_fnc_addEventHandler;

["UO_FW_PlayerSpawned", {
    _this call FUNC(EventPlayerSpawned);
}] call CBA_fnc_addEventHandler;

["UO_FW_JIP_ServerEvent", {
    params ["_unit"];
}] call CBA_fnc_addEventHandler;

["UO_FW_TrackAsset_Event", {
    params [["_asset", objNull, [objNull]],["_name", "", [""]],["_team", "", [""]]];
    private _asset = vehicle (_asset);
    _asset setVariable ["UO_FW_AssetName", _name];
    _asset setVariable ["UO_FW_AssetTeam", _team];
}] call CBA_fnc_addEventHandler;

["UO_FW_Respawned_Event", {
    LOG_1("started UO_FW_Respawned_Event with %1",_this);
    _this call FUNC(EventRespawned);
}] call CBA_fnc_addEventHandler;

["UO_FW_Killed_Event", {
    LOG_1("started UO_FW_Killed_Event with %1",_this);
    _this call FUNC(EventKilled);
}] call CBA_fnc_addEventHandler;

["UO_FW_Spawned_Event", {
    LOG_1("started UO_FW_Spawned_Event with %1",_this);
    _this call FUNC(EventSpawned);
}] call CBA_fnc_addEventHandler;

["UO_FW_Track_Event", {
    params ["_unit"];
    if !(GETVAR(_unit,Tracked,false)) then {
        SETPVAR(_unit,Side,(side _unit));
        SETPVAR(_unit,Tracked,true);
    };
}] call CBA_fnc_addEventHandler;

["UO_FW_DontTrack_Event", {
    params ["_unit"];
    _unit setVariable ["UO_FW_DontTrack", true];
}] call CBA_fnc_addEventHandler;

["UO_FW_UnTrack_Event", {
    params ["_unit"];
    if (GETVAR(_unit,Tracked,false)) then {
        {
            _x params ["", "_side", "_Type", "_total", "_current"];
            if ((_unit getVariable "UO_FW_Side" isEqualto _side) && {((_Type == "player" && isPlayer _unit) || (_Type == "ai" && !(isPlayer _unit)) || (_Type == "both"))}) exitWith {
                if (_unit call FUNC(Alive)) then {
                    _x set [3, _total - 1];
                    _x set [4, _current - 1];
                };
            };
        } forEach EGVAR(Core,Teams);
        SETPVAR(_unit,Side,nil);
        SETPVAR(_unit,Tracked,nil);
    };
}] call CBA_fnc_addEventHandler;

["UO_FW_Track_AllUnitsEvent", {
    {
        if (!(_x getVariable ["UO_FW_DontTrack", false])) then {
            _x call FUNC(TrackUnit);
        };
    } foreach allUnits;
}] call CBA_fnc_addEventHandler;

["UO_FW_RecievePlayerVarRequest", {
    params ["_object","_clientID"];
    LOG_1("Var Request _object: %1",_object);
    LOG_1("Var Request _clientID: %1",_clientID);
    private _allUOVars = (allVariables _object) select {!((toLower(str _x)) find "uo_fw_" isEqualto -1)};
    private _varArray = [];
    {
        private _varstring = _x;
        private _value = _object getVariable _varstring;
        _varArray pushback [_varstring,_value];
    } foreach _allUOVars;
    LOG_1("Var Request Array: %1",_varArray);
    ["UO_FW_RecievePlayerVars", [_object,_varArray], _object] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;

["UO_FW_PlayerRespawn_RequestTicketEvent", {
    params ["_unit","_ticketType"];
    LOG_2("RequestTicketEvent",_unit,_ticketType);
    switch (_ticketType) do {
        case "IND": {
            //Individual Tickets
            if ((GETVAR(_unit,IndTicketsRemaining,"")) isEqualTo "") then {
                switch (side _unit) do {
                    case west: {
                        SETVAR(_unit,IndTicketsRemaining,GVAR(IndTickets_Blufor));
                    };
                    case east: {
                        SETVAR(_unit,IndTicketsRemaining,GVAR(IndTickets_Blufor));
                    };
                    case independent: {
                        SETVAR(_unit,IndTicketsRemaining,GVAR(IndTickets_Blufor));
                    };
                    case civilian: {
                        SETVAR(_unit,IndTicketsRemaining,GVAR(IndTickets_Blufor));
                    };
                };
            };
            private _indTicketsRemaining = (GETVAR(_unit,IndTicketsRemaining,0));
            LOG_1("_indTicketsRemaining: %1",_indTicketsRemaining);
            if (_indTicketsRemaining > 0) then {
                DEC(_indTicketsRemaining);
                SETVAR(_unit,IndTicketsRemaining,_indTicketsRemaining);
                ["UO_FW_PlayerRespawn_RecieveTicketEvent", [_unit,true,"IND",_indTicketsRemaining], [_unit]] call CBA_fnc_targetEvent;
            } else {
                ["UO_FW_PlayerRespawn_RecieveTicketEvent", [_unit,false,"IND",_indTicketsRemaining], [_unit]] call CBA_fnc_targetEvent;
            };
        };
        case "TEAM": {
            //Team Tickets
            switch (side _unit) do {
                case west: {
                    private _ticketsRemaining = EGETMVAR(Respawn,TeamTicketsRemaining_Blufor,30);
                    if (_ticketsRemaining > 0) then {
                        DEC(_ticketsRemaining);
                        ESETMVAR(Respawn,TeamTicketsRemaining_Blufor,_ticketsRemaining);
                        ["UO_FW_PlayerRespawn_RecieveTicketEvent", [_unit,true,"TEAM",_ticketsRemaining], [_unit]] call CBA_fnc_targetEvent;
                    } else {
                        ["UO_FW_PlayerRespawn_RecieveTicketEvent", [_unit,false,"TEAM",_ticketsRemaining], [_unit]] call CBA_fnc_targetEvent;
                    };
                };
                case east: {
                    private _ticketsRemaining = EGETMVAR(Respawn,TeamTicketsRemaining_Opfor,30);
                    if (_ticketsRemaining > 0) then {
                        DEC(_ticketsRemaining);
                        ESETMVAR(Respawn,TeamTicketsRemaining_Opfor,_ticketsRemaining);
                        ["UO_FW_PlayerRespawn_RecieveTicketEvent", [_unit,true,"TEAM",_ticketsRemaining], [_unit]] call CBA_fnc_targetEvent;
                    } else {
                        ["UO_FW_PlayerRespawn_RecieveTicketEvent", [_unit,false,"TEAM",_ticketsRemaining], [_unit]] call CBA_fnc_targetEvent;
                    };
                };
                case independent: {
                    private _ticketsRemaining = EGETMVAR(Respawn,TeamTicketsRemaining_Indfor,30);
                    if (_ticketsRemaining > 0) then {
                        DEC(_ticketsRemaining);
                        ESETMVAR(Respawn,TeamTicketsRemaining_Indfor,_ticketsRemaining);
                        ["UO_FW_PlayerRespawn_RecieveTicketEvent", [_unit,true,"TEAM",_ticketsRemaining], [_unit]] call CBA_fnc_targetEvent;
                    } else {
                        ["UO_FW_PlayerRespawn_RecieveTicketEvent", [_unit,false,"TEAM",_ticketsRemaining], [_unit]] call CBA_fnc_targetEvent;
                    };
                };
                case civilian: {
                    private _ticketsRemaining = EGETMVAR(Respawn,TeamTicketsRemaining_Civilian,30);
                    if (_ticketsRemaining > 0) then {
                        DEC(_ticketsRemaining);
                        ESETMVAR(Respawn,TeamTicketsRemaining_Civilian,_ticketsRemaining);
                        ["UO_FW_PlayerRespawn_RecieveTicketEvent", [_unit,true,"TEAM",_ticketsRemaining], [_unit]] call CBA_fnc_targetEvent;
                    } else {
                        ["UO_FW_PlayerRespawn_RecieveTicketEvent", [_unit,false,"TEAM",_ticketsRemaining], [_unit]] call CBA_fnc_targetEvent;
                    };
                };
                default {};
            };
        };
    };
}] call CBA_fnc_addEventHandler;

["UO_FW_PlayerRespawn_AddToQueueEvent", {
    params ["_unit","_side","_timeadded","_gearclass","_originalGroup","_isLeader"];
}] call CBA_fnc_addEventHandler;

["UO_FW_TeamsInitEvent", []] call CBA_fnc_localEvent;
