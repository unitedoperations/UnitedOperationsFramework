#define COMPONENT Spectator
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

player setVariable ["UO_FW_Spectating", false, true];
player setVariable ["UO_FW_Dead", false, true];
[player,false] remoteExecCall ["hideObject", 0];
[player,false] remoteExecCall ["hideObjectGlobal", 2];
player setCaptive false;
player allowdamage true;
[player, false] remoteExec ["setCaptive", 2];
[player, true] remoteExec ["allowdamage", 2];
player call UO_FW_fnc_RemoveAllGear;
[false] call acre_api_fnc_setSpectator;
(findDisplay 46) displayRemoveEventHandler ["keyDown",UO_FW_EG_keyHandle46];

["Terminate"] call BIS_fnc_EGSpectator;

//Handle specifics (group join, location setpos, gear, module settings, etc)
//[player] join grpNull;

private _marker = "";
switch (side player) do {
    case WEST: {_marker = "respawn_west";};
    case EAST: {_marker = "respawn_east";};
    case INDEPENDENT: {_marker = "respawn_guerrila";};
    case CIVILIAN: {_marker = "respawn_civilian";};
    default {};
};

player setPos (getMarkerPos _marker);
["UO_FW_Gear_PlayerGearLoad", []] call CBA_fnc_localEvent;
