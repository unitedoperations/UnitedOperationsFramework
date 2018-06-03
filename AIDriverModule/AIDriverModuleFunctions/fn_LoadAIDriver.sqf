_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{
    ["AI drivers", "Adds AI commanded by players as drivers to vehicles.", "BlackHawk"] call UO_FNC_RegisterModule;
    private _action = ["ai_driver","Add/Remove AI driver","",{
        [_target, _player] call UO_fnc_aidriversToggle;
    },
    {
        vehicle _player == _target && ((assignedVehicleRole _player) select 0) == "Turret"
    }] call ace_interact_menu_fnc_createAction;

    private _unflipAction = ["ai_driver_unflip","Unflip vehicle","",{
        [_target, surfaceNormal position _target] remoteExec ["setVectorUp", 2, false];
        _target setPos [getpos _target select 0, getpos _target select 1, (getpos _target select 2) + 2];
    },
    {
        vehicle _player == _target && ((assignedVehicleRole _player) select 0) == "Turret" && {(vectorUp _target) select 2 < 0}
    }] call ace_interact_menu_fnc_createAction;

    VEHS = (_logic getVariable ["VehiclesArgument",[]]) call UO_fnc_StringArrayToArray;
    VEHS call UO_fnc_EnableAIDriver;
};
