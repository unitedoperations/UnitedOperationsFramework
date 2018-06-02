private _vehs = _this;
if (typeName _vehs != "ARRAY") then {
    _vehs = [_vehs];
};
{
    [_x, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
    [_x, 1, ["ACE_SelfActions"], _unflipAction] call ace_interact_menu_fnc_addActionToObject;
} foreach _vehs;
