#define COMPONENT Spectator
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

if (UO_FW_GETPLVAR(UO_FW_Spectating,false)) exitwith {};

//TODO move settings to menu attributes
// Whitelisted sides (BLUFOR,OPFOR,RESISTANCE,CIVILIAN)
UO_FW_EG_whitelisted_sides = [BLUFOR,OPFOR,RESISTANCE,CIVILIAN];
// Whether AI can be viewed by the spectator (true/false)
UO_FW_EG_ai_viewed_by_spectator = true;
// Whether Free camera mode is available (true/false)
UO_FW_EG_free_camera_mode_available = true;
// Whether 3th Person Perspective camera mode is available (true/false)
UO_FW_EG_third_person_perspective_camera_mode_available = true;
// Whether to show Focus Info stats widget (true/false)
Show_Focus_Info_widget = false;
// Whether or not to show camera buttons widget (true/false)
UO_FW_EG_show_camera_buttons_widget = true;
// Whether to show controls helper widget (true/false)
UO_FW_EG_show_controls_helper_widget = true;
// Whether to show header widget (true/false)
UO_FW_EG_show_header_widget = true;
// Whether to show entities / locations lists (true/false)
UO_FW_EG_show_Entities_and_locations_lists = true;
// Define where the spectator camera starts. (add a marker with the name inside the "")
UO_FW_EG_spectator_marker = "";
// Activate showing information about killer
UO_FW_Killcam_active = true;
// Makes screen turn black instantly and mutes all audio when killed
UO_FW_EG_instant_death = true;

UO_FW_SETMVAR(EG_keyHandler_display_hidden,false);

player setVariable ["UO_FW_Dead", true, true];
[player,true] remoteExecCall ["hideObject", 0];
[player,true] remoteExecCall ["hideObjectGlobal", 2];
player setCaptive true;
player allowdamage false;
[player, true] remoteExec ["setCaptive", 2];
[player, false] remoteExec ["allowdamage", 2];
player call UO_FW_fnc_RemoveAllGear;
player addWeapon "itemMap";
player setPos [0, 0, 0];
[player] join grpNull;
[true] call acre_api_fnc_setSpectator;
//If babel is enabled, allowed spectator to hear all languages present in mission.
if (!isNil "UO_FW_enable_babel" && {UO_FW_enable_babel}) then {
    private _missionLanguages = [];
    {
        {
            if (!(_x in _missionLanguages)) then {
                _missionLanguages pushback _x;
            };
        } foreach _x;
    } forEach UO_FW_languages_babel;
    _missionLanguages call acre_api_fnc_babelSetSpokenLanguages;
};

//we set default pos in case all methods fail and we end up with 0,0,0
private _pos = [2000, 2000, 100];
private _dir = 0;

//our function is called from Respawned EH, so select 1 is player's body
private _body = UO_FW_GETPLVAR(UO_FW_Body,objnull);
if (getMarkerColor UO_FW_EG_spectator_marker isEqualto "") then {
    if (!isNull _body) then {
        //set camera pos on player body
        _pos = [(getpos _body) select 0, (getpos _body) select 1, ((getposATL _body) select 2)+1.2];
        _dir = getDir _body;
    };
} else {
    _pos = getmarkerpos UO_FW_EG_spectator_marker;
};
if (abs(_pos select 0) < 2 && abs(_pos select 1) < 2) then {
    _pos = [2000, 2000, 100];
};

["Initialize",[
    player,
    UO_FW_EG_Whitelisted_Sides,
    UO_FW_EG_Ai_Viewed_By_Spectator,
    UO_FW_EG_Free_Camera_Mode_Available,
    UO_FW_EG_Third_Person_Perspective_Camera_mode_Available,
    UO_FW_EG_Show_Focus_Info_Widget,
    UO_FW_EG_Show_Camera_Buttons_Widget,
    UO_FW_EG_Show_Controls_Helper_Widget,
    UO_FW_EG_Show_Header_Widget,
    UO_FW_EG_Show_Entities_And_Locations_Lists]
] call BIS_fnc_EGSpectator;

