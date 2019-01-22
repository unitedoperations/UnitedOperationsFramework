#define COMPONENT Spectator
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

// Reports Event & Function execution, confirm removed from queues.


// Re call player init event
["UO_FW_PlayerInit_Event", []] call CBA_fnc_localEvent;

private _teamDelayVarName = format ["UO_FW_RespawnSetting_Delay_%1",TeamTag];
private _delaySetting = missionNamespace getVariable [_teamDelayVarName, 5];
private _delay = if (_delaySetting <= 5) then {2} else {(_delaySetting - 5)};


[{
    // Remove Killed Displays
    if (UO_FW_GETMVAR(eg_instant_death,true)) then {
        "UO_FW_KilledLayer" cutText ["","BLACK IN", 5];
        ["UO_FW_death", 0, false] call ace_common_fnc_setHearingCapability;
        0 fadeSound 1;
    } else {
        0 fadeSound 1;
        playSound ("Transition" + str (1 + floor random 3));
        [] call BIS_fnc_VRFadeIn;
    };

    // Handle Teleport Locations

    // Handle Module and Gear Settings


}, [], _delay] call CBA_fnc_waitAndExecute;
