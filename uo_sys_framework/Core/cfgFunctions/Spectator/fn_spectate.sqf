#define COMPONENT Spectator
#include "\x\UO_FW\addons\Main\script_macros.hpp"
EXEC_CHECK(CLIENT);

SETPLPVAR(Dead,true);
[player,true] remoteExecCall ["hideObject", 0];
[player,true] remoteExecCall ["hideObjectGlobal", 2];
player setCaptive true;
player allowdamage false;
[player, true] remoteExec ["setCaptive", 2];
[player, false] remoteExec ["allowdamage", 2];
player call EFUNC(Gear,RemoveAllGear);
player setPos [0, 0, 0];
[player] joinSilent grpNull;

if (GETPLVAR(Spectating,false)) exitwith {};

private ["_delay","_teamSpectateList","_killCamSetting","_AISetting","_freeCamSetting","_thirdPersonSetting"];

switch (side player) do {
    case west: {
        _delay = EGETMVAR(Respawn,Delay_BLUFOR,5);
        private _teamSpectateVarValue = GETMVAR(EnabledTeams_Blufor,[]);
        _teamSpectateList = [];
        if ("BLUFOR" in _teamSpectateVarValue) then {_teamSpectateList pushBackUnique BLUFOR};
        if ("OPFOR" in _teamSpectateVarValue) then {_teamSpectateList pushBackUnique OPFOR};
        if ("Indfor" in _teamSpectateVarValue) then {_teamSpectateList pushBackUnique INDEPENDENT};
        if ("CIVILIAN" in _teamSpectateVarValue) then {_teamSpectateList pushBackUnique CIVILIAN};
        _killCamSetting = GETMVAR(KillCam_Blufor,true);
        _AISetting = GETMVAR(AIEnabled_Blufor,true);
        _freeCamSetting = GETMVAR(FreeCam_Blufor,true);
        _thirdPersonSetting = GETMVAR(3rdPerson_Blufor,true);
    };
    case east: {
        _delay = EGETMVAR(Respawn,Delay_OPFOR,5);
        private _teamSpectateVarValue = GETMVAR(EnabledTeams_Opfor,[]);
        _teamSpectateList = [];
        if ("BLUFOR" in _teamSpectateVarValue) then {_teamSpectateList pushBackUnique BLUFOR};
        if ("OPFOR" in _teamSpectateVarValue) then {_teamSpectateList pushBackUnique OPFOR};
        if ("Indfor" in _teamSpectateVarValue) then {_teamSpectateList pushBackUnique INDEPENDENT};
        if ("CIVILIAN" in _teamSpectateVarValue) then {_teamSpectateList pushBackUnique CIVILIAN};
        _killCamSetting = GETMVAR(KillCam_OPFOR,true);
        _AISetting = GETMVAR(AIEnabled_OPFOR,true);
        _freeCamSetting = GETMVAR(FreeCam_OPFOR,true);
        _thirdPersonSetting = GETMVAR(3rdPerson_OPFOR,true);
    };
    case independent: {
        _delay = EGETMVAR(Respawn,Delay_Indfor,5);
        private _teamSpectateVarValue = GETMVAR(EnabledTeams_Indfor,[]);
        _teamSpectateList = [];
        if ("BLUFOR" in _teamSpectateVarValue) then {_teamSpectateList pushBackUnique BLUFOR};
        if ("OPFOR" in _teamSpectateVarValue) then {_teamSpectateList pushBackUnique OPFOR};
        if ("Indfor" in _teamSpectateVarValue) then {_teamSpectateList pushBackUnique INDEPENDENT};
        if ("CIVILIAN" in _teamSpectateVarValue) then {_teamSpectateList pushBackUnique CIVILIAN};
        _killCamSetting = GETMVAR(KillCam_Indfor,true);
        _AISetting = GETMVAR(AIEnabled_Indfor,true);
        _freeCamSetting = GETMVAR(FreeCam_Indfor,true);
        _thirdPersonSetting = GETMVAR(3rdPerson_Indfor,true);
    };
    case civilian: {
        _delay = EGETMVAR(Respawn,Delay_Civ,5);
        private _teamSpectateVarValue = GETMVAR(EnabledTeams_Civ,[]);
        _teamSpectateList = [];
        if ("BLUFOR" in _teamSpectateVarValue) then {_teamSpectateList pushBackUnique BLUFOR};
        if ("OPFOR" in _teamSpectateVarValue) then {_teamSpectateList pushBackUnique OPFOR};
        if ("Indfor" in _teamSpectateVarValue) then {_teamSpectateList pushBackUnique INDEPENDENT};
        if ("CIVILIAN" in _teamSpectateVarValue) then {_teamSpectateList pushBackUnique CIVILIAN};
        _killCamSetting = GETMVAR(KillCam_Civ,true);
        _AISetting = GETMVAR(AIEnabled_Civ,true);
        _freeCamSetting = GETMVAR(FreeCam_Civ,true);
        _thirdPersonSetting = GETMVAR(3rdPerson_Civ,true);
    };
};

