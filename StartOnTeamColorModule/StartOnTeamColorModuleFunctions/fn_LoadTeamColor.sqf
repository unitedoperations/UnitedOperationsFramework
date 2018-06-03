
// Argument 0 is module logic.
_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{
    ["Start on team color", "Allows the mission maker to set the team colors in squads on start.", "Olsen"] call UO_FNC_RegisterModule;

    if (!isDedicated) then
    {

        "" spawn
        {

            private ["_color"];

            _color = player getVariable ["FW_TeamColor", "NONE"];

            sleep 0.01;

            if (_color != "NONE") then
            {

                ["CBA_teamColorChanged", [player, _color]] call CBA_fnc_globalEvent;

                player setVariable ["FW_TeamColor", nil, false];

            };

        };

    };
};
