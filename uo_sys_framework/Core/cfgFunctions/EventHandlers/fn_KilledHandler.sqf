#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

_this params ["_unit", "", "_instigator"];

SETMVAR(OLDGROUP,(group player));
SETPLPVAR(Dead,true);

private ["_delay","_templateSettings"];

switch (side player) do {
    case west: {
        _delay = GETMVAR(RespawnSetting_Delay_BLUFOR,5);
        _templateSettings = GETMVAR(RespawnSetting_Templates_BLUFOR,[]);
    };
    case east: {
        _delay = GETMVAR(RespawnSetting_Delay_OPFOR,5);
        _templateSettings = GETMVAR(RespawnSetting_Templates_OPFOR,[]);
    };
    case independent: {
        _delay = GETMVAR(RespawnSetting_Delay_INDFOR,5);
        _templateSettings = GETMVAR(RespawnSetting_Templates_INDFOR,[]);
    };
    case civilian: {
        _delay = GETMVAR(RespawnSetting_Delay_CIV,5);
        _templateSettings = GETMVAR(RespawnSetting_Templates_CIV,[]);
    };
};

[{
    params ["_unit"];
    [_unit] joinSilent grpNull;
}, [_unit], 2] call CBA_fnc_WaitAndExecute;

if (GETMVAR(Killcam_Enabled,true)) then {
    //we check if player didn't kill himself or died for unknown reasons
    if ((vehicle _instigator != vehicle _unit) && {_instigator != objNull}) then {
        //this is the standard case (killed EH got triggered by getting shot)
        LOG("using killed EH");
        UO_FW_Killcam_unit_pos = ASLtoAGL eyePos _unit;
        UO_FW_Killcam_killer = _instigator;
        UO_FW_Killcam_killer_pos = ASLtoAGL eyePos _instigator;
    } else {
        //we will try to retrieve info from our hit EH
        LOG("using hit EH");
        private _last_hit_info = GETMVAR(Killcam_LastHit,[]);
        //hit info retrieved, now we check if it's not caused by fall damage etc.
        //also we won't use info that's over 10 seconds old
        if (_last_hit_info isEqualto []) then {
            _last_hit_info params ["_data", "_time", "_unitPos", "_killerPos"];
            if ((_time + 10 > time) &&
            {(_data select 1) != objNull} &&
            {(_data select 1) != player}
            ) then {
                LOG("HIT data check successful");
                UO_FW_Killcam_unit_pos = _unitPos;
                UO_FW_Killcam_killer = _data select 1;
                UO_FW_Killcam_killer_pos = _killerPos;
            } else {
                LOG("HIT data not valid");
                //everything failed, we set value we will detect later
                UO_FW_Killcam_killer_pos = [0,0,0];
                UO_FW_Killcam_unit_pos = ASLtoAGL eyePos _unit;
                UO_FW_Killcam_killer = objNull;
            };
        } else {
            LOG("HIT and KILLED EHs not valid");
            UO_FW_Killcam_killer_pos = [0,0,0];
            UO_FW_Killcam_unit_pos = ASLtoAGL eyePos _unit;
            UO_FW_Killcam_killer = objNull;
        };
    };
};

if (GETMVAR(RespawnSetting_InstantDeath,true)) then {
    private _damage = GETMVAR(Killcam_LastHitDamage,0.5);
    private _fadeInSpeed = (1.001 - _damage);
    [{
        params ["_fadeInSpeed"];
        0 fadeSound 0;
        "UO_FW_KilledLayer" cutText ["<t color='#FF0000' size='2.0'>YOU ARE DEAD</t>", "BLACK", _fadeInSpeed, true, true];
        ["UO_FW_death", 0, true] call ace_common_fnc_setHearingCapability;
    }, [_fadeInSpeed]] call CBA_fnc_execNextFrame;
} else {
    [{
        playSound "Simulation_Fatal";
        0 fadeSound 0;
        [] call BIS_fnc_VRFadeOut;
    }] call CBA_fnc_execNextFrame;
};
