#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

LOG("Client Pre Init");

["UO_FW_RecievePlayerVars", {
    params ["_playerUnit","_varArray"];
    LOG_1("Var Recieve _playerUnit: %1",_playerUnit);
    LOG_1("Var Recieve _varArray: %1",_varArray);
    if !(local _playerUnit) exitwith {};
    {
        _x params ["_propertyName","_value"];
        player setvariable [_propertyName,_value];
    } foreach _varArray;
    ["UO_FW_SettingsLoaded", []] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

["UO_FW_RegisterModuleEvent", {
    if !(hasInterface) exitwith {};
    params ["_name", "_description", "_author"];
    [{!(isNull player)}, {
        params ["_name", "_description", "_author"];
        if !(player diarySubjectExists "UO_FW_Menu") then {
            player createDiarySubject ["UO_FW_Menu", "UO Framework"];
        };
        if (isNil "UO_FW_ModuleDiaryEntries") then {UO_FW_ModuleDiaryEntries = []};
        //IGNORE_PRIVATE_WARNING ["_x"];
        if ((UO_FW_ModuleDiaryEntries findIf {_name isEqualto _x}) isEqualto -1) then {
            UO_FW_ModuleDiaryEntries append [_name];
            player createDiaryRecord ["UO_FW_Menu", [_name,"<font size='16'>" + _name + "</font><br/>Description: " + _description + "<br/>by " + _author]];
        };
    },[_name, _description, _author]] call CBA_fnc_WaitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

["UO_FW_RegisterFrameworkEvent", {
    if !(player diarySubjectExists "UO_FW_Menu") then {
        player createDiarySubject ["UO_FW_Menu", "UO Framework"];
    };
    private _info = "
    <font size='18'>United Operations Framework</font><br/>
    The United Operations framework is an addon based utility and function library for making missions.<br/>
    <br/>
    Find out more about the framework on GitHub.<br/>
    github.com/unitedoperations/UnitedOperationsFramework<br/>
    <br/>
    Current Version: 1.0.2
    ";
    player createDiaryRecord ["UO_FW_Menu", ["Framework Info", _info]];
}] call CBA_fnc_addEventHandler;

[{!(isNull player)}, {
    LOG_1("Client call waituntil player: %1",player);
    ["UO_FW_RecievePlayerVarRequest", [player,clientOwner]] call CBA_fnc_serverEvent;
    UO_FW_SETMVAR(UO_FW_SpawnPos,(getposATL player));
}] call CBA_fnc_WaitUntilAndExecute;

["UO_FW_EndMission_PlayerEvent", {
    params ["_scenario"];
    [_scenario] call UO_FW_fnc_EndScreen;
}] call CBA_fnc_addEventHandler;

["UO_FW_EndMission_Event", {
    ["UO_FW_EndMission_PlayerEvent", []] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

["UO_FW_Specator_StartSpectate_Event", {
    [] call UO_FW_fnc_spectate;
}] call CBA_fnc_addEventHandler;

["UO_FW_Spectator_EndSpectate_Event", {
    [] call UO_FW_fnc_endSpectate;
}] call CBA_fnc_addEventHandler;

["UO_FW_Respawn_PlayerRespawn_Event", {
    ["UO_FW_PlayerInit_Event", []] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

["UO_FW_PlayerInit_Event", {
    if (UO_FW_GETMVAR(UO_FW_Player_ViewDistance_Enforce,false)) then {
        setViewDistance UO_FW_GETMVAR(UO_FW_Player_ViewDistance,2500);
    };
    enableSaving [false, false];
    enableEngineArtillery false;
    enableRadio false;
    enableSentences false;
    0 fadeRadio 0;
    player addRating 100000;
    UO_FW_SETPLVAR(BIS_noCoreConversations,true);
}] call CBA_fnc_addEventHandler;

["UO_FW_PlayerInitEH_Event", {
    UO_FW_SETPLPVAR(UO_FW_Dead,false);
    UO_FW_SETPLPVAR(UO_FW_Spectating,false);
    UO_FW_SETPLPVAR(UO_FW_Body,player);
    UO_FW_PlayerHitHandle = [player, "Hit", UO_FW_FUNC(HitHandler), []] call CBA_fnc_addBISEventHandler;
    UO_FW_PlayerKillHandle = [player, "Killed", UO_FW_FUNC(KilledHandler), []] call CBA_fnc_addBISEventHandler;
    UO_FW_PlayerRespawnHandle = [player, "Respawn", UO_FW_FUNC(RespawnHandler), []] call CBA_fnc_addBISEventHandler;
    ["UO_FW_PlayerSpawned", player] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

["UO_FW_JIP_PlayerEvent", {
    if ((CBA_missionTime > ((UO_FW_GETMVAR(UO_FW_JIP_EXPIRETIME,30)) * 60))
        || (((UO_FW_JIP_TypeBLUFOR isEqualto 2) && (side player isEqualto west))
        || ((UO_FW_JIP_TypeOPFOR isEqualto 2) && (side player isEqualto east))
        || ((UO_FW_JIP_TypeINDFOR isEqualto 2) && (side player isEqualto independent))
        || ((UO_FW_JIP_TypeCIVILIAN isEqualto 2) && (side player isEqualto civilian)))
    ) exitwith {
        if (CBA_missionTime > ((UO_FW_GETMVAR(UO_FW_JIP_EXPIRETIME,30)) * 60)) then {
            ["You have spawned in past the mission JiP cutoff timer, enabling spectator"] call ace_common_fnc_displayTextStructured;
        } else {
            ["This mission does not support JIP for your team, enabling spectator"] call ace_common_fnc_displayTextStructured;
        };
        ["UO_FW_Specator_StartSpectate_Event", []] call CBA_fnc_localEvent;
        ["UO_FW_UnTrack_Event", [player]] call CBA_fnc_serverEvent;
        UO_FW_SETPLPVAR(UO_FW_JIP_Excluded,true);
    };
    // Player can JiP, initialize player vars and EHs
    ["UO_FW_PlayerInitEH_Event", []] call CBA_fnc_localEvent;
    ["UO_FW_PlayerInit_Event", []] call CBA_fnc_localEvent;
    [] call UO_FW_FUNC(GiveJiPActions);
}] call CBA_fnc_addEventHandler;
