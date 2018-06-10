_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{
    disconnect_control_time = _logic getVariable ["ControlTimeArgument",2];
    disconnect_control_sides = [];
    if((_logic getVariable ["BluforDeleteArgument",true])) then {disconnect_control_sides append [WEST];};
    if((_logic getVariable ["OpforDeleteArgument",true])) then {disconnect_control_sides append [EAST];};
    if((_logic getVariable ["IndforDeleteArgument",true])) then {disconnect_control_sides append [RESISTANCE];};
    if((_logic getVariable ["CivilianDeleteArgument",true])) then {disconnect_control_sides append [CIVILIAN];};

    ["Disconect Control", "Controls when player bodies should be deleted", "Olsen &amp; Perfk"] call UO_FNC_RegisterModule;

    ace_respawn_RemoveDeadBodiesDisconnected = false;

    if (isServer) then {
    	FW_EventDisconnectHandle_BodyCleanup = addMissionEventHandler ["HandleDisconnect", {_this call UO_FNC_EventDisconnect_BodyCleanup;}];
    };



};
