#include "\x\UO_FW\addons\main\script_macros.hpp"

_isEnabled = missionNamespace getVariable ["UO_FW_DisconnectControl_Enabled",false];
if(!_isEnabled) exitWith {};

["Disconect Control", "Controls when player bodies should be deleted", "Sacher"] call UO_FW_FNC_RegisterModule;
ace_respawn_RemoveDeadBodiesDisconnected = false;
if (isServer) then 
{
    disconnect_control_time = missionNamespace getVariable ["UO_FW_DisconnectControl_Time",2];
    disconnect_control_sides = [];
    if((missionNamespace getVariable ["UO_FW_DisconnectControl_BluforDelete",true])) then {disconnect_control_sides pushBack WEST;};
    if((missionNamespace getVariable ["UO_FW_DisconnectControl_OpforDelete",true])) then {disconnect_control_sides pushBack EAST;};
    if((missionNamespace getVariable ["UO_FW_DisconnectControl_IndependentDelete",true])) then {disconnect_control_sides pushBack RESISTANCE;};
    if((missionNamespace getVariable ["UO_FW_DisconnectControl_CivilianDelete",true])) then {disconnect_control_sides pushBack CIVILIAN;};
    UO_FW_EventDisconnectHandle_BodyCleanup = addMissionEventHandler ["HandleDisconnect", {_this call UO_FW_FNC_EventDisconnect_BodyCleanup;}];
};

