_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{
    _code =_logic getVariable ["CustomCodeArgument",""];
    _exec = compile _code;  // compile ur string to function
    _timer =_logic getVariable ["AreaEndCheckTimeArgument",60];

    while {!FW_MissionEnded} do
    {
        "" call _exec;
        sleep(_timer);
    };
};
