#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

LOG("Server Pre Init");

["UO_FW_TeamsInitEvent", {
    UO_FW_Teams = [];
    {
        params ["_side","_namevar","_teamType"];
        switch (_teamType) do {
            case 0: {
                [_side,_namevar,"player"] call UO_FW_fnc_AddTeam;
            };
            case 1: {
                [_side,_namevar,"ai"] call UO_FW_fnc_AddTeam;
            };
            case 2: {
                [_side,_namevar,"both"] call UO_FW_fnc_AddTeam;
            };
            default {
                [_side,_namevar,"both"] call UO_FW_fnc_AddTeam;
            };
        };
    } foreach [[west,UO_FW_TeamSetting_Blufor_TeamName,UO_FW_TeamSetting_Blufor_TeamType],[east,UO_FW_TeamSetting_Opfor_TeamName,UO_FW_TeamSetting_Opfor_TeamType],[independent,UO_FW_TeamSetting_Indfor_TeamName,UO_FW_TeamSetting_Indfor_TeamType],[civilian,UO_FW_TeamSetting_Civ_TeamName,UO_FW_TeamSetting_Civ_TeamType]];
}] call CBA_fnc_addEventHandler;

["UO_FW_PlayerSpawned", {
    _this call UO_FW_fnc_EventPlayerSpawned;
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

["UO_FW_Track_Event", {
    params ["_unit"];
    if (!(_unit getVariable ["UO_FW_Tracked", false])) then {
        _unit setVariable ["UO_FW_Side", side _unit];
        _unit setVariable ["UO_FW_Tracked", true];
        _unit call UO_FW_fnc_EventSpawned;
    };
}] call CBA_fnc_addEventHandler;

["UO_FW_NotTrack_Event", {
    params ["_unit"];
    _unit setVariable ["UO_FW_DontTrack", true];
}] call CBA_fnc_addEventHandler;

["UO_FW_UnTrack_Event", {
    params ["_unit"];
    if (_unit getVariable ["UO_FW_Tracked", false]) then {
        {
            _x params ["", "_side", "_Type", "_total", "_current"];
            if ((_unit getVariable "UO_FW_Side" isEqualto _side) && {((_Type == "player" && isPlayer _unit) || (_Type == "ai" && !(isPlayer _unit)) || (_Type == "both"))}) exitWith {
                if (_unit call UO_FW_fnc_Alive) then {
                    _x set [3, _total - 1];
                    _x set [4, _current - 1];
                };
            };
        } forEach UO_FW_Teams;
        _unit setVariable ["UO_FW_Side", nil];
        _unit setVariable ["UO_FW_Tracked", nil];
    };
}] call CBA_fnc_addEventHandler;

["UO_FW_Track_AllUnitsEvent", {
    {
        if (!(_x getVariable ["UO_FW_DontTrack", false])) then {
            _x call UO_FW_fnc_TrackUnit;
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
