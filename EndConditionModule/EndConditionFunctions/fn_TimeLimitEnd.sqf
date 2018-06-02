_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{
    _message =_logic getVariable ["MessageArgument",""];
    _limit =_logic getVariable ["TimeLimitArgument",60];

    FW_TimeLimit = _limit;

    while {!FW_MissionEnded} do
    {
        if ((time / 60) >= FW_TimeLimit && FW_TimeLimit != 0) exitWith { //It is recommended that you do not remove the time limit end condition

            _message call UO_fnc_EndMission;

        };
        sleep(60);
    };

};