private _cam = UO_FW_GETMVAR(BIS_EGSpectatorCamera_camera,objNull);
if !(_cam isEqualto objNull) then {
    [{!isNull (findDisplay 60492)}, {
        LOG("Display loaded, attaching key EH");
        UO_FW_EG_keyHandleEG = (findDisplay 60492) displayAddEventHandler ["keyDown", {call UO_FW_fnc_keyHandleEG;}];
        UO_FW_EG_keyHandle46 = (findDisplay 46) displayAddEventHandler ["keyDown", {call UO_FW_fnc_keyHandle46}];
    }, []] call CBA_fnc_waitUntilAndExecute;
    if !(UO_FW_Killcam_active) then {
        //we move 2 meters back so player's body is visible
        _pos getpos [-2, _dir];
        _cam setposATL _pos;
        _cam setDir _dir;
    } else {
        UO_FW_SETMVAR(UO_FW_killcam_toggle,false);
        //this cool piece of code adds key handler to spectator display
        //it takes some time for display to create, so we have to delay it.
        [{!isNull (findDisplay 60492)}, {
            LOG("Display loaded, attaching key EH");
            UO_FW_killcam_keyHandle = (findDisplay 60492) displayAddEventHandler ["keyDown", {call UO_FW_fnc_KillCamToggleKeyH;}];
        }, []] call CBA_fnc_waitUntilAndExecute;
        if (!isNull UO_FW_killcam_killer) then {
            LOG("found valid killer");
            UO_FW_killcam_distance = UO_FW_killcam_killer distance _body;
            private _dirto = [_body, UO_FW_killcam_killer] call BIS_fnc_dirTo;
            _pos = _pos getpos [-1.8,_dirto];
            _cam setposATL _pos;
            //vector magic
            private _temp1 = ([getposASL _cam, getposASL UO_FW_killcam_killer] call BIS_fnc_vectorFromXToY);
            private _temp = (_temp1 call CBA_fnc_vect2Polar);
            //we check if camera is not pointing up, just in case
            if (abs(_temp select 2) > 89) then {_temp set [2, 0]};
            [_cam, [_temp select 1, _temp select 2]] call BIS_fnc_setObjectRotation;
        } else {
            LOG("no valid killer");
            _cam setposATL _pos;
            _cam setDir _dir;
        };
        UO_FW_killcam_drawHandle = addMissionEventHandler ["Draw3D", {
            //we don't draw hud unless we toggle it by keypress
            if (missionNamespace getVariable ["UO_FW_killcam_toggle", false]) then {
                if ((UO_FW_killcam_killer_pos select 0) != 0) then {
                    private _u = UO_FW_killcam_unit_pos;
                    private _k = UO_FW_killcam_killer_pos;
                    if ((_u distance _k) < 2000) then {
                        //TODO do it better
                        drawLine3D [[(_u select 0)+0.01, (_u select 1)+0.01, (_u select 2)+0.01], [(_k select 0)+0.01, (_k select 1)+0.01, (_k select 2)+0.01], [1,0,0,1]];
                        drawLine3D [[(_u select 0)-0.01, (_u select 1)-0.01, (_u select 2)-0.01], [(_k select 0)-0.01, (_k select 1)-0.01, (_k select 2)-0.01], [1,0,0,1]];
                        drawLine3D [[(_u select 0)-0.01, (_u select 1)+0.01, (_u select 2)-0.01], [(_k select 0)-0.01, (_k select 1)+0.01, (_k select 2)-0.01], [1,0,0,1]];
                        drawLine3D [[(_u select 0)+0.01, (_u select 1)-0.01, (_u select 2)+0.01], [(_k select 0)+0.01, (_k select 1)-0.01, (_k select 2)+0.01], [1,0,0,1]];
                    };
                    if (!isNull UO_FW_killcam_killer) then {
                        drawIcon3D ["a3\ui_f\data\gui\cfg\debriefing\enddeath_ca.paa", [1,0,0,1], [eyePos UO_FW_killcam_killer select 0, eyePos UO_FW_killcam_killer select 1, (ASLtoAGL eyePos UO_FW_killcam_killer select 2) + 0.4], 0.7, 0.7, 0, (name UO_FW_killcam_killer) + ", " + (str round UO_FW_killcam_distance) + "m", 1, 0.04, "PuristaMedium"];
                    };
                } else {
                    cutText ["killer info unavailable", "PLAIN DOWN"];
                    missionNamespace setVariable ["UO_FW_killcam_toggle", false];
                };
            };
        }];//draw EH
    };//killcam (not) active
};//checking camera
private _killcam_msg = "";
if (UO_FW_Killcam_active) then {
    _killcam_msg = "Press <t color='#FFA500'>K</t> to toggle indicator showing location where you were killed from.<br/>";
};
private _text = format ["<t size='0.5' color='#ffffff'>%1
Close spectator HUD by pressing <t color='#FFA500'>CTRL+H</t>.<br/>
Press <t color='#FFA500'>SHIFT</t>, <t color='#FFA500'>ALT</t> or <t color='#FFA500'>SHIFT+ALT</t> to modify camera speed. Open map by pressing <t color='#FFA500'>M</t> and click anywhere to move camera to that postion.<br/>
Spectator controls can be customized in game <t color='#FFA500'>options->controls->'Camera'</t> tab.</t>", _killcam_msg];
[_text, 0.55, 0.8, 20, 1] spawn BIS_fnc_dynamicText;

player setVariable ["UO_FW_Spectating", true, true];

UO_FW_Spectate_PFH = [{
    params ["","_idPFH"];
    player setOxygenRemaining 1;
    if !(UO_FW_GETPLVAR(UO_FW_Spectating,false)) exitwith {
        ["UO_FW_Spectator_EndSpectate_Event", []] call CBA_fnc_localEvent;
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };
}, 5, []] call CBA_fnc_addPerFrameHandler;
