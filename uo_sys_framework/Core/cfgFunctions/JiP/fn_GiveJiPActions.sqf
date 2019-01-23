/*    Description: Gives players Jip actions
 *    Arguments:
 *         N/A
 *    Return Value:
 *         ARRAY
 *    Author
 *        Olsen & Starfox64 & PiZZADOX
 */

#define COMPONENT JiP
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(CLIENT);

private ["_type","_distance"];

switch (side player) do {
    case west: {
        _type = UO_FW_GETMVAR(JIP_Type_BLUFOR,0);
        _distance = UO_FW_GETMVAR(JIP_Distance_BLUFOR,200);
    };
    case east: {
        _type = UO_FW_GETMVAR(JIP_Type_OPFOR,0);
        _distance = UO_FW_GETMVAR(JIP_Distance_OPFOR,200);
    };
    case independent: {
        _type = UO_FW_GETMVAR(JIP_Type_INDFOR,0);
        _distance = UO_FW_GETMVAR(JIP_Distance_INDFOR,200);
    };
    case civilian: {
        _type = UO_FW_GETMVAR(JIP_Type_CIV,0);
        _distance = UO_FW_GETMVAR(JIP_Distance_CIV,200);
    };
};

switch (_type) do {
    case 0: {
        private _teleportAction = ["Jip_Teleport_Action", "Teleport To Squad", "", {
            params ["_target", "_player", "_args"];
            _args params ["_distance"];
            [_target,_args] call UO_FW_FUNC(JiPTeleport);
        }, {(player distance (UO_FW_GETMVAR(SpawnPos,(getpos player))) > (_this select 0))}, {}, [_distance]] call ace_interact_menu_fnc_createAction;
        [player, 1, ["ACE_SelfActions"], _teleportAction] call ace_interact_menu_fnc_addActionToObject;
        [{
            params ["_args","_idPFH"];
            _args params ["_distance","_startTime"];
            if (CBA_missionTime > (_startTime + 120)) exitwith {
                [player,1,["ACE_SelfActions","Jip_Teleport_Action"]] call ace_interact_menu_fnc_removeActionFromObject;
                [_idPFH] call CBA_fnc_removePerFrameHandler;
                ["JIP teleport option lost, it has been two minutes since you spawned."] call ace_common_fnc_displayTextStructured;
            };
            if (player distance (UO_FW_GETMVAR(SpawnPos,(getpos player))) > _distance) exitwith {
                [player,1,["ACE_SelfActions","Jip_Teleport_Action"]] call ace_interact_menu_fnc_removeActionFromObject;
                [_idPFH] call CBA_fnc_removePerFrameHandler;
                [["JIP teleport option lost, you went beyond %1 meters from your spawn location",_distance]] call ace_common_fnc_displayTextStructured;
            };
        }, 10, [_distance,CBA_missiontime]] call CBA_fnc_addPerFrameHandler;
    };
    case 1: {
        private _transportAction = ["Jip_Transport_Action", "Request Transport", "", {
            params ["_target", "_player", "_args"];
            _args params ["_distance"];
            [_target,_args] call UO_FW_FUNC(JiPTransport);
        }, {(player distance (UO_FW_GETMVAR(SpawnPos,(getpos player))) > (_this select 0))}, {}, [_distance]] call ace_interact_menu_fnc_createAction;
        [player, 1, ["ACE_SelfActions"], _transportAction] call ace_interact_menu_fnc_addActionToObject;
        [{
            params ["_args","_idPFH"];
            _args params ["_distance","_startTime"];
            if (CBA_missionTime > (_startTime + 120)) exitwith {
                [player,1,["ACE_SelfActions","Jip_Teleport_Action"]] call ace_interact_menu_fnc_removeActionFromObject;
                [_idPFH] call CBA_fnc_removePerFrameHandler;
                ["JIP teleport option lost, it has been two minutes since you spawned."] call ace_common_fnc_displayTextStructured;
            };
            if (player distance (UO_FW_GETMVAR(SpawnPos,(getpos player))) > _distance)exitwith {
                [player,1,["ACE_SelfActions","Jip_Transport_Action"]] call ace_interact_menu_fnc_removeActionFromObject;
                [_idPFH] call CBA_fnc_removePerFrameHandler;
                [["JIP teleport option lost, you went beyond %1 meters from your spawn location",_distance]] call ace_common_fnc_displayTextStructured;
            };
        }, 10, [_distance,CBA_missiontime]] call CBA_fnc_addPerFrameHandler;
    };
    default {};
};
