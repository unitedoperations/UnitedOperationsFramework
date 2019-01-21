#define COMPONENT Core
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

_this params ["_unit", "", "_instigator"];

if (UO_FW_Killcam_Enabled) then {
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
        private _last_hit_info = UO_FW_GETMVAR(UO_FW_Killcam_LastHit,[]);
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

// Handle respawn delay

if (UO_FW_eg_instant_death) then {
    private _damage = UO_FW_GETMVAR(UO_FW_Killcam_LastHitDamage,0.5);
    [{
        cutText ["\n", "BLACK", 1.01-_damage, true];
        ["UO_FW_death", 0, true] call ace_common_fnc_setHearingCapability;
        0 fadeSound 0;
        ["<t color='#FF0000'>YOU ARE DEAD</t>", 0, 0.4, 2, 0.5, 0, 1000] spawn BIS_fnc_dynamicText;
        [{
            cutText ["\n","BLACK IN", 5];
            ["UO_FW_death", 0, false] call ace_common_fnc_setHearingCapability;
            0 fadeSound 1;
        }, [], 5] call CBA_fnc_WaitAndExecute;
    }] call CBA_fnc_execNextFrame;
} else {
    [{
        "BIS_layerEstShot" cutRsc ["RscStatic", "PLAIN"];
        playSound "Simulation_Fatal";
        [] call BIS_fnc_VRFadeOut;
        [{
            playSound ("Transition" + str (1 + floor random 3));
            [{
                [] call BIS_fnc_VRFadeIn;
            }, [], 1] call CBA_fnc_WaitAndExecute;
        }, [], 1] call CBA_fnc_WaitAndExecute;
    }] call CBA_fnc_execNextFrame;
};


//Handle Respawn Modes or Send to Spectate Here

if !(player getVariable ["UO_FW_Spectating", false]) then {
    ["UO_FW_Specator_StartSpectate_Event", []] call CBA_fnc_localEvent;
};
