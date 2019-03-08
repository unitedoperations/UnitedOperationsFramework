#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
EXEC_CHECK(ALL);

["UO_FW_AI_PlayerShotEvent", {
    if (hasInterface) exitwith {};
    params ["_firer","_weapon","_ammo"];
    allUnits select {
        (!isplayer _x)
        && {(local _x)}
        && {(_x distance _firer <= UO_FW_AI_HEARINGDISTANCE)}
    } apply {
        private _distance = _x distance _firer;
        private _travelTime = _distance / 343;
        private _revealValue = linearConversion [200,UO_FW_AI_HEARINGDISTANCE,_distance,4,UO_FW_AI_HEARINGMININCREASE];
        [{
            params ["_firer","_AIunit","_revealValue"];
            _AIunit reveal [_firer,_revealValue];
            if (UO_FW_AI_MARKERS_Enabled) then {
                LOG_5("%1 got revealed to %2\n%3m, %4 seconds, %5 reveal value.",_firer,_x,_distance,_travelTime,_revealValue);
            };
        }, [_firer,_x,_revealValue], _travelTime] call CBA_fnc_waitAndExecute;
    };
}] call CBA_fnc_addEventHandler;
