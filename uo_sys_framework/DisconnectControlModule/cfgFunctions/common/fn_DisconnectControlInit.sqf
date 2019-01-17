#define COMPONENT DisconnectControl
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(SERVER);

["Disconnect Control", "Controls when player bodies should be deleted", "Olsen, Perfk and Sacher"] call UO_FW_fnc_RegisterModule;

disconnect_control_sides = [];
if ((missionNamespace getVariable ["UO_FW_DisconnectControl_BluforDelete",true])) then {disconnect_control_sides pushBack WEST;};
if ((missionNamespace getVariable ["UO_FW_DisconnectControl_OpforDelete",true])) then {disconnect_control_sides pushBack EAST;};
if ((missionNamespace getVariable ["UO_FW_DisconnectControl_IndependentDelete",true])) then {disconnect_control_sides pushBack RESISTANCE;};
if ((missionNamespace getVariable ["UO_FW_DisconnectControl_CivilianDelete",true])) then {disconnect_control_sides pushBack CIVILIAN;};
