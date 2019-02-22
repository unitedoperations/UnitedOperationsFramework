#define COMPONENT Spectator
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

params ["_control", "_code", "_shift", "_control", "_alt"];
if (_code isEqualto 35 && {!_shift} && {_control} && {!_alt} && {(GETMVAR(EG_keyHandler_display_hidden,false))}) then {
    ([] call BIS_fnc_displayMission) createDisplay "RscDisplayEGSpectator";
    SETMVAR(EG_keyHandler_display_hidden,false);
    UO_FW_EG_keyHandleEG = (findDisplay 60492) displayAddEventHandler ["keyDown", {[] call UO_FW_fnc_keyHandleEG;}];
    if (GETMVAR(EG_Killcam_active,false)) then {
        UO_FW_killcam_keyHandle = (findDisplay 60492) displayAddEventHandler ["keyDown", {[] call UO_FW_fnc_KillCamToggleKeyH;}];
    };
};