SETMVAR(Killcam_active,_killCamSetting);
// Whether to show Focus Info stats widget (true/false)
SETMVAR(show_Focus_Info_widget,false);
// Whether or not to show camera buttons widget (true/false)
SETMVAR(show_camera_buttons_widget,true);
// Whether to show controls helper widget (true/false)
SETMVAR(show_controls_helper_widget,true);
// Whether to show header widget (true/false)
SETMVAR(show_header_widget,true);
// Whether to show entities / locations lists (true/false)
SETMVAR(show_Entities_and_locations_lists,true);
// Define where the spectator camera starts. (add a marker with the name inside the "")
SETMVAR(spectator_marker,"");

if (GETMVAR(RespawnSetting_InstantDeath,true)) then {
    [{
        params ["_teamSpectateList","_AISetting","_freeCamSetting","_thirdPersonSetting","_killCamSetting"];
        (QEGVAR(Core,KilledLayer)) cutText ["","BLACK IN", 5];
        [QEGVAR(Core,DeathHearing), 0, false] call ace_common_fnc_setHearingCapability;
        0 fadeSound 1;
        ["Initialize",[
            player,
            _teamSpectateList,
            _AISetting,
            _freeCamSetting,
            _thirdPersonSetting,
            GVAR(show_Focus_Info_widget),
            GVAR(show_camera_buttons_widget),
            GVAR(show_controls_helper_widget),
            GVAR(show_header_widget),
            GVAR(show_Entities_and_locations_lists)]
        ] call BIS_fnc_EGSpectator;
        player addWeapon "itemMap";
        [true] call acre_api_fnc_setSpectator;
        [QGVAR(SetSpectatorInfoEvent), [_killCamSetting]] call CBA_fnc_localEvent;
    }, [_teamSpectateList,_AISetting,_freeCamSetting,_thirdPersonSetting,_killCamSetting], _delay] call CBA_fnc_WaitAndExecute;
} else {
    [{
        params ["_teamSpectateList","_AISetting","_freeCamSetting","_thirdPersonSetting","_killCamSetting"];
        0 fadeSound 1;
        playSound ("Transition" + str (1 + floor random 3));
        ["Initialize",[
            player,
            _teamSpectateList,
            _AISetting,
            _freeCamSetting,
            _thirdPersonSetting,
            GVAR(show_Focus_Info_widget),
            GVAR(show_camera_buttons_widget),
            GVAR(show_controls_helper_widget),
            GVAR(show_header_widget),
            GVAR(show_Entities_and_locations_lists)]
        ] call BIS_fnc_EGSpectator;
        [] call BIS_fnc_VRFadeIn;
        player addWeapon "itemMap";
        [true] call acre_api_fnc_setSpectator;
        [QGVAR(SetSpectatorInfoEvent), [_killCamSetting]] call CBA_fnc_localEvent;
    }, [_teamSpectateList,_AISetting,_freeCamSetting,_thirdPersonSetting,_killCamSetting], _delay] call CBA_fnc_WaitAndExecute;
};

