_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{
    _timer =_logic getVariable ["AreaEndCheckTimeArgument",60];
    _faction =_logic getVariable ["FactionNameArgument",""];
    _percentage =_logic getVariable ["PercentageArgument",80];
    _message = missionNamespace getVariable ["AreaMessageArgument",""];
    while {!FW_MissionEnded} do
    {
        _casualty = _faction call UO_FNC_CasualtyPercentage; //Gets the casualty percentage of team "VDV"

        if (_casualty >= _percentage) exitWith
        {
             _message call UO_FNC_EndMission;
        };
        sleep(_timer);
    };


};
