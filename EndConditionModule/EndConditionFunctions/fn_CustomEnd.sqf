_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{
    _code =_logic getVariable ["CustomCodeArgument",""];
    _message =_logic getVariable ["MessageArgument",""];
    _timer =_logic getVariable ["AreaEndCheckTimeArgument",60];

    _cond = "if(" + _code + ") then { """ + _message + """ call OF_fnc_EndMission;};";
    _exec = compile _cond;  // compile ur string to function
    while {!FW_MissionEnded} do
    {

        "" call _exec;
        sleep(_timer);
    };
};