//If babel is enabled, allowed spectator to hear all languages present in mission.
if (EGETMVAR(ACRE,enable_babel,false)) then {
    private _missionLanguages = [];
    {
        {
            if (!(_x in _missionLanguages)) then {
                _missionLanguages pushback _x;
            };
        } foreach _x;
    } forEach EGETMVAR(Acre,languages_babel,[]);
    _missionLanguages call acre_api_fnc_babelSetSpokenLanguages;
};

[QGVAR(SetSpectatorInfoEvent), {
    params ["_killCamSetting"];
    //we set default pos in case all methods fail and we end up with 0,0,0
    private _pos = [2000, 2000, 100];
    private _dir = 0;

    //our function is called from Respawned EH, so select 1 is player's body
    private _body = EGETPLVAR(Core,Body,objnull);
    if ((getMarkerType (GVAR(spectator_marker))) == "") then {
        if (!isNull _body) then {
            //set camera pos on player body
            _pos = [(getpos _body) select 0, (getpos _body) select 1, ((getposATL _body) select 2)+1.2];
            _dir = getDir _body;
            TRACE_1("Spectator Body Position",_pos);
        };
    } else {
        _pos = getmarkerpos GVAR(spectator_marker);
        TRACE_1("Spectator Marker Position",_pos);
    };
    if ((abs(_pos select 0) < 2) && {abs(_pos select 1) < 2}) then {
        _pos = [2000, 2000, 100];
    };



    private _cam = missionNamespace getVariable ["BIS_EGSpectatorCamera_camera",objNull];


    if !(_cam isEqualto objNull) then {
        [{!isNull (findDisplay 60492)}, {
            LOG("Display loaded, attaching key EH");
            GVAR(keyHandleEG) = (findDisplay 60492) displayAddEventHandler ["keyDown", {call FUNC(keyHandleEG);}];
            GVAR(keyHandle46) = (findDisplay 46) displayAddEventHandler ["keyDown", {call FUNC(keyHandle46)}];
        }, []] call CBA_fnc_waitUntilAndExecute;
        if !(_killCamSetting) then {
            //we move 2 meters back so player's body is visible
            _pos = _pos getpos [-2, _dir];
            _cam setposATL _pos;
            _cam setDir _dir;    
            TRACE_1("Spectator position",_pos);
        } else {
                         
            SETMVAR(killcam_toggle,false);
            //this cool piece of code adds key handler to spectator display
            //it takes some time for display to create, so we have to delay it.
            [{!isNull (findDisplay 60492)}, {
                LOG("Display loaded, attaching key EH");
                private _killcam_msg = "<t size = '.8'>Press </t><t color='#FFA500' size = '.8'>K</t><t size = '.8'> to toggle indicator showing location where you were killed from.</t>";
                [_killcam_msg, 0.55, 0.8, 8, 1] spawn BIS_fnc_dynamicText;
                GVAR(killcam_keyHandle) = (findDisplay 60492) displayAddEventHandler ["keyDown", {call FUNC(KillCamToggleKeyH);}];
            }, []] call CBA_fnc_waitUntilAndExecute;
            if !(objNull isEqualTo (GETMVAR(killcam_killer,objnull))) then {
                LOG("found valid killer");
                GVAR(killcam_distance) = (GVAR(killcam_killer)) distance _body;
                private _dirto = [_body, GVAR(killcam_killer)] call BIS_fnc_dirTo;
                _pos = _pos getpos [-1.8,_dirto];
                _cam setposATL _pos;
                TRACE_1("Killcam position",_pos);
                private _kPos = GVAR(killcam_killer_pos);
                TRACE_1("Killer Killcam position",_kPos);
                //vector magic
                private _temp1 = ([getposASL _cam, (getposASL GVAR(killcam_killer))] call BIS_fnc_vectorFromXToY);
                private _temp = (_temp1 call CBA_fnc_vect2Polar);
                //we check if camera is not pointing up, just in case
                if (abs(_temp select 2) > 89) then {_temp set [2, 0]};
                [_cam, [_temp select 1, _temp select 2]] call BIS_fnc_setObjectRotation;
            } else {
                _cam setposATL _pos;
                _cam setDir _dir;
                TRACE_1("No valid killer posiition",_pos);
            };
            
            GVAR(killcam_drawHandle) = addMissionEventHandler ["Draw3D", {
                //we don't draw hud unless we toggle it by keypress
                if (GETMVAR(killcam_toggle,false)) then {
                    if ((GVAR(killcam_killer_pos) select 0) != 0) then {
                        private _u = GVAR(killcam_unit_pos);
                        private _k = GVAR(killcam_killer_pos);
                        if ((_u distance _k) < 2000) then {
                            //TODO do it better
                            drawLine3D [[(_u select 0)+0.01, (_u select 1)+0.01, (_u select 2)+0.01], [(_k select 0)+0.01, (_k select 1)+0.01, (_k select 2)+0.01], [1,0,0,1]];
                            drawLine3D [[(_u select 0)-0.01, (_u select 1)-0.01, (_u select 2)-0.01], [(_k select 0)-0.01, (_k select 1)-0.01, (_k select 2)-0.01], [1,0,0,1]];
                            drawLine3D [[(_u select 0)-0.01, (_u select 1)+0.01, (_u select 2)-0.01], [(_k select 0)-0.01, (_k select 1)+0.01, (_k select 2)-0.01], [1,0,0,1]];
                            drawLine3D [[(_u select 0)+0.01, (_u select 1)-0.01, (_u select 2)+0.01], [(_k select 0)+0.01, (_k select 1)-0.01, (_k select 2)+0.01], [1,0,0,1]];
                        };
                        if (!isNull (GVAR(killcam_killer))) then {
                            private _name = [GVAR(killcam_killer), true] call BIS_fnc_getName;
                            drawIcon3D ["a3\ui_f\data\gui\cfg\debriefing\enddeath_ca.paa", [1,0,0,1], [eyePos GVAR(killcam_killer) select 0, eyePos GVAR(killcam_killer) select 1, (ASLtoAGL eyePos GVAR(killcam_killer) select 2) + 0.4], 0.7, 0.7, 0, _name + ", " + (str round GVAR(killcam_distance)) + "m", 1, 0.04, "PuristaMedium"];
                        };
                    } else {
                        "KillCamLayer" cutText ["killer info unavailable", "PLAIN DOWN"];
                        SETMVAR(killcam_toggle,false);
                        "KillCamLayer" cutFadeout 2;
                    };
                };
            }];//draw EH
        };//killcam (not) active
    };//checking camera
  
    //private _text = format ["<t size='0.5' color='#ffffff'>%1
    //Close spectator HUD by pressing <t color='#FFA500'>CTRL+H</t>.<br/>
    //Press <t color='#FFA500'>SHIFT</t>, <t color='#FFA500'>ALT</t> or <t color='#FFA500'>SHIFT+ALT</t> to modify camera speed. Open map by pressing <t color='#FFA500'>M</t> and click anywhere to move camera to that postion.<br/>
    //Spectator controls can be customized in game <t color='#FFA500'>options->controls->'Camera'</t> tab.</t>", _killcam_msg];


    SETPLPVAR(Spectating,true);

    [{(GETPLVAR(Spectating,false))},{
        GVAR(Spectate_PFH) = [{
            params ["","_idPFH"];
            player setOxygenRemaining 1;
            if !(["IsSpectating",[]] call BIS_fnc_EGSpectator) exitwith {
                (SETPLPVAR(Spectating,false));
                [QGVAR(EndEvent), []] call CBA_fnc_localEvent;
                [_idPFH] call CBA_fnc_removePerFrameHandler;
            };
            if !(GETPLVAR(Spectating,false)) exitwith {
                [QGVAR(Spectator_EndEvent), []] call CBA_fnc_localEvent;
                [_idPFH] call CBA_fnc_removePerFrameHandler;
            };
        }, 5, []] call CBA_fnc_addPerFrameHandler;
    }, []] call CBA_fnc_WaitUntilAndExecute;

    SETMVAR(EG_keyHandler_display_hidden,false);
}] call CBA_fnc_addEventHandler;





